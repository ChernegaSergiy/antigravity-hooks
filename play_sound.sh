#!/bin/bash
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOUNDS_DIR="$BASE_DIR/sounds"

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
  "pre-tool-call" | "PreToolUse")
    play_audio "$SOUNDS_DIR/r2d2_think.wav"
    ;;
  "post-tool-call" | "PostToolUse")
    play_audio "$SOUNDS_DIR/r2d2_post_tool.wav"
    ;;
  "pre-invocation" | "PreInvocation")
    play_audio "$SOUNDS_DIR/r2d2_pre_invoke.wav"
    ;;
  "post-invocation" | "PostInvocation")
    play_audio "$SOUNDS_DIR/r2d2_post_invoke.wav"
    ;;
  "loop-stop" | "Stop")
    play_audio "$SOUNDS_DIR/r2d2_done.wav"
    ;;
  "on-error")
    play_audio "$SOUNDS_DIR/r2d2_error.wav"
    ;;
esac
