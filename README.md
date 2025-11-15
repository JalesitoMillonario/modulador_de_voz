# 🎙️ Grabadora de Audio - React App

Una aplicación web moderna y responsiva para iPhone que te permite grabar audio con tu micrófono, guardar las grabaciones y reproducirlas cuando quieras.

## ✨ Características

- 🎤 **Grabación de audio** con tu micrófono del iPhone
- ⏸️ **Pausar y reanudar** grabaciones en proceso
- 💾 **Almacenamiento local** - tus grabaciones se guardan en tu dispositivo
- 🎵 **Reproductor integrado** con barra de progreso interactiva
- 📱 **Diseño responsive** optimizado para iPhone
- 🗑️ **Eliminar grabaciones** que ya no necesites
- ⏱️ **Temporizador en vivo** durante la grabación
- 📅 **Fecha y hora** de cada grabación

## 🚀 Instalación

1. Instala las dependencias:
```bash
npm install
```

2. Inicia el servidor de desarrollo:
```bash
npm run dev
```

3. Abre tu navegador en la URL que se muestra (normalmente http://localhost:3000)

## 📱 Uso en iPhone

### Para usar en tu iPhone:

1. **Desarrollo local (red local)**:
   - Asegúrate de que tu iPhone y tu computadora están en la misma red WiFi
   - Encuentra tu IP local (en Mac/Linux: `ifconfig`, en Windows: `ipconfig`)
   - En tu iPhone, abre Safari y navega a `http://TU_IP:3000`
   - Cuando Safari pida permiso para usar el micrófono, acepta

2. **Agregar a pantalla de inicio** (opcional):
   - En Safari, toca el botón "Compartir"
   - Selecciona "Agregar a pantalla de inicio"
   - Ahora tendrás un icono de la app en tu iPhone

### Para producción:

```bash
npm run build
```

Luego despliega la carpeta `dist` en tu servicio de hosting favorito (Vercel, Netlify, etc.)

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
