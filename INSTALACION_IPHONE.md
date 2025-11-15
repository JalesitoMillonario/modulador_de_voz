# 📱 Cómo Instalar la App en tu iPhone

## Paso 1: Preparar tu Mac

1. Abre la Terminal en tu Mac

2. Navega a la carpeta del proyecto:
```bash
cd /ruta/a/modulador_de_voz
```

3. Inicia el servidor:
```bash
npm run dev
```

4. Busca en la salida algo como: `Local: http://localhost:3000`

5. Encuentra tu IP local de tu Mac:
```bash
# Ejecuta este comando:
ifconfig | grep "inet " | grep -v 127.0.0.1

# Busca una IP que se vea como: 192.168.X.X o 10.0.X.X
```

## Paso 2: Conectar desde tu iPhone

**IMPORTANTE**: Tu iPhone y tu Mac deben estar en la MISMA red WiFi

1. En tu iPhone, abre **Safari** (debe ser Safari, no Chrome)

2. En la barra de direcciones escribe:
   ```
   http://TU_IP_DEL_MAC:3000
   ```
   Por ejemplo: `http://192.168.1.5:3000`

3. La app debería cargarse

4. Safari te pedirá permiso para usar el micrófono - **acepta**

## Paso 3: Instalar la App en tu iPhone

1. En Safari, con la app abierta, toca el botón **Compartir** (el cuadrito con la flecha hacia arriba) en la parte inferior

2. Desplázate hacia abajo y busca la opción **"Agregar a pantalla de inicio"**

3. Toca en esa opción

4. Puedes cambiar el nombre si quieres (por defecto será "Grabadora")

5. Toca **"Agregar"** en la esquina superior derecha

## Paso 4: Usar la App

1. Ve a tu pantalla de inicio del iPhone

2. Verás el icono de la app **Grabadora**

3. Toca el icono para abrirla

4. ¡Listo! Ahora funciona como una app nativa

## ✅ Ventajas de instalarla así:

- ✨ Se ve como una app nativa (sin barra de Safari)
- 📱 Tiene su propio icono en la pantalla de inicio
- 💾 Guarda todas tus grabaciones localmente
- 🔒 Funciona incluso sin conexión (después de la primera carga)
- 🚀 Carga más rápido

## ⚠️ Notas Importantes:

1. **El servidor debe estar corriendo**: Para usar la app, tu Mac debe tener el servidor corriendo (`npm run dev`)

2. **Misma red WiFi**: Tu iPhone y Mac deben estar conectados a la misma red

3. **Para producción (opcional)**: Si quieres que funcione sin tener el servidor corriendo:
   - Usa `npm run build`
   - Sube la carpeta `dist` a un hosting gratuito como:
     - [Vercel](https://vercel.com) (gratis, muy fácil)
     - [Netlify](https://netlify.com) (gratis, muy fácil)
     - [GitHub Pages](https://pages.github.com) (gratis)
   - Luego accede desde tu iPhone a la URL pública
   - Instala desde ahí y funcionará siempre

## 🆘 Problemas Comunes:

**No puedo conectar desde el iPhone:**
- Verifica que ambos dispositivos estén en la misma WiFi
- Verifica que usaste la IP correcta
- Intenta desactivar el firewall de tu Mac temporalmente

**No aparece "Agregar a pantalla de inicio":**
- Asegúrate de estar usando Safari (no Chrome u otro navegador)
- Recarga la página

**La app pide permisos cada vez:**
- Instálala en la pantalla de inicio
- Una vez instalada, los permisos se guardan

## 🌐 Desplegar en Internet (Gratis)

Si quieres que la app funcione desde cualquier lugar sin necesidad del Mac:

### Opción 1: Vercel (Recomendado)

1. Crea una cuenta gratis en [vercel.com](https://vercel.com)

2. Instala Vercel CLI:
```bash
npm i -g vercel
```

3. Despliega:
```bash
npm run build
vercel --prod
```

4. Te dará una URL pública como `https://tu-app.vercel.app`

5. Abre esa URL en Safari de tu iPhone e instala la app

### Opción 2: Netlify

1. Crea cuenta en [netlify.com](https://netlify.com)

2. Build tu app:
```bash
npm run build
```

3. Arrastra la carpeta `dist` a Netlify Drop

4. Listo, tendrás una URL pública

## 🎉 ¡Eso es todo!

Ahora tienes una app de grabadora profesional instalada en tu iPhone, completamente gratis y sin pasar por la App Store.
