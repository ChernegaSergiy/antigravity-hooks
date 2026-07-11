# Antigravity CLI Custom Hooks

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

### Supported Events
- `PreToolUse` (plays `r2d2_think.wav`)
- `PostToolUse` (plays `r2d2_post_tool.wav`)
- `PreInvocation` (plays `r2d2_pre_invoke.wav`)
- `PostInvocation` (plays `r2d2_post_invoke.wav`)
- `Stop` (plays `r2d2_done.wav`)

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
