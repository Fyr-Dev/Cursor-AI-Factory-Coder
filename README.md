# AI Coding Factory - Full Setup Guide

## What's Included

- **setup_project.sh** — Initializes project, PRD, Memory Bank, Taskmaster
- **populate_memory_bank.sh** — Auto-fills Memory Bank based on PRD
- **task_dashboard.sh** — Monitor and manage task execution live
- **prioritize_tasks.sh** — Prioritize tasks by complexity
- **Makefile** — Simplified orchestration of all actions
- **cursor_mode_ai_project_agent.json** — Pre-built Cursor Custom Mode
- **memory_bank/** — Folder structure for project memory
- **scripts/** — Scripts folder for PRD, tasks, complexity report

## Setup Instructions

### 1. Unzip Package
Extract this package into your working directory.

### 2. Make Scripts Executable
In the terminal:
```bash
chmod +x setup_project.sh populate_memory_bank.sh task_dashboard.sh prioritize_tasks.sh
```

### 3. Build Your Project
```bash
make build
```
- Initializes folders and PRD.
- Sets up Memory Bank.
- Parses PRD into tasks.

### 4. Populate Memory Bank
```bash
make populate
```

### 5. Prioritize Tasks
```bash
make prioritize
```

### 6. Start Live Task Dashboard
```bash
make monitor
```

### 7. Import Cursor Custom Mode
1. Open Cursor IDE → Settings → Custom Modes.
2. Click "Import Custom Mode".
3. Select `cursor_mode_ai_project_agent.json`.
4. Activate "AI Project Agent" mode.

**This makes your Cursor agent fully context-aware, memory-based, and task-driven.**

### 8. Operate Your AI Project
- After each task, the Cursor agent will update the Memory Bank automatically.
- Errors will trigger self-reflection and new Cursor Rule creation.

## Important Requirements

Install if missing:
```bash
sudo apt-get install jq bc
```

- **Taskmaster AI** should be installed:
```bash
npm install -g taskmaster-ai
```

- Recommended Models: GPT-4, Gemini 1.5 Pro, Claude 3 Sonnet
- Turn ON Auto-run and YOLO Mode in Cursor Settings.

## Maintenance Commands

| Command | Action |
|:-------:|:------:|
| `make build` | Build Project |
| `make populate` | Populate Memory Bank |
| `make prioritize` | Prioritize tasks |
| `make monitor` | Launch Task Dashboard |
| `make full_clean` | Reset everything |

---

# Best Practice: After Every 5-10 Tasks
Prompt:
```plaintext
Reflect on recent errors. Create new Cursor Rules to prevent similar mistakes.
```

---

## Result
A fully autonomous, memory-driven AI agent that can develop complex software reliably with minimal human input.

