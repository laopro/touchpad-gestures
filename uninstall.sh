#!/bin/sh
systemctl --user disable --now touchpad-gestures.service 2>/dev/null
rm -f "$HOME/.local/bin/touchpad-gestures" \
      "$HOME/.config/systemd/user/touchpad-gestures.service" \
      "$HOME/.local/share/applications/touchpad-gestures.desktop"
systemctl --user daemon-reload
echo "Desinstalado (la configuración sigue en ~/.config/touchpad-gestures)."
