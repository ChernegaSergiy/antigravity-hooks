# Antigravity CLI Custom Hooks

This repository contains custom hooks and plugins for the [Google Antigravity CLI](https://antigravity.google/).

## R2-D2 Sounds Plugin

This plugin plays R2-D2 sound effects (sourced from [RCProps/R2-D2-Sounds](https://github.com/RCProps/R2-D2-Sounds/tree/master)) during different stages of the Antigravity CLI execution loop.

### Installation

This repository is formatted as a native Antigravity CLI plugin. You can install it globally with a single command:

```bash
agy plugin install /path/to/this/repository
```

*Note: If you previously configured these hooks manually via the `/hooks` menu, please remove those manual entries to prevent double audio playback.*

### Supported Events
- `PreToolUse` (plays `r2d2_think.wav`)
- `PostToolUse` (plays `r2d2_post_tool.wav`)
- `PreInvocation` (plays `r2d2_pre_invoke.wav`)
- `PostInvocation` (plays `r2d2_post_invoke.wav`)
- `Stop` (plays `r2d2_done.wav`)
