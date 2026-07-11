# Antigravity CLI Custom Hooks

[![License: CSSM Unlimited License v2.0](https://img.shields.io/badge/License-CSSM%20Unlimited%20License%20v2.0-blue.svg?logo=opensourceinitiative)](LICENSE)

This repository contains custom bash scripts that integrate with the Google Antigravity CLI lifecycle events to play adorable R2-D2 sound effects. The high-quality audio files used in this project are sourced from the [RCProps/R2-D2-Sounds](https://github.com/RCProps/R2-D2-Sounds/tree/master) collection.

### Installation

This repository is formatted as a native Antigravity CLI plugin. You can install it globally with a single command.

**Option 1: Install directly from GitHub (Recommended)**
```bash
agy plugin install https://github.com/ChernegaSergiy/antigravity-hooks
```

**Option 2: Clone and install locally**
```bash
git clone https://github.com/ChernegaSergiy/antigravity-hooks.git
cd antigravity-hooks
agy plugin install .
```

> [!NOTE]
> If you previously configured these hooks manually via the `/hooks` menu, please remove those manual entries to prevent double audio playback.

### Managing the Plugin

You can manage the plugin's lifecycle using the built-in Antigravity CLI plugin manager.

#### Muting via Environment Variable
If you only want to mute the sounds for a single terminal session or a specific command, you can set the `WALLE_SOUNDS_MUTE` environment variable:
```bash
export WALLE_SOUNDS_MUTE=1
agy "your task here"
```

#### Disabling the Plugin
If you need to temporarily mute the R2-D2 sounds (for example, during a meeting), you can disable the plugin without uninstalling it:
```bash
agy plugin disable walle-sounds
```

#### Enabling the Plugin
To turn the sounds back on, simply enable it again:
```bash
agy plugin enable walle-sounds
```

#### Uninstalling
If you wish to completely remove the plugin from your system, use the uninstall command:
```bash
agy plugin uninstall walle-sounds
```

### Supported Events
- `PreToolUse` (plays `r2d2_think.wav` by default)
  - *Special Case:* For `search_web`, it plays `r2d2_search.wav` (an "over here" scan sound) thanks to Antigravity CLI Tool Matchers!
  - *Special Case:* For `run_command`, it plays `r2d2_terminal.wav` (a "short circuit" work sound).
  - *Special Case:* For file editing tools (`replace_file_content`, `write_to_file`, etc.), it plays `r2d2_edit.wav` (an excited fix sound).
  - *Special Case:* For `ask_question`, it plays `r2d2_ask.wav` (a friendly, happy beep).
  - *Special Case:* For file system navigation (`view_file`, `list_dir`, `grep_search`), it plays `r2d2_scan.wav` (a short, quiet scan blip).
- `PostToolUse` (plays `r2d2_post_tool.wav`)
- `PreInvocation` (plays `r2d2_pre_invoke.wav`)
- `PostInvocation` (plays `r2d2_post_invoke.wav`)
- `Stop` (plays `r2d2_done.wav`)

### OS Compatibility

The `play_sound.sh` script is completely cross-platform and will automatically detect and use the appropriate audio player for your system under the hood:

- **Linux**: Automatically uses `pw-play` (PipeWire), `paplay` (PulseAudio), `aplay` (ALSA), or `ffplay`.
- **macOS**: Native support via the built-in `afplay` command.
- **Windows**: Uses native `powershell.exe` `Media.SoundPlayer` APIs (works perfectly when invoked from Git Bash or WSL via path conversion).

## Repository Structure

```text
antigravity-hooks/
+-- sounds/                   # R2-D2 audio files collection
|   +-- r2d2_done.wav         # Played on agent task completion
|   +-- r2d2_post_invoke.wav  # Played after LLM response
|   +-- r2d2_post_tool.wav    # Played after tool execution
|   +-- r2d2_pre_invoke.wav   # Played before sending prompt to LLM
|   \-- r2d2_think.wav        # Played before tool execution
+-- LICENSE                   # CSSM Unlimited License v2.0
+-- README.md                 # Documentation and installation guide
+-- hooks.json                # Antigravity CLI events configuration
+-- play_sound.sh             # Bash script to play sounds via PipeWire
\-- plugin.json               # Official Antigravity plugin manifest
```

## Contributing

Contributions are welcome and appreciated! Here's how you can contribute:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please make sure to update tests as appropriate and adhere to the existing coding style.

## License

This project is licensed under the CSSM Unlimited License v2.0 (CSSM-ULv2). See the [LICENSE](LICENSE) file for details.
