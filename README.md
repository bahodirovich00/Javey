# Javey

> A minimal JavaScript playground for Windows — write code on the left, see live output on the right.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=flat-square&logo=flutter&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=flat-square&logo=windows&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-white?style=flat-square)
![Zero deps](https://img.shields.io/badge/Dependencies-zero-4ADE80?style=flat-square)

---

## What it looks like

```
┌─────────────────────────────────────────────────────────────┐
│  Javey                                        —  ⬜  ✕     │
├──────────────────────────┬──────────────────────────────────┤
│  EDITOR              Run │  OUTPUT              ● running   │
│ ─────────────────────────│ ──────────────────────────────── │
│  1  // hello world       │  12:04:01  ▸ running script…     │
│  2                       │  12:04:01  Hello, World!         │
│  3  console.log(         │  12:04:01  Line 1                │
│  4    "Hello, World!"    │  12:04:02  Line 2                │
│  5  );                   │  12:04:02  ✓ exited with code 0  │
│                          │                                  │
└──────────────────────────┴───────────────────────────────────┘
```

---

## Features

- **Split panel** — editor on the left, live output on the right
- **Real-time streaming** — stdout and stderr appear line by line as your code runs
- **Timestamped output** — every line tagged with `hh:mm:ss`
- **Color-coded status** — green for success, red for errors, amber for stderr
- **Kill button** — stop any running process instantly
- **`Ctrl+Enter`** — run without touching the mouse
- **Glassmorphism dark UI** — frosted glass panels on a deep dark background
- **Zero external packages** — pure Flutter SDK, nothing to install

---

## Requirements

| Tool | Version |
|------|---------|
| [Flutter](https://docs.flutter.dev/get-started/install/windows) | 3.x stable |
| [Node.js](https://nodejs.org/) | any recent LTS |
| Windows | 10 / 11 x64 |

Node.js must be installed and available in your system `PATH`.

---

## Getting started

```bash
# 1. Enable Windows desktop support (once)
flutter config --enable-windows-desktop

# 2. Run in debug mode
flutter run -d windows

# 3. Build a release .exe
flutter build windows --release
```

The release binary will be at:
```
build\windows\x64\runner\Release\Javey.exe
```

---

## Usage

| Action | How |
|--------|-----|
| Run code | `Ctrl+Enter` or click **Run** |
| Stop a process | Click **Kill** |
| Clear the editor | Click **clear** next to the editor header |
| Clear the output | Click **clear** next to the output header |

---

## Project structure

```
lib/
├── main.dart           # Entry point, app theme, window setup
├── editor_screen.dart  # Panel where you will write code
└── js_runner.dart      # Runs Node.js, streams stdout/stderr
```

---

## How it works

1. You write JavaScript in the editor
2. On run, your code is written to a temp file
3. Dart spawns `node <tempfile>` using the `Process` API
4. `stdout` and `stderr` are decoded and streamed line by line into the output panel
5. State is managed with plain `ChangeNotifier` — no third-party packages needed

---

## License

MIT — do whatever you want with it.
