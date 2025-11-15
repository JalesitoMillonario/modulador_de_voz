# 🎙️ Grabadora de Voz - Aplicación Nativa iOS

Una aplicación nativa para iPhone desarrollada en Swift/SwiftUI que te permite grabar audio, guardar las grabaciones y reproducirlas directamente desde tu iPhone.

## ✨ Características

- 🎤 **Grabación de audio nativa** con el micrófono de tu iPhone
- 💾 **Almacenamiento local** - Las grabaciones se guardan en tu dispositivo
- 🎵 **Reproductor integrado** con barra de progreso interactiva
- 📱 **Diseño nativo iOS** con SwiftUI
- 🗑️ **Eliminar grabaciones** deslizando hacia la izquierda
- ⏱️ **Temporizador en tiempo real** durante la grabación
- 📅 **Fecha y hora** de cada grabación

## 📋 Requisitos

- **Mac** con macOS (necesario para compilar apps iOS)
- **Xcode** instalado (descárgalo gratis desde la App Store)
- **iPhone** con iOS 15.0 o superior
- **Cable USB** para conectar tu iPhone a tu Mac

## 🚀 Cómo Instalar la App en tu iPhone

### Paso 1: Instalar Xcode (si no lo tienes)

1. Abre la **App Store** en tu Mac
2. Busca **Xcode**
3. Haz clic en **Obtener** y luego en **Instalar**
4. Espera a que se descargue e instale (es grande, puede tardar un rato)

### Paso 2: Abrir el Proyecto

1. Abre **Finder** en tu Mac
2. Navega a la carpeta `ios-app`
3. **Doble clic** en el archivo `VoiceRecorder.xcodeproj`
4. Xcode se abrirá con el proyecto cargado

### Paso 3: Configurar tu Cuenta de Desarrollador

1. En Xcode, en el panel izquierdo, haz clic en **VoiceRecorder** (el icono azul en la parte superior)
2. En la pestaña **Signing & Capabilities**:
   - En **Team**, selecciona tu Apple ID
   - Si no aparece ningún equipo, haz clic en **Add Account...** e inicia sesión con tu Apple ID
   - Xcode automáticamente generará los certificados necesarios

### Paso 4: Conectar tu iPhone

1. **Conecta tu iPhone a tu Mac** con el cable USB
2. Si aparece un mensaje en tu iPhone diciendo "¿Confiar en este ordenador?", toca **Confiar**
3. Introduce el código de tu iPhone si te lo pide

### Paso 5: Seleccionar tu iPhone como Destino

1. En la parte superior de Xcode, busca el menú desplegable que dice el destino
2. Haz clic en él y selecciona **tu iPhone** (aparecerá con su nombre)

### Paso 6: Compilar e Instalar

1. Presiona el botón de **Play** (▶️) en la esquina superior izquierda de Xcode
   - O usa el atajo de teclado: **Cmd + R**
2. Xcode compilará la aplicación (puede tardar un minuto la primera vez)
3. La app se instalará automáticamente en tu iPhone

### Paso 7: Confiar en la Aplicación (Primera vez)

1. En tu iPhone, ve a **Configuración** > **General** > **Administración de dispositivos** (o **VPN y administración de dispositivos**)
2. Verás tu Apple ID bajo "App de desarrollador"
3. Tócalo y luego toca **Confiar en "[tu Apple ID]"**
4. Confirma tocando **Confiar**

### Paso 8: ¡Usar la App!

1. Ahora puedes abrir la app **VoiceRecorder** desde tu pantalla de inicio
2. La primera vez que la abras, te pedirá permiso para acceder al micrófono
3. Toca **Permitir**
4. ¡Ya estás listo para grabar!

## 🎯 Cómo Usar la App

### Grabar Audio

1. Toca el **botón rojo circular** grande
2. Empieza a hablar o grabar el audio que quieras
3. Verás el temporizador actualizándose en tiempo real
4. Toca el **botón cuadrado** para detener la grabación

### Reproducir Grabaciones

1. En la lista de grabaciones, toca el **botón de play** (▶️) azul
2. La grabación empezará a reproducirse
3. Usa la **barra de progreso** para saltar a diferentes partes
4. Toca el botón de **pausa** para pausar

### Eliminar Grabaciones

1. Desliza hacia la **izquierda** sobre cualquier grabación
2. Toca el botón **Eliminar** rojo
3. Confirma que quieres eliminar

## 🛠️ Tecnologías Usadas

- **Swift 5.0** - Lenguaje de programación
- **SwiftUI** - Framework de interfaz de usuario moderna
- **AVFoundation** - Para grabación y reproducción de audio
- **UserDefaults** - Para persistencia de metadatos
- **FileManager** - Para almacenamiento de archivos de audio

## ⚠️ Notas Importantes

- La app funciona **completamente offline** - no necesita internet
- Las grabaciones se guardan en formato **M4A** (AAC)
- Las grabaciones permanecen incluso si cierras la app
- La calidad de audio es **alta** (44.1 kHz, estéreo)
- El espacio de almacenamiento depende del espacio disponible en tu iPhone

## 🔧 Solución de Problemas

### "No se puede verificar la integridad de la app"
- Ve a Configuración > General > Administración de dispositivos y confía en tu desarrollador

### "No se puede instalar la app"
- Asegúrate de que tu iPhone esté desbloqueado
- Verifica que el cable USB esté bien conectado
- Reinicia Xcode y vuelve a intentarlo

### "La app se cierra al abrirla"
- Verifica que hayas dado permiso del micrófono
- Ve a Configuración > VoiceRecorder > Micrófono y actívalo

### "No puedo ver mi iPhone en Xcode"
- Desconecta y reconecta el cable
- Confía en el ordenador desde tu iPhone
- Reinicia tu iPhone y tu Mac

## 📱 Compatibilidad

- **iOS 15.0** o superior
- **iPhone** (optimizado para modo vertical)
- Compatible con todos los modelos de iPhone que soporten iOS 15+

## 🎨 Personalización

Si quieres modificar la app:

1. Abre el proyecto en Xcode
2. Edita los archivos `.swift` según tus necesidades
3. Los archivos principales son:
   - `ContentView.swift` - Interfaz principal
   - `AudioRecorderManager.swift` - Lógica de grabación
   - `AudioPlayerManager.swift` - Lógica de reproducción

## 📄 Licencia

MIT

---

¡Disfruta grabando tus audios directamente en tu iPhone! 🎤📱
