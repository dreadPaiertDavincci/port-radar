#!/usr/bin/env bash
set -euo pipefail

VERSION="1.0.0"
TAG="v${VERSION}"
BASE_URL="https://github.com/dreadPaiertDavincci/port-radar/releases/download/${TAG}"
ARCH="$(uname -m)"

echo "Installing Port Radar ${TAG} (${ARCH})..."

case "$ARCH" in
  x86_64|amd64)
    if command -v apt-get >/dev/null 2>&1 && command -v dpkg >/dev/null 2>&1; then
      TMP_DEB="$(mktemp /tmp/portradar-XXXXXX.deb)"
      echo "Detected Debian/Ubuntu. Downloading .deb package..."
      curl -fsSL -o "$TMP_DEB" "${BASE_URL}/PortRadar-${TAG}-linux-x64.deb"
      sudo apt-get install -y "$TMP_DEB"
      rm -f "$TMP_DEB"
      echo "Port Radar installed! Launch from your Applications menu or run: portradar"
    else
      INSTALL_DIR="${HOME}/.local/bin"
      mkdir -p "$INSTALL_DIR"
      TARGET="${INSTALL_DIR}/portradar"
      echo "Downloading Universal AppImage..."
      curl -fsSL -o "$TARGET" "${BASE_URL}/PortRadar-${TAG}-linux-x64.AppImage"
      chmod +x "$TARGET"
      echo "Installed to ${TARGET}"
      echo "Run with: ${TARGET}"
    fi
    ;;
  aarch64|arm64)
    INSTALL_DIR="${HOME}/.local/share/portradar"
    BIN_DIR="${HOME}/.local/bin"
    mkdir -p "$INSTALL_DIR" "$BIN_DIR"
    echo "Downloading Linux ARM64 archive..."
    curl -fsSL "${BASE_URL}/PortRadar-${TAG}-linux-arm64.tar.gz" | tar -xz -C "$INSTALL_DIR"
    chmod +x "${INSTALL_DIR}/PortWatch"
    ln -sf "${INSTALL_DIR}/PortWatch" "${BIN_DIR}/portradar"
    echo "Installed to ${INSTALL_DIR} (symlinked at ${BIN_DIR}/portradar)"
    echo "Run with: ${BIN_DIR}/portradar"
    ;;
  *)
    echo "Unsupported architecture: ${ARCH}"
    exit 1
    ;;
esac
