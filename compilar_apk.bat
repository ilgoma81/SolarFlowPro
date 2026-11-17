@echo off
echo === 1. Instalando dependencias de Capacitor ===
call npm install
if %errorlevel% neq 0 exit /b %errorlevel%

echo === 2. Sincronizando proyecto web con Android ===
call npx cap sync android
if %errorlevel% neq 0 exit /b %errorlevel%

echo === 3. Compilando APK Release Firmado ===
cd android
if not exist gradlew.bat (
    call gradle wrapper --gradle-version 8.2.1
)
call gradlew.bat assembleRelease
if %errorlevel% neq 0 exit /b %errorlevel%

echo === COMPILACION COMPLETADA ===
echo APK generado en: android\app\build\outputs\apk\release\app-release.apk
pause
