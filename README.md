# touchpad-gestures

Gestos de touchpad configurables para **KDE Plasma 6 (Wayland)**. Por defecto, deslizar 3 dedos hacia arriba sube el volumen y hacia abajo lo baja, con el OSD nativo de Plasma.

Incluye una interfaz (GTK4 + libadwaita) para elegir:

- **Sensibilidad** (1–10)
- **Número de dedos** (3 o 4)
- **Acción por dirección** (arriba / abajo / izquierda / derecha): volumen, silenciar, brillo, multimedia (play/pausa, siguiente, anterior, adelantar, retroceder), vista general, cuadrícula, mostrar escritorio, cambiar de escritorio virtual o un comando personalizado
- **Repetición continua** mientras deslizas (volumen, brillo, búsqueda)
- **Toque con 3 dedos**: cualquier acción de la lista (por defecto reproducir/pausar)

Los cambios se aplican al instante, sin reiniciar el servicio.

## Requisitos

- KDE Plasma 6 en Wayland
- `libinput` (`libinput-utils`), `qdbus`, Python 3
- `python3-gobject`, `gtk4`, `libadwaita` (solo para la interfaz)

## Instalación

```sh
git clone https://github.com/laopro/touchpad-gestures
cd touchpad-gestures
./install.sh
```

El instalador añade tu usuario al grupo `input`, necesario para leer los eventos del touchpad. El servicio usa `sg input` para funcionar sin reiniciar la sesión.

## Uso

- Configuración: abre **Gestos del touchpad** desde el menú o ejecuta `touchpad-gestures`
- Servicio: `systemctl --user status touchpad-gestures`
- Config: `~/.config/touchpad-gestures/config.json`

## Desinstalar

```sh
./uninstall.sh
```

## Cómo funciona

El daemon lee `libinput debug-events`, acumula el desplazamiento de los gestos *swipe* y dispara atajos globales de KDE vía D-Bus (`org.kde.kglobalaccel`). Así se usan las mismas acciones que el teclado, con su OSD.

## Licencia

MIT
