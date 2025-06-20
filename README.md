# 👋 Welcome to PayrollPro!

Hi there! PayrollPro is a powerful yet easy-to-use payroll system designed especially for **small and medium-sized businesses in Zimbabwe**. It helps you manage your employees, calculate salaries (including ZIMRA taxes!), handle leave and loans, and generate professional payslips without the headache.

Think of it as your friendly helper for all things payroll! 😊

## ✨ What Can PayrollPro Do For You? (Key Features)

PayrollPro is packed with features to make your life easier:

*   👨‍👩‍👧‍👦 **Employee Management**: Easily add, update, and keep track of all your employee details.
*   🏢 **Department Management**: Organize your employees into departments.
*   💰 **Earnings & Benefits**: Define different types of pay like basic salary, allowances, and bonuses. You can set if they are taxable or non-taxable.
*   ➖ **Deductions**: Manage deductions like NSSA, medical aid, and union fees. Set them as fixed amounts or percentages.
*   🇿🇼 **Zimbabwe Tax Ready**: Automatically calculates PAYE based on the latest ZIMRA tax bands.
*   🏦 **Loan Management**: Keep track of employee loans and their repayment schedules.
*   ✈️ **Leave Management**: Manage annual leave, sick leave, and more, including an approval process.
*   📄 **Professional Payslips**: Generate beautiful, professional payslips for each employee. You can even customize the design!
*   ⚙️ **Powerful Settings**:
    *   Customize your company details and upload your logo.
    *   Update tax rates (PAYE, NSSA) as needed.
    *   Choose your preferred currency (USD or ZWD).
    *   Design your payslips to match your brand!
    *   Manage user accounts and their permissions.
*   📊 **Reports & Exports**: Get summaries of your payroll, tax reports, and export data to Excel or PDF.
*   🎨 **Modern & Responsive**: Looks great and works smoothly on computers, tablets, and phones.
*   🔒 **Secure**: Built with security in mind to protect your sensitive data.

## 🚀 Getting Started: Easy Setup!

Let's get PayrollPro up and running on your computer.

### ✅ What You'll Need (Prerequisites)

Before you start, make sure you have these two things installed:

1.  **Node.js**: This is a program that lets PayrollPro run. It also includes `npm`, which helps install other tools PayrollPro needs.
    *   📥 **Download Node.js here**: [https://nodejs.org/](https://nodejs.org/) (We recommend the LTS version).
2.  **Git**: This is a tool to help you download the PayrollPro files.
    *   📥 **Download Git here**: [https://git-scm.com/downloads](https://git-scm.com/downloads)

*How to check if you have them?* Open your computer's command prompt (Terminal on Mac/Linux, Command Prompt or PowerShell on Windows) and type `node --version` and then `npm --version`. If you see version numbers, you're good to go!

### 🚀 One-Click Setup (Recommended for Beginners!)

This is the easiest way to get started! We've created scripts to do most of the work for you.

1.  **Download PayrollPro**:
    *   Click the green "Code" button on the GitHub page where you found this.
    *   Choose "Download ZIP".
    *   Extract the ZIP file to a folder on your computer (e.g., `C:\Projects\PayrollPro` or `/Users/YourName/Projects/PayrollPro`).

2.  **Run the Setup Script**:
    *   Open the `PayrollPro` folder you just created.
    *   **For Windows users**: Double-click the `setup.bat` file.
    *   **For Linux or macOS users**: Open your Terminal, navigate to the `PayrollPro` folder (e.g., `cd /path/to/PayrollPro`), and run the command: `bash setup.sh` (You might need to make it executable first with `chmod +x setup.sh`).

    The script will check for Node.js/npm, install all necessary parts, and set up default configuration files. Just follow any on-screen instructions!

### 🛠️ Manual Setup (For Advanced Users or if the script fails)

If you prefer to set things up yourself, follow these steps:

1.  **Download (Clone) PayrollPro**:
    Open your command prompt or terminal and run:
    ```bash
    git clone https://github.com/your-username/payrollpro.git  # Replace with the actual GitHub URL
    cd payrollpro
    ```

2.  **Install Backend Parts**:
    In the main `payrollpro` folder, run:
    ```bash
    npm install
    ```

3.  **Install Frontend Parts**:
    Navigate to the `frontend` folder and run:
    ```bash
    cd frontend
    npm install
    cd .. 
    ``` (This takes you back to the main `payrollpro` folder)

4.  **Create Configuration Files**:
    *   **Backend**: In the main `payrollpro` folder, create a file named `.env`. Copy the content from `.env.example` (if it exists) or add this basic content:
        ```env
        # Backend Configuration
        PORT=3001
        NODE_ENV=development
        JWT_SECRET=your_super_secret_and_secure_payroll_key_please_change_this_for_production
        DATABASE_URL=./data/payroll.db

        # Frontend Configuration (accessible via import.meta.env in frontend code)
        VITE_API_BASE_URL=http://localhost:3001/api
        ```
        **Important**: For real use, change `JWT_SECRET` to something long and random!
    *   **Frontend**: In the `payrollpro/frontend` folder, create a file named `.env`. Add this content:
        ```env
        VITE_API_BASE_URL=http://localhost:3001/api
        ```

5.  **Create Backend Directories**:
    In the `payrollpro/backend` folder, create these sub-folders if they don't exist:
    *   `data` (for the database file)
    *   `logs` (for system logs)
    *   `uploads` (for things like company logos)

## ▶️ Running PayrollPro

Once setup is complete (either automated or manual):

1.  Open your command prompt or terminal in the main `payrollpro` folder.
2.  Run this single command:
    ```bash
    npm run dev
    ```
    This command starts both the backend (API server) and the frontend (web application).

3.  **Open Your Web Browser**:
    *   The frontend application will usually be available at: **http://localhost:5173**
    *   The backend API will be running at: http://localhost:3001 (You usually don't need to access this directly).

    Look at the terminal output from `npm run dev` – it will tell you the exact URL for the frontend (it might be a different port like 5174, 5175, etc., if 5173 is busy).

## 🔑 Your First Login

Welcome to PayrollPro! Here are the default login details to get you started:

*   **Username**: `admin`
*   **Password**: `admin123`

We strongly recommend changing the admin password immediately after your first login (you can do this in Settings).

## 🗺️ Exploring PayrollPro (A Quick Tour)

Once you log in, you'll see a beautiful dashboard and a navigation sidebar on the left. Here's a peek at what each main section does:

*   📊 **Dashboard**: Your main overview with key statistics like total employees, pending leave requests, and upcoming payroll information.
*   👥 **Employees**: Add new employees, view their details, and manage their records.
*   🏢 **Departments**: Create and manage different departments within your company.
*   💰 **Earnings**: Define various types of income for your employees (e.g., Basic Salary, Housing Allowance, Overtime). Mark them as taxable or recurring.
*   ➖ **Deductions**: Set up common deductions like NSSA, Medical Aid, or Pension. These can be fixed amounts or percentages.
*   🧾 **Tax**: Manage ZIMRA PAYE tax bands. The system comes pre-configured with current bands, but you can update them here.
*   🏦 **Loans**: Track employee loans, set up repayment schedules, and see outstanding balances.
*   ✈️ **Leave**: Manage different leave types (Annual, Sick, etc.), process employee leave requests, and track balances.
*   📄 **Payslips**: Generate professional payslips for your employees for any pay period. You can customize the design in Settings!
*   📈 **Reports**: View payroll summaries, tax reports, and export data to Excel or PDF.
*   ⚙️ **Settings**: This is where you control everything!
    *   **Branding**: Change the system name and upload your company logo.
    *   **Company Info**: Update your company's details.
    *   **Preferences**: Choose your display currency (USD/ZWD), date format, etc.
    *   **Payroll Config**: Set default payroll frequency, NSSA rates.
    *   **Payslip Design**: Customize how your payslips look! Change colors, layout, and what information is shown.
    *   And much more!

## 📸 Screenshots (Coming Soon!)

We'll add some pictures here soon to show you what PayrollPro looks like in action!

*   *(Placeholder: Dashboard Overview)*
*   *(Placeholder: Employee List)*
*   *(Placeholder: Professional Payslip Sample)*
*   *(Placeholder: Settings - Payslip Design Tab)*

## ❓ Having Trouble? (Troubleshooting)

Here are a few common issues and how to solve them:

*   **"Port 3001 is already in use" (or similar for port 5173)**:
    *   This means another program is using that port.
    *   You can either close the other program or change the port in the `.env` file (for backend) or try restarting your computer.
    *   If you change the backend port in `.env`, make sure to also update `VITE_API_BASE_URL` in `frontend/.env` to match!
*   **Node.js or npm not found**:
    *   Make sure you've installed Node.js correctly and that it's added to your system's PATH. You might need to restart your command prompt or computer after installing.
*   **Errors during `npm install`**:
    *   Check your internet connection.
    *   Try deleting the `node_modules` folder (in both `payrollpro` and `payrollpro/frontend`) and running `npm install` again.
    *   Sometimes, running `npm cache clean --force` can help.
*   **Blank page or errors after starting with `npm run dev`**:
    *   Open your browser's developer console (usually by pressing F12) and look for any error messages in the "Console" tab. These messages can often tell you what's wrong.
    *   Make sure both the backend (API on port 3001) and frontend (usually on port 5173) are running without errors in their respective terminal windows.

## 🤝 Need Help or Want to Contribute?

*   **Found a bug or have a feature request?** Please open an issue on the GitHub repository.
*   **Want to contribute?** We welcome pull requests! Please see our (upcoming) `CONTRIBUTING.md` file for guidelines.
*   **Need support?** For now, please refer to this README or open a GitHub issue.

## 📜 License

PayrollPro is open-source software licensed under the **MIT License**. You can find the full license text in the `LICENSE` file.

---

We hope you enjoy using PayrollPro! Happy Payroll-ing! 🎈
