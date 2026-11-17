#!/usr/bin/env bash
set -e

echo "=== 1. Verificando herramientas instaladas ==="
command -v node >/dev/null 2>&1 || { echo >&2 "ERROR: Node.js no está instalado."; exit 1; }
command -v java >/dev/null 2>&1 || { echo >&2 "ERROR: Java JDK 17 no está instalado."; exit 1; }

echo "=== 2. Instalando dependencias de Capacitor ==="
npm install

echo "=== 3. Sincronizando proyecto web (www/index.html) con Android ==="
npx cap sync android

echo "=== 4. Compilando APK (Debug y Release Firmado) ==="
cd android
chmod +x gradlew || gradle wrapper --gradle-version 8.2.1
./gradlew assembleDebug assembleRelease

echo "=== COMPILACION COMPLETADA ==="
echo "APK Debug:   android/app/build/outputs/apk/debug/app-debug.apk"
echo "APK Release: android/app/build/outputs/apk/release/app-release.apk"
