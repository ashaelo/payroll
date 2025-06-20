@echo off
cls
title PayrollPro Setup Utility

REM Set colors
REM 0 = Black, 1 = Blue, 2 = Green, 3 = Aqua, 4 = Red, 5 = Purple, 6 = Yellow, 7 = White, 8 = Gray
REM A = Light Green, B = Light Aqua, C = Light Red, D = Light Purple, E = Light Yellow, F = Bright White

COLOR 0F

echo ================================================================================
echo  Welcome to the PayrollPro Setup Utility!
echo ================================================================================
echo.
echo This script will guide you through the setup process.
echo Please ensure you have an active internet connection for downloading dependencies.
echo.
echo Press any key to start the setup...
pause > nul

cls
echo ================================================================================
echo  Step 1: Checking Prerequisites
echo ================================================================================
echo.

REM Check for Node.js
echo Checking for Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    COLOR 4F
    echo [ERROR] Node.js is not installed or not found in your PATH.
    echo Please install Node.js (which includes npm) from https://nodejs.org/
    echo Setup cannot continue.
    goto :error_exit
)
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
COLOR 2F
echo [SUCCESS] Node.js found: %NODE_VERSION%
COLOR 0F
echo.

REM Check for npm
echo Checking for npm (Node Package Manager)...
npm --version >nul 2>&1
if errorlevel 1 (
    COLOR 4F
    echo [ERROR] npm is not installed or not found in your PATH.
    echo This usually comes with Node.js. Please try reinstalling Node.js.
    echo Setup cannot continue.
    goto :error_exit
)
for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
COLOR 2F
echo [SUCCESS] npm found: %NPM_VERSION%
COLOR 0F
echo.
echo Prerequisites check passed!
echo Press any key to continue with dependency installation...
pause > nul

cls
echo ================================================================================
echo  Step 2: Installing Dependencies
echo ================================================================================
echo.

REM Install backend dependencies
echo Installing backend dependencies (this may take a few minutes)...
npm install
if errorlevel 1 (
    COLOR 4F
    echo [ERROR] Failed to install backend dependencies. Please check your internet connection
    echo and ensure npm is working correctly. You can try running "npm install" manually
    echo in the root directory.
    goto :error_exit
)
COLOR 2F
echo [SUCCESS] Backend dependencies installed successfully.
COLOR 0F
echo.

REM Install frontend dependencies
echo Installing frontend dependencies (this may also take a few minutes)...
if not exist "frontend" (
    COLOR 4F
    echo [ERROR] "frontend" directory not found. Please ensure the project structure is correct.
    goto :error_exit
)
cd frontend
npm install
if errorlevel 1 (
    COLOR 4F
    echo [ERROR] Failed to install frontend dependencies. Please check your internet connection
    echo and ensure npm is working correctly. You can try running "npm install" manually
    echo in the "frontend" directory.
    cd ..
    goto :error_exit
)
cd ..
COLOR 2F
echo [SUCCESS] Frontend dependencies installed successfully.
COLOR 0F
echo.
echo All dependencies installed!
echo Press any key to continue with environment setup...
pause > nul

cls
echo ================================================================================
echo  Step 3: Setting up Environment Files and Directories
echo ================================================================================
echo.

REM Create backend .env file
echo Checking for backend .env file...
if not exist ".env" (
    echo Creating backend .env file with default settings...
    (
        echo # Backend Configuration
        echo PORT=3001
        echo NODE_ENV=development
        echo JWT_SECRET=your_super_secret_and_secure_payroll_key_please_change_this_for_production
        echo DATABASE_URL=./data/payroll.db
        echo.
        echo # Frontend Configuration (accessible via import.meta.env in frontend code)
        echo VITE_API_BASE_URL=http://localhost:3001/api
        echo.
        echo # Email Configuration (Optional - for features like password reset, notifications)
        echo # MAIL_HOST=smtp.example.com
        echo # MAIL_PORT=587
        echo # MAIL_USER=your_email_username
        echo # MAIL_PASS=your_email_password
        echo # MAIL_FROM=noreply@yourpayrollapp.com
    ) > .env
    COLOR 2F
    echo [SUCCESS] Backend .env file created.
    COLOR 0F
) else (
    COLOR EF
    echo [INFO] Backend .env file already exists. Skipping creation.
    COLOR 0F
)
echo.

REM Create frontend .env file
echo Checking for frontend .env file...
if not exist "frontend\.env" (
    echo Creating frontend .env file with default settings...
    (
        echo VITE_API_BASE_URL=http://localhost:3001/api
    ) > "frontend\.env"
    COLOR 2F
    echo [SUCCESS] Frontend .env file created.
    COLOR 0F
) else (
    COLOR EF
    echo [INFO] Frontend .env file already exists. Skipping creation.
    COLOR 0F
)
echo.

REM Create necessary directories for backend
echo Creating backend directories (data, logs, uploads)...
if not exist "backend\data" mkdir "backend\data"
if not exist "backend\logs" mkdir "backend\logs"
if not exist "backend\uploads" mkdir "backend\uploads"
COLOR 2F
echo [SUCCESS] Backend directories ensured.
COLOR 0F
echo.
echo Environment setup complete!
echo Press any key to view final instructions...
pause > nul

cls
echo ================================================================================
echo  PayrollPro Setup Complete!
echo ================================================================================
echo.
COLOR 2F
echo [SUCCESS] Your PayrollPro system has been set up successfully!
COLOR 0F
echo.
echo --------------------------------------------------------------------------------
echo  Next Steps:
echo --------------------------------------------------------------------------------
echo.
echo 1. To start the application (both backend and frontend):
echo    Open a new command prompt or terminal in this directory (%cd%)
echo    And run the command:
echo.
echo    COLOR E0
echo    npm run dev
echo    COLOR 0F
echo.
echo 2. Once started:
echo    - Backend API will be available at: http://localhost:3001
echo    - Frontend Application will be available at: http://localhost:5173 (or the next available port if 5173 is busy)
echo      (Please check the terminal output from "npm run dev" for the exact frontend URL)
echo.
echo 3. Default Admin Login:
echo    - Username: admin
echo    - Password: admin123
echo.
echo 4. (Important for Production)
echo    Before deploying to a production environment, please:
echo    - Change the JWT_SECRET in the .env file to a strong, unique secret key.
echo    - Configure your email settings in the .env file if you plan to use email features.
echo    - Review all configurations for security and performance.
echo.
echo ================================================================================
echo  Thank you for using PayrollPro!
echo ================================================================================
echo.
goto :end_success

:error_exit
echo.
COLOR CF
echo [ERROR] Setup failed. Please review the error messages above.
COLOR 0F
echo Press any key to exit.
pause > nul
exit /b 1

:end_success
echo Press any key to exit the setup utility.
pause > nul
exit /b 0
