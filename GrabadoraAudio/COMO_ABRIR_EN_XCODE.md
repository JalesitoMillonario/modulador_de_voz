# 📱 Cómo Abrir y Compilar en Xcode

Esta es una aplicación **nativa de iOS** escrita en **Swift + SwiftUI**. Para compilarla y subirla a la App Store, sigue estos pasos:

## 🛠️ Requisitos Previos

- ✅ Mac con macOS (necesario para Xcode)
- ✅ Xcode 15+ instalado (gratis en la App Store de Mac)
- ✅ Cuenta de desarrollador de Apple ($99/año para publicar en App Store)
- ✅ iPhone o iPad para pruebas (opcional, puedes usar el simulador)

## 📂 Paso 1: Crear el Proyecto en Xcode

**IMPORTANTE**: Los archivos Swift ya están creados, pero necesitas crear el proyecto de Xcode:

1. **Abre Xcode** en tu Mac

2. **Selecciona**: File → New → Project

3. **Plataforma**: iOS

4. **Template**: App

5. **Configuración del proyecto**:
   - Product Name: `GrabadoraAudio`
   - Team: Selecciona tu equipo (o None si no tienes cuenta de desarrollador aún)
   - Organization Identifier: `com.tuempresa` (usa tu dominio o cualquier identificador único)
   - Interface: **SwiftUI**
   - Language: **Swift**
   - Storage: **None**
   - Desmarca las opciones de Tests

6. **Guarda el proyecto** en la carpeta `GrabadoraAudio`

7. **IMPORTANTE**: Xcode creará algunos archivos por defecto. Necesitas **reemplazarlos** con los archivos que ya creé:

## 📋 Paso 2: Reemplazar Archivos

Una vez creado el proyecto en Xcode:

1. En el navegador de archivos de Xcode (panel izquierdo), **ELIMINA** estos archivos que Xcode creó:
   - `ContentView.swift` (lo reemplazaremos con el nuestro)
   - `GrabadoraAudioApp.swift` (lo reemplazaremos)

2. **Arrastra y suelta** a Xcode todos los archivos de la carpeta `GrabadoraAudio/GrabadoraAudio/`:
   - `GrabadoraAudioApp.swift`
   - Carpeta `Models/`
   - Carpeta `Managers/`
   - Carpeta `Views/`

3. Cuando Xcode pregunte, selecciona:
   - ✅ Copy items if needed
   - ✅ Create groups
   - ✅ Add to targets: GrabadoraAudio

4. **Reemplaza** el archivo `Info.plist`:
   - Elimina el Info.plist que creó Xcode
   - Arrastra el nuestro desde la carpeta

## ⚙️ Paso 3: Configurar el Proyecto

1. **Selecciona el proyecto** en el navegador (el icono azul de arriba)

2. En **"Signing & Capabilities"**:
   - Marca: ✅ Automatically manage signing
   - Team: Selecciona tu equipo de desarrollador

3. En **"General"**:
   - Display Name: `Grabadora`
   - Bundle Identifier: `com.tuempresa.GrabadoraAudio`
   - Version: `1.0`
   - Deployment Target: `iOS 16.0` (o superior)

4. **Permisos** (ya están en Info.plist):
   - ✅ NSMicrophoneUsageDescription: "Esta app necesita acceso al micrófono para grabar audio."

## 🏃 Paso 4: Ejecutar en el Simulador

1. En la barra superior de Xcode, selecciona un simulador:
   - iPhone 15 Pro (o cualquier iPhone)

2. **Presiona ⌘R** o haz clic en el botón ▶️ Play

3. La app debería compilar y abrirse en el simulador

**NOTA**: El micrófono NO funciona en el simulador, necesitas un iPhone real para probar la grabación.

## 📱 Paso 5: Ejecutar en tu iPhone Real

1. **Conecta tu iPhone** a tu Mac con un cable USB

2. **En tu iPhone**: Settings → General → VPN & Device Management → Confía en tu Mac

3. **En Xcode**: Selecciona tu iPhone en la barra superior (en lugar del simulador)

4. **Presiona ⌘R** para compilar e instalar en tu iPhone

5. **Primera vez**: En tu iPhone, ve a Settings → General → VPN & Device Management → Confía en el desarrollador

6. ¡Ya puedes usar la app en tu iPhone!

## 🚀 Paso 6: Publicar en App Store

### A. Crear App Store Connect

1. Ve a [App Store Connect](https://appstoreconnect.apple.com)

2. Inicia sesión con tu cuenta de desarrollador de Apple

3. Haz clic en **"My Apps"** → **"+"** → **"New App"**

4. Completa la información:
   - Platform: iOS
   - Name: Grabadora de Audio
   - Primary Language: Spanish
   - Bundle ID: Selecciona el mismo que usaste en Xcode
   - SKU: `grabadora-audio-001` (o cualquier identificador único)

5. Crea la app

### B. Preparar Screenshots y Metadata

Necesitas:
- **Screenshots** de la app (en diferentes tamaños de iPhone)
- **App Icon** de 1024x1024px
- **Descripción** de la app
- **Keywords** para búsqueda
- **Privacy Policy URL** (puedes usar un generador online gratuito)

### C. Archive y Upload

1. En Xcode, selecciona: **Generic iOS Device** en la barra superior

2. Ve a: **Product → Archive**

3. Espera a que compile (puede tardar unos minutos)

4. Cuando termine, se abrirá el **Organizer**

5. Selecciona el archive y haz clic en **"Distribute App"**

6. Selecciona: **App Store Connect**

7. Sigue el asistente y sube la app

8. Una vez subida, ve a App Store Connect y completa toda la información

9. **Envía para revisión**

10. Espera 1-3 días a que Apple revise tu app

## 💰 Costos

- **Cuenta de Desarrollador**: $99 USD/año
- **Publicar apps**: Gratis (incluido en la cuenta)
- **Updates**: Gratis

## 📚 Recursos Útiles

- [Documentación de SwiftUI](https://developer.apple.com/documentation/swiftui/)
- [App Store Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)

## 🐛 Solución de Problemas

**Error: "No signing certificate"**
- Ve a Xcode → Settings → Accounts
- Agrega tu cuenta de Apple Developer
- Descarga los certificados

**Error: "Provisioning profile doesn't include signing certificate"**
- En el proyecto, Settings → Signing & Capabilities
- Marca "Automatically manage signing"

**La app no aparece en mi iPhone**
- Revisa que hayas confiado en el desarrollador en Settings

**No puedo compilar**
- Product → Clean Build Folder (⌘⇧K)
- Cierra y reabre Xcode

## 🎉 ¡Listo!

Ahora tienes una app nativa de iOS que puedes:
- ✅ Instalar en tu iPhone
- ✅ Publicar en App Store
- ✅ Monetizar (si quieres)
- ✅ Distribuir a millones de usuarios

---

Si tienes dudas, consulta la [documentación oficial de Apple](https://developer.apple.com/documentation/).
