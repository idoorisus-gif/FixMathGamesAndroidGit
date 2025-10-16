@echo off
chcp 65001 >nul

echo ==================================================
echo Build Release APK - Android-only
echo ==================================================
echo.

if not exist "pubspec.yaml" (
  echo [ERROR] pubspec.yaml not found. Run this script from the project root.
  pause
  exit /b 1
)

where flutter >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
  echo [ERROR] Flutter not found in PATH. Install Flutter and add to PATH.
  pause
  exit /b 1
)

echo.
echo Running: flutter clean
flutter clean

echo.
echo Running: flutter pub get
flutter pub get

echo.
echo Running: flutter build apk --release
flutter build apk --release
if %ERRORLEVEL% NEQ 0 (
  echo [ERROR] Build failed. See output above.
  pause
  exit /b 1
)

set "OUTDIR=build\app\outputs\flutter-apk"
if exist "%OUTDIR%" (
  echo [OK] Build finished. Opening output folder: %OUTDIR%
  start "" "%OUTDIR%"
) else (
  echo [WARNING] Output folder not found.
)

echo.
echo Done. Press any key to exit.
pause
exit /b 0
