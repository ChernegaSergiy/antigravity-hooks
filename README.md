# Antigravity CLI Custom Hooks

This repository contains custom hooks and plugins for the [Google Antigravity CLI](https://antigravity.google/).

## R2-D2 Sounds Plugin

This plugin plays R2-D2 sound effects during different stages of the Antigravity CLI execution loop.

### Installation

1. The sounds and scripts are managed here, but executed by the CLI.
2. In the CLI, run the `/hooks` command.
3. For each event (e.g. `PreInvocation`, `PostToolUse`), select `+ Add new hook...`
4. Set the command to point to the `play_sound.sh` script in this repository, passing the event name as an argument.

Example command for `PreInvocation`:
```bash
/home/serhii/Development/General/antigravity-hooks/play_sound.sh PreInvocation
```

### Supported Events
- `PreToolUse` (plays `r2d2_think.wav`)
- `PostToolUse` (plays `r2d2_post_tool.wav`)
- `PreInvocation` (plays `r2d2_pre_invoke.wav`)
- `PostInvocation` (plays `r2d2_post_invoke.wav`)
- `Stop` (plays `r2d2_done.wav`)
