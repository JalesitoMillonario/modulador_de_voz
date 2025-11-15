# ⚡ Inicio Rápido - 5 Minutos

## 🎯 Objetivo

Tener la app corriendo en el simulador de iPhone en menos de 5 minutos.

## 📋 Pasos

### 1️⃣ Abre Xcode (1 min)

```bash
# En tu Mac, abre Xcode desde Launchpad o Spotlight
# Busca: "Xcode"
```

### 2️⃣ Crea Nuevo Proyecto (2 min)

1. **File → New → Project**
2. Selecciona: **iOS → App**
3. Configuración:
   ```
   Product Name: GrabadoraAudio
   Team: None (o tu equipo si tienes)
   Organization Identifier: com.miempresa
   Interface: SwiftUI
   Language: Swift
   ```
4. **Next** → Guarda en la carpeta `GrabadoraAudio`

### 3️⃣ Reemplaza Archivos (1 min)

En Xcode:

1. **Elimina** del proyecto (en el navegador izquierdo):
   - `ContentView.swift`
   - `GrabadoraAudioApp.swift`

2. **Arrastra** desde Finder a Xcode:
   - Toda la carpeta `GrabadoraAudio/GrabadoraAudio/`
   - Marca: ✅ Copy items if needed

### 4️⃣ Ejecuta (1 min)

1. En la barra superior, selecciona: **iPhone 15 Pro** (simulador)
2. Presiona **⌘R** (o clic en ▶️)
3. ¡Espera a que compile!

### 5️⃣ ¡Listo! 🎉

La app se abrirá en el simulador.

**NOTA**: El micrófono NO funciona en simulador. Para probar:
- Conecta tu iPhone real
- Selecciónalo en lugar del simulador
- Presiona ⌘R de nuevo

---

## 🚨 Si Algo Sale Mal

### Error: "No such module 'SwiftUI'"
- Asegúrate de crear un proyecto iOS (no macOS)

### Error: "Signing requires a development team"
- Ve a: **Signing & Capabilities** → Selecciona "None" en Team

### La app no compila
- **Product → Clean Build Folder** (⌘⇧K)
- Intenta de nuevo

### No veo los archivos en Xcode
- Asegúrate de haberlos arrastrado con "Copy items"
- Revisa que estén en el target "GrabadoraAudio"

---

## 📱 Para Probar en iPhone Real

1. **Conecta** tu iPhone con cable USB
2. **En iPhone**: Settings → General → Device Management → Confía en Mac
3. **En Xcode**: Selecciona tu iPhone (arriba)
4. **Presiona ⌘R**
5. **En iPhone**: Settings → General → Device Management → Confía en desarrollador

---

## 🎓 Siguiente Paso

Lee **[COMO_ABRIR_EN_XCODE.md](COMO_ABRIR_EN_XCODE.md)** para:
- Configuración detallada
- Publicar en App Store
- Solución de problemas avanzados

---

**¿Necesitas ayuda?**
- [Documentación de Xcode](https://developer.apple.com/documentation/xcode)
- [Tutoriales de SwiftUI](https://developer.apple.com/tutorials/swiftui)
