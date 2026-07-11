#!/bin/bash
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOUNDS_DIR="$BASE_DIR/sounds"

# Check if sounds are muted globally
if [ "$WALLE_SOUNDS_MUTE" = "1" ] || [ "$WALLE_SOUNDS_MUTE" = "true" ]; then
    exit 0
fi

play_audio() {
    local file="$1"

    # Linux — PipeWire
    if command -v pw-play >/dev/null 2>&1; then
        pw-play "$file" >/dev/null 2>&1 && return
    fi
    # Linux — PulseAudio
    if command -v paplay >/dev/null 2>&1; then
        paplay "$file" >/dev/null 2>&1 && return
    fi
    # Linux — ALSA
    if command -v aplay >/dev/null 2>&1; then
        aplay -q "$file" >/dev/null 2>&1 && return
    fi
    # Linux/macOS — ffplay
    if command -v ffplay >/dev/null 2>&1; then
        ffplay -nodisp -autoexit "$file" >/dev/null 2>&1 && return
    fi
    # macOS — afplay
    if command -v afplay >/dev/null 2>&1; then
        afplay "$file" >/dev/null 2>&1 && return
    fi
    # Windows — PowerShell
    if command -v powershell.exe >/dev/null 2>&1; then
        powershell.exe -c "(New-Object Media.SoundPlayer '$file').PlaySync()" >/dev/null 2>&1 && return
    fi
}

case "$1" in
  "PreToolUseSearch")
    play_audio "$SOUNDS_DIR/r2d2_search.wav"
    ;;
  "PreToolUseTerminal")
    play_audio "$SOUNDS_DIR/r2d2_terminal.wav"
    ;;
  "PreToolUseEdit")
    play_audio "$SOUNDS_DIR/r2d2_edit.wav"
    ;;
  "PreToolUseScan")
    play_audio "$SOUNDS_DIR/r2d2_scan.wav"
    ;;
  "PreToolUseAsk")
    play_audio "$SOUNDS_DIR/r2d2_ask.wav"
    ;;
  "PreToolUsePermission")
    play_audio "$SOUNDS_DIR/r2d2_permission.wav"
    ;;
  "PreToolUse")
    play_audio "$SOUNDS_DIR/r2d2_think.wav"
    ;;
  "PostToolUse")
    play_audio "$SOUNDS_DIR/r2d2_post_tool.wav"
    ;;
  "PreInvocation")
    play_audio "$SOUNDS_DIR/r2d2_pre_invoke.wav"
    ;;
  "PostInvocation")
    play_audio "$SOUNDS_DIR/r2d2_post_invoke.wav"
    ;;
  "Stop")
    play_audio "$SOUNDS_DIR/r2d2_done.wav"
    ;;
  "OnError")
    play_audio "$SOUNDS_DIR/r2d2_error.wav"
    ;;
esac
