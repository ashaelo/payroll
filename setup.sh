#!/bin/bash

# Color definitions
C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'
C_CYAN='\033[0;36m'
C_WHITE_BOLD='\033[1;37m'

# Helper functions for colored output
print_header() {
    printf "${C_BLUE}================================================================================${C_RESET}\n"
    printf "${C_BLUE} %s ${C_RESET}\n" "$1"
    printf "${C_BLUE}================================================================================${C_RESET}\n\n"
}

print_success() {
    printf "${C_GREEN}[SUCCESS] %s${C_RESET}\n" "$1"
}

print_error() {
    printf "${C_RED}[ERROR] %s${C_RESET}\n" "$1"
}

print_info() {
    printf "${C_YELLOW}[INFO] %s${C_RESET}\n" "$1"
}

print_step() {
    printf "\n${C_CYAN}>>> Step %s: %s${C_RESET}\n\n" "$1" "$2"
}

wait_for_key() {
    read -n1 -s -r -p "Press any key to continue..."
    printf "\n"
}

# --- Welcome ---
clear
print_header "Welcome to the PayrollPro Setup Utility!"
printf "This script will guide you through the setup process for Linux/Mac.\n"
printf "Please ensure you have an active internet connection for downloading dependencies.\n\n"
wait_for_key

# --- Step 1: Prerequisites Check ---
clear
print_step "1" "Checking Prerequisites"

# Check for Node.js
printf "Checking for Node.js...\n"
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed or not found in your PATH."
    printf "Please install Node.js (which includes npm) from https://nodejs.org/\n"
    printf "Setup cannot continue.\n"
    exit 1
fi
NODE_VERSION=$(node --version)
print_success "Node.js found: ${NODE_VERSION}"
printf "\n"

# Check for npm
printf "Checking for npm (Node Package Manager)...\n"
if ! command -v npm &> /dev/null; then
    print_error "npm is not installed or not found in your PATH."
    printf "This usually comes with Node.js. Please try reinstalling Node.js.\n"
    printf "Setup cannot continue.\n"
    exit 1
fi
NPM_VERSION=$(npm --version)
print_success "npm found: ${NPM_VERSION}"
printf "\n"

print_success "Prerequisites check passed!"
wait_for_key

# --- Step 2: Installing Dependencies ---
clear
print_step "2" "Installing Dependencies"

# Install backend dependencies
printf "Installing backend dependencies (this may take a few minutes)...\n"
if npm install; then
    print_success "Backend dependencies installed successfully."
else
    print_error "Failed to install backend dependencies. Please check your internet connection"
    printf "and ensure npm is working correctly. You can try running \"npm install\" manually\n"
    printf "in the root directory (%s).\n" "$(pwd)"
    exit 1
fi
printf "\n"

# Install frontend dependencies
printf "Installing frontend dependencies (this may also take a few minutes)...\n"
if [ ! -d "frontend" ]; then
    print_error "\"frontend\" directory not found. Please ensure the project structure is correct."
    exit 1
fi

cd frontend
if npm install; then
    print_success "Frontend dependencies installed successfully."
else
    print_error "Failed to install frontend dependencies. Please check your internet connection"
    printf "and ensure npm is working correctly. You can try running \"npm install\" manually\n"
    printf "in the \"frontend\" directory.\n"
    cd ..
    exit 1
fi
cd .. # Go back to root directory
printf "\n"

print_success "All dependencies installed!"
wait_for_key

# --- Step 3: Setting up Environment Files and Directories ---
clear
print_step "3" "Setting up Environment Files and Directories"

# Create backend .env file
printf "Checking for backend .env file...\n"
if [ ! -f ".env" ]; then
    printf "Creating backend .env file with default settings...\n"
    cat > .env << EOF
# Backend Configuration
PORT=3001
NODE_ENV=development
JWT_SECRET=your_super_secret_and_secure_payroll_key_please_change_this_for_production
DATABASE_URL=./data/payroll.db

# Frontend Configuration (accessible via import.meta.env in frontend code)
VITE_API_BASE_URL=http://localhost:3001/api

# Email Configuration (Optional - for features like password reset, notifications)
# MAIL_HOST=smtp.example.com
# MAIL_PORT=587
# MAIL_USER=your_email_username
# MAIL_PASS=your_email_password
# MAIL_FROM=noreply@yourpayrollapp.com
EOF
    print_success "Backend .env file created."
else
    print_info "Backend .env file already exists. Skipping creation."
fi
printf "\n"

# Create frontend .env file
printf "Checking for frontend .env file...\n"
if [ ! -f "frontend/.env" ]; then
    printf "Creating frontend .env file with default settings...\n"
    cat > frontend/.env << EOF
VITE_API_BASE_URL=http://localhost:3001/api
EOF
    print_success "Frontend .env file created."
else
    print_info "Frontend .env file already exists. Skipping creation."
fi
printf "\n"

# Create necessary directories for backend
printf "Creating backend directories (data, logs, uploads)...\n"
mkdir -p backend/data
mkdir -p backend/logs
mkdir -p backend/uploads
print_success "Backend directories ensured."
printf "\n"

print_success "Environment setup complete!"
wait_for_key

# --- Final Instructions ---
clear
print_header "PayrollPro Setup Complete!"
print_success "Your PayrollPro system has been set up successfully!"
printf "\n"

printf "${C_WHITE_BOLD}--------------------------------------------------------------------------------${C_RESET}\n"
printf "${C_WHITE_BOLD} Next Steps:${C_RESET}\n"
printf "${C_WHITE_BOLD}--------------------------------------------------------------------------------${C_RESET}\n\n"

printf "1. To start the application (both backend and frontend):\n"
printf "   Open a new terminal in this directory (${C_YELLOW}%s${C_RESET})\n" "$(pwd)"
printf "   And run the command:\n\n"
printf "   ${C_YELLOW}npm run dev${C_RESET}\n\n"

printf "2. Once started:\n"
printf "   - Backend API will be available at: ${C_CYAN}http://localhost:3001${C_RESET}\n"
printf "   - Frontend Application will be available at: ${C_CYAN}http://localhost:5173${C_RESET}\n"
printf "     (or the next available port if 5173 is busy - check terminal output from \"npm run dev\")\n\n"

printf "3. Default Admin Login:\n"
printf "   - Username: ${C_YELLOW}admin${C_RESET}\n"
printf "   - Password: ${C_YELLOW}admin123${C_RESET}\n\n"

printf "4. ${C_RED}(Important for Production)${C_RESET}\n"
printf "   Before deploying to a production environment, please:\n"
printf "   - Change the ${C_YELLOW}JWT_SECRET${C_RESET} in the .env file to a strong, unique secret key.\n"
printf "   - Configure your email settings in the .env file if you plan to use email features.\n"
printf "   - Review all configurations for security and performance.\n\n"

print_header "Thank you for using PayrollPro!"
printf "\n"
printf "Press any key to exit the setup utility.\n"
wait_for_key
exit 0
