@echo off
chcp 65001 >nul

echo ==================================================
echo Create Android platform (if missing) and run app
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

if not exist "android" (
  echo [INFO] Android folder not found. Creating Android platform...
  flutter create . --platforms=android
  if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] 'flutter create' failed. See output above.
    pause
    exit /b 1
  )
) else (
  echo [OK] android/ already exists.
)

echo.
echo Running flutter pub get...
flutter pub get

echo.
echo Running flutter run (debug) on first available device...
flutter run

echo.
echo Done. Press any key to exit.
pause
exit /b 0
