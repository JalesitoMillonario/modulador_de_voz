#!/bin/bash

# Script para crear los iconos necesarios para la PWA
# Requiere ImageMagick: brew install imagemagick

echo "🎨 Generando iconos para PWA..."

# Verificar si ImageMagick está instalado
if ! command -v convert &> /dev/null; then
    echo "❌ ImageMagick no está instalado"
    echo "📦 Instalalo con: brew install imagemagick"
    echo ""
    echo "O usa la opción manual:"
    echo "1. Abre public/icon.svg en Preview (Vista Previa)"
    echo "2. Exporta como PNG con los siguientes tamaños:"
    echo "   - icon-192.png (192x192)"
    echo "   - icon-512.png (512x512)"
    echo "   - apple-touch-icon.png (180x180)"
    echo "3. Guarda todos en la carpeta public/"
    exit 1
fi

cd "$(dirname "$0")/.." || exit

echo "📐 Creando icon-192.png..."
convert public/icon.svg -resize 192x192 public/icon-192.png

echo "📐 Creando icon-512.png..."
convert public/icon.svg -resize 512x512 public/icon-512.png

echo "📐 Creando apple-touch-icon.png..."
convert public/icon.svg -resize 180x180 public/apple-touch-icon.png

echo "✅ ¡Iconos creados exitosamente!"
echo ""
echo "Archivos generados:"
echo "  ✓ public/icon-192.png"
echo "  ✓ public/icon-512.png"
echo "  ✓ public/apple-touch-icon.png"
