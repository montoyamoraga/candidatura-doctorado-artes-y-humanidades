#!/usr/bin/env bash
# convierte cada .svg en imagenes/ a un .pdf al lado, recortado al dibujo,
# para poder incluirlos con \includegraphics (pdflatex no lee svg).
# solo reconvierte si el svg es más nuevo que el pdf existente.
# requiere inkscape 1.x

set -euo pipefail

directorio_raiz="$(cd "$(dirname "$0")/.." && pwd)"

# en macOS inkscape no queda en el PATH por defecto
inkscape="$(command -v inkscape || echo /Applications/Inkscape.app/Contents/MacOS/inkscape)"

find "$directorio_raiz/imagenes" -name '*.svg' -print0 |
	while IFS= read -r -d '' archivo_svg; do
		archivo_pdf="${archivo_svg%.svg}.pdf"
		if [ ! -f "$archivo_pdf" ] || [ "$archivo_svg" -nt "$archivo_pdf" ]; then
			echo "convirtiendo ${archivo_svg#"$directorio_raiz"/}"
			"$inkscape" "$archivo_svg" \
				--export-type=pdf \
				--export-area-drawing \
				--export-filename="$archivo_pdf"
		fi
	done
