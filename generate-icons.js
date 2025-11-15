// Script para generar instrucciones de cómo crear los iconos

console.log(`
Para generar los iconos necesarios para tu iPhone:

OPCIÓN 1 - Usar un generador online (MÁS FÁCIL):
1. Ve a https://realfavicongenerator.net/
2. Sube el archivo public/icon.svg
3. Descarga el paquete de iconos
4. Copia los archivos a la carpeta public/

OPCIÓN 2 - Crear iconos manualmente con herramientas de Mac:
1. Abre el archivo public/icon.svg en Preview (Vista Previa)
2. Ve a Archivo > Exportar
3. Selecciona formato PNG
4. Cambia la resolución a 192x192 píxeles y guarda como "icon-192.png"
5. Repite con 512x512 píxeles y guarda como "icon-512.png"
6. Repite con 180x180 píxeles y guarda como "apple-touch-icon.png"
7. Mueve todos los archivos PNG a la carpeta public/

OPCIÓN 3 - Usar ImageMagick (si lo tienes instalado):
brew install imagemagick
convert public/icon.svg -resize 192x192 public/icon-192.png
convert public/icon.svg -resize 512x512 public/icon-512.png
convert public/icon.svg -resize 180x180 public/apple-touch-icon.png

Los iconos necesarios son:
- icon-192.png (192x192) - Para Android y PWA
- icon-512.png (512x512) - Para Android y PWA
- apple-touch-icon.png (180x180) - Para iPhone/iPad

Mientras tanto, la app funcionará sin problemas, solo que usará un icono por defecto.
`);
