# 🎙️ Grabadora de Audio - App Nativa iOS

Una aplicación **nativa de iOS** desarrollada en **Swift + SwiftUI** para grabar, guardar y reproducir audio directamente en tu iPhone.

## ✨ Características

- 🎤 **Grabación de audio** de alta calidad (AAC, 44.1kHz)
- ⏸️ **Pausar y reanudar** grabaciones
- 💾 **Almacenamiento local** persistente
- 🎵 **Reproductor integrado** con barra de progreso
- 📱 **Diseño nativo** con SwiftUI
- 🗑️ **Eliminar grabaciones**
- ⏱️ **Temporizador en tiempo real**
- 📅 **Fecha y hora** de cada grabación
- 🎨 **Interfaz moderna** con gradientes y animaciones

## 🏗️ Arquitectura

### Modelos
- **Recording**: Modelo de datos para grabaciones

### Managers
- **AudioRecorderManager**: Maneja grabación con AVFoundation
- **AudioPlayerManager**: Maneja reproducción de audio
- **RecordingsManager**: Gestiona almacenamiento y persistencia

### Views
- **ContentView**: Vista principal de la app
- **RecordingView**: Interfaz de grabación
- **RecordingsList**: Lista de grabaciones con reproductor

## 🛠️ Tecnologías

- **Swift** - Lenguaje de programación
- **SwiftUI** - Framework de UI declarativa
- **AVFoundation** - Para grabación y reproducción de audio
- **Combine** - Para programación reactiva
- **UserDefaults** - Para persistencia de datos

## 📂 Estructura del Proyecto

```
GrabadoraAudio/
├── GrabadoraAudioApp.swift       # Punto de entrada
├── Models/
│   └── Recording.swift           # Modelo de grabación
├── Managers/
│   ├── AudioRecorderManager.swift
│   ├── AudioPlayerManager.swift
│   └── RecordingsManager.swift
├── Views/
│   ├── ContentView.swift
│   ├── RecordingView.swift
│   └── RecordingsList.swift
├── Assets.xcassets/              # Recursos visuales
└── Info.plist                    # Configuración y permisos
```

## 🚀 Cómo Empezar

Lee el archivo **[COMO_ABRIR_EN_XCODE.md](COMO_ABRIR_EN_XCODE.md)** para instrucciones completas sobre:
- Crear el proyecto en Xcode
- Compilar en el simulador
- Instalar en tu iPhone
- Publicar en App Store

## 📋 Requisitos

- macOS con Xcode 15+
- iOS 16.0+ (target deployment)
- Cuenta de Apple Developer ($99/año) para publicar en App Store

## 🔑 Permisos

La app requiere:
- **Micrófono**: Para grabar audio (NSMicrophoneUsageDescription)

## 🎯 Cómo Usar

1. **Grabar**: Toca el botón circular morado
2. **Pausar/Reanudar**: Usa los controles durante la grabación
3. **Detener**: Presiona el botón rojo de stop
4. **Reproducir**: Toca play en cualquier grabación de la lista
5. **Eliminar**: Toca el icono de papelera

## 📱 Capturas (Conceptuales)

```
┌─────────────────────┐
│   🎙️  Grabadora     │  ← Header
│ Graba, guarda y... │
├─────────────────────┤
│                     │
│   ┌───────────┐     │  ← Botón de grabación
│   │     🔴    │     │    (circular, animado)
│   └───────────┘     │
│ Presiona para grabar│
│                     │
├─────────────────────┤
│ Mis Grabaciones (3) │  ← Lista de grabaciones
│                     │
│ ┌─────────────────┐ │
│ │ 📅 15 Nov, 10:30│ │  ← Grabación individual
│ │ ▶️  ━━━━━━━  2:34│ │    con reproductor
│ └─────────────────┘ │
│                     │
└─────────────────────┘
```

## 🌟 Características Destacadas

### 1. Grabación de Alta Calidad
```swift
let settings: [String: Any] = [
    AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
    AVSampleRateKey: 44100.0,
    AVNumberOfChannelsKey: 2,
    AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
]
```

### 2. Interfaz Reactiva
Usando `@Published` y `ObservableObject` para actualizaciones en tiempo real

### 3. Persistencia Automática
Las grabaciones se guardan automáticamente y persisten entre sesiones

## 🆚 Diferencias con PWA

| Característica | PWA | App Nativa iOS |
|---------------|-----|----------------|
| App Store | ❌ No | ✅ Sí |
| Rendimiento | Bueno | Excelente |
| Acceso APIs | Limitado | Completo |
| Instalación | Safari | App Store |
| Costo publicación | Gratis | $99/año |
| Offline | ✅ Sí | ✅ Sí |
| Actualizaciones | Automáticas | App Store Review |

## 📄 Licencia

MIT

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Este es un proyecto educativo.

## 📞 Soporte

Para problemas con Xcode o publicación en App Store, consulta:
- [Documentación de Apple](https://developer.apple.com/documentation/)
- [Foros de Apple Developer](https://developer.apple.com/forums/)
- [Stack Overflow - iOS](https://stackoverflow.com/questions/tagged/ios)

---

Desarrollado con ❤️ en Swift + SwiftUI
