@echo off
echo ==========================================
echo  VULCAN WALLET - Rust Wallet Crate
echo ==========================================
echo.
echo Starting Vulkan Wallet...

if exist "Cargo.toml" (
    echo [OK] Cargo.toml found
) else (
    echo [ERROR] Cargo.toml not found!
    pause
    exit /b 1
)

echo.
echo Building wallet...
cargo build

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Build failed!
    pause
    exit /b 1
)

echo.
echo Running tests...
cargo test

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Tests failed!
    pause
    exit /b 1
)

echo.
echo ==========================================
echo  Wallet build and tests complete!
echo ==========================================
pause