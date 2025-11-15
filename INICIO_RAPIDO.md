# 🚀 INICIO RÁPIDO - Instalar App en iPhone

## Pasos Simples:

### 1️⃣ En tu Mac (Terminal):

```bash
# Entra a la carpeta del proyecto
cd modulador_de_voz

# Instala (solo la primera vez)
npm install

# Inicia el servidor
npm run dev
```

### 2️⃣ Obtén tu IP local:

En otra terminal (o pestaña):

```bash
npm run ip
```

Te mostrará algo como:
```
📱 Tu IP local:
   http://192.168.1.5:3000

🔗 Abre esta URL en Safari de tu iPhone
```

### 3️⃣ En tu iPhone:

1. **Abre Safari** (debe ser Safari, no Chrome)

2. **Escribe la URL** que te dio el comando anterior
   - Ejemplo: `http://192.168.1.5:3000`

3. **Acepta** el permiso para usar el micrófono

4. **Toca el botón Compartir** (cuadrito con flecha ↑)

5. **Desplázate** y selecciona "Agregar a pantalla de inicio"

6. **Toca "Agregar"**

### 4️⃣ ¡Listo!

Ya tienes la app instalada en tu iPhone. Se ve y funciona como una app nativa.

---

## ⚠️ Importante:

- Tu Mac y iPhone deben estar en la **misma red WiFi**
- Usa **Safari** en iPhone (no otros navegadores)
- El servidor debe estar corriendo (`npm run dev`) para usar la app

## 💡 Para que funcione sin el servidor:

Lee [INSTALACION_IPHONE.md](INSTALACION_IPHONE.md) - sección "Desplegar en Internet"

Básicamente: sube la app a Vercel/Netlify (gratis) y accede desde la URL pública.
