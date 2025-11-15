# 🎙️ Grabadora de Audio - PWA para iPhone

Una **Progressive Web App** que funciona como una app nativa en tu iPhone. Graba audio con tu micrófono, guarda las grabaciones localmente y reprodúcelas cuando quieras.

## ✨ Características

- 🎤 **Grabación de audio** con tu micrófono del iPhone
- ⏸️ **Pausar y reanudar** grabaciones en proceso
- 💾 **Almacenamiento local** - tus grabaciones se guardan en tu dispositivo
- 🎵 **Reproductor integrado** con barra de progreso interactiva
- 📱 **Instalable en tu iPhone** - funciona como app nativa
- 🔌 **Funciona offline** - una vez instalada
- 🗑️ **Eliminar grabaciones** que ya no necesites
- ⏱️ **Temporizador en vivo** durante la grabación
- 📅 **Fecha y hora** de cada grabación

## 📱 INSTALAR EN TU IPHONE (Inicio Rápido)

### Opción 1: Desde tu red local (Mac + iPhone)

**⚠️ Lee el archivo [INSTALACION_IPHONE.md](INSTALACION_IPHONE.md) para instrucciones COMPLETAS paso a paso**

Resumen rápido:

1. **En tu Mac**, abre Terminal y ejecuta:
   ```bash
   npm install
   npm run dev
   npm run ip  # Te mostrará tu IP local
   ```

2. **En tu iPhone**, abre Safari y ve a:
   ```
   http://TU_IP:3000
   ```

3. **Instala la app**:
   - Toca el botón "Compartir" en Safari
   - Selecciona "Agregar a pantalla de inicio"
   - ¡Listo! Ya tienes la app en tu iPhone

### Opción 2: Despliega en Internet (Gratis y para Siempre)

Si quieres que funcione sin tener tu Mac prendida:

```bash
npm install
npm run build

# Luego sube la carpeta 'dist' a:
# - Vercel (recomendado): https://vercel.com
# - Netlify: https://netlify.com
# - GitHub Pages: https://pages.github.com
```

Después abre la URL pública en Safari de tu iPhone e instala desde ahí.

## 🎯 Cómo usar la app

1. **Grabar audio**:
   - Presiona el botón rojo circular para empezar a grabar
   - Dale permiso a tu navegador para usar el micrófono
   - Usa los botones para pausar o detener la grabación

2. **Reproducir audio**:
   - Toca el botón de play en cualquier grabación
   - Usa la barra de progreso para saltar a diferentes partes
   - Toca en cualquier punto de la barra para saltar a ese momento

3. **Eliminar grabaciones**:
   - Presiona el icono de papelera 🗑️
   - Confirma que quieres eliminar la grabación

## 🛠️ Tecnologías

- **React 18** - Framework de interfaz de usuario
- **Vite** - Build tool ultra rápido
- **MediaRecorder API** - Para grabar audio del micrófono
- **Web Audio API** - Para reproducción de audio
- **localStorage** - Para persistencia de datos

## ⚠️ Notas importantes

- Safari en iPhone requiere HTTPS en producción para acceder al micrófono
- Las grabaciones se guardan en formato WebM o MP4 según compatibilidad
- El almacenamiento está limitado por el localStorage de tu navegador (~5-10MB)
- Las grabaciones se mantienen incluso si cierras el navegador

## 🔧 Scripts disponibles

- `npm run dev` - Inicia servidor de desarrollo
- `npm run build` - Construye para producción
- `npm run preview` - Previsualiza el build de producción

## 📄 Licencia

MIT

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Siéntete libre de abrir issues o pull requests.

---

Hecho con ❤️ para grabar tus mejores momentos
