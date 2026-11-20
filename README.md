<div align="center">

# Port Radar

**See Every Active Port. Spot Conflicts. Kill Stuck Processes.**

A lightweight, 100% offline desktop monitor for inspecting live TCP/UDP ports, tracking watched development ports, detecting multi-process conflicts, and safely terminating blocking processes with local SQLite history.

[![Version](https://img.shields.io/badge/version-1.0.0-e11d48?style=flat-square)](https://github.com/dreadPaiertDavincci/port-radar/releases/latest)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-1e293b?style=flat-square)](#download)
[![Offline](https://img.shields.io/badge/privacy-100%25%20Offline%20%C2%B7%20Local%20SQLite-0f766e?style=flat-square)](#privacy--storage)

[Download Latest Release](https://github.com/dreadPaiertDavincci/port-radar/releases/latest) · [All Releases](https://github.com/dreadPaiertDavincci/port-radar/releases)

</div>

---

## Download

Choose the build for your operating system and architecture (**v1.0.0**):

| Platform | Architecture | Format | Download |
| :--- | :--- | :--- | :--- |
| **Windows 10 / 11** | `x64` (64-bit) | `.exe` (Standalone) | [PortRadar-v1.0.0-win-x64.exe](https://github.com/dreadPaiertDavincci/port-radar/releases/download/v1.0.0/PortRadar-v1.0.0-win-x64.exe) |
| **Windows 10 / 11** | `x86` (32-bit) | `.exe` (Standalone) | [PortRadar-v1.0.0-win-x86.exe](https://github.com/dreadPaiertDavincci/port-radar/releases/download/v1.0.0/PortRadar-v1.0.0-win-x86.exe) |
| **Windows 10 / 11** | `ARM64` | `.zip` (Portable) | [PortRadar-v1.0.0-win-arm64.zip](https://github.com/dreadPaiertDavincci/port-radar/releases/download/v1.0.0/PortRadar-v1.0.0-win-arm64.zip) |
| **macOS 13+** | Apple Silicon (`M1–M4` / `arm64`) | `.dmg` | [PortRadar-v1.0.0-osx-arm64.dmg](https://github.com/dreadPaiertDavincci/port-radar/releases/download/v1.0.0/PortRadar-v1.0.0-osx-arm64.dmg) |
| **macOS 13+** | Intel (`x64`) | `.dmg` | [PortRadar-v1.0.0-osx-x64.dmg](https://github.com/dreadPaiertDavincci/port-radar/releases/download/v1.0.0/PortRadar-v1.0.0-osx-x64.dmg) |
| **Linux (Debian / Ubuntu)** | `x64` (`amd64`) | `.deb` | [PortRadar-v1.0.0-linux-x64.deb](https://github.com/dreadPaiertDavincci/port-radar/releases/download/v1.0.0/PortRadar-v1.0.0-linux-x64.deb) |
| **Linux (Universal)** | `x64` | `.tar.gz` | [PortRadar-v1.0.0-linux-x64.tar.gz](https://github.com/dreadPaiertDavincci/port-radar/releases/download/v1.0.0/PortRadar-v1.0.0-linux-x64.tar.gz) |
| **Linux** | `ARM64` | `.tar.gz` | [PortRadar-v1.0.0-linux-arm64.tar.gz](https://github.com/dreadPaiertDavincci/port-radar/releases/download/v1.0.0/PortRadar-v1.0.0-linux-arm64.tar.gz) |

---

## Platform Details & Native Engines

Port Radar uses native OS inspection APIs and tools on each platform with zero external runtime dependencies (self-contained `.NET 10` + `Avalonia UI` binary):

### Windows (`10 / 11`)
- **Socket Inspection:** Live TCP & UDP endpoint scanning via `netstat` & IP Global Properties.
- **Process Details:** Full executable path resolution via Win32 `QueryFullProcessImageName`.
- **Privilege Handling:** Supports UAC elevation for inspecting system/service processes and terminating elevated blockers.

### macOS (`13 Ventura+`)
- **Socket Inspection:** Native `lsof` TCP/UDP port & PID inspection (`Apple Silicon` & `Intel`).
- **Process Management:** Process path resolution via `ps` and safe termination via `kill`.
- **Installation:** Open the `.dmg` and drag **Port Radar.app** into **Applications**.
  > **First launch note:** If macOS Gatekeeper warns about an unidentified developer, right-click **Port Radar.app** → **Open** (or run `xattr -cr "/Applications/Port Radar.app"`).

### Linux (`Ubuntu · Debian · Fedora · Arch`)
- **Socket Inspection:** Fast native socket scanning using `ss` and `/proc` fallback.
- **Process Management:** Executable resolution via `/proc/<pid>/exe` and `ps`, with safe termination.
- **Debian / Ubuntu install:**
  ```bash
  sudo apt install ./PortRadar-v1.0.0-linux-x64.deb
  ```
- **Tarball install:**
  ```bash
  tar -xzf PortRadar-v1.0.0-linux-x64.tar.gz
  chmod +x PortWatch
  ./PortWatch
  ```

---

## Key Features

- **Live TCP & UDP Monitoring:** Inspect Port, Protocol, State, IPv4/IPv6 addresses, Process Name, and PID with non-jumping in-place table updates (`1–60s` configurable auto-refresh).
- **Smart Conflict Detection:** Automatically flags ports shared by multiple PIDs with a `Conflict (N PIDs)` badge and dedicated filter.
- **Watched Ports Dashboard:** Pin key development ports (`3000`, `5432`, `8080`, etc.) to local SQLite and track `Free`, `In Use`, or `Conflict` status at a glance.
- **Newest First Sorting:** Newly opened ports and launched processes rise to the top with a `NEW` badge.
- **Two-Step Safe Kill:** Prevent accidental termination with an inline `Kill Process → Confirm Kill` confirmation bar.
- **Light & Dark Themes:** Built-in theme switching with persistent preferences.

---

## Privacy & Storage

- **100% Offline:** Port Radar never sends telemetry, usage data, or network diagnostics anywhere.
- **Local SQLite Database:** Watched ports, settings, and terminated process history are stored locally in `portwatch.db` on your machine.

---

<div align="center">
<sub>© 2026 Port Radar (PortWatch) · Built with .NET 10, Avalonia UI & SQLite</sub>
</div>
