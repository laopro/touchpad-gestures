#!/bin/sh
set -e
cd "$(dirname "$0")"
install -Dm755 touchpad-gestures "$HOME/.local/bin/touchpad-gestures"
install -Dm644 touchpad-gestures.service "$HOME/.config/systemd/user/touchpad-gestures.service"
sed "s|^Exec=.*|Exec=$HOME/.local/bin/touchpad-gestures|" touchpad-gestures.desktop \
  | install -Dm644 /dev/stdin "$HOME/.local/share/applications/touchpad-gestures.desktop"
if ! getent group input | grep -qw "$USER"; then
  echo "Añadiendo $USER al grupo 'input' (pide contraseña)..."
  sudo usermod -aG input "$USER"
fi
systemctl --user daemon-reload
systemctl --user enable --now touchpad-gestures.service
echo "Listo. Abre 'Gestos del touchpad' desde el menú para configurarlo."
