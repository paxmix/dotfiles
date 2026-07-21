#!/bin/sh

SCRIPT="Niri Window Picker"
WINDOW_INFO=$(niri msg --json pick-window 2>/dev/null)

if [ "$WINDOW_INFO" = "null" ]; then
    notify-send -a "$SCRIPT" -u low "Window Selection Canceled"
    exit 0
fi

APP_ID=$(echo "$WINDOW_INFO" | jq -r '.["app_id"] // "Unknown App"')
TITLE=$(echo "$WINDOW_INFO" | jq -r '.title // "Untitled Window"')

notify-send \
    -a "Niri Window Picker" \
    -i "$APP_ID" \
    "Selected Window" \
    "<b>App ID:</b> $APP_ID\n<b>Title:</b> $TITLE"
