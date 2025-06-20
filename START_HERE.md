# 🚀 Welcome to PayrollPro! Let's Get You Started!

Hi there! So glad you're trying out PayrollPro! 😊

This little guide will help you get the system running on your computer in just a few simple steps. PayrollPro is designed to make managing salaries, taxes (like ZIMRA PAYE!), leave, and loans super easy for small and medium businesses in Zimbabwe.

Let's get started!

## 1. ✅ Before You Begin: Quick Check!

You'll need two small tools on your computer:

*   **Node.js (and npm)**: This is like the engine that makes PayrollPro run.
    *   *How to check if you have it?* Open your computer's command line (Terminal on Mac/Linux, or Command Prompt/PowerShell on Windows) and type `node --version`. If you see a version number (like v18.x.x), you're good!
    *   *Don't have it?* Download and install it from [nodejs.org](https://nodejs.org/) (we suggest the "LTS" version). Npm comes with Node.js.
*   **Git**: This helps download the PayrollPro files.
    *   *How to check if you have it?* In the command line, type `git --version`. If you see a version, great!
    *   *Don't have it?* Download and install it from [git-scm.com/downloads](https://git-scm.com/downloads).

Got those? Awesome! Let's move to the setup.

## 2. 🛠️ Super Simple 3-Step Setup!

We've made this as easy as possible!

1.  **Download PayrollPro**:
    *   If you got this as a ZIP file (e.g., from an email or a download link), great!
    *   If you're on GitHub, click the green "Code" button, then "Download ZIP".

2.  **Unzip the Folder**:
    *   Find the downloaded ZIP file (usually in your "Downloads" folder).
    *   Right-click on it and choose "Extract All..." (or "Unzip", "Uncompress", depending on your system).
    *   Choose a place on your computer to put the `PayrollPro` folder (like your Desktop or a "Projects" folder).

3.  **Run the Magic Setup Script! ✨**:
    *   Open the `PayrollPro` folder that you just unzipped.
    *   **If you're on Windows**: Double-click the file named `setup.bat`.
    *   **If you're on Mac or Linux**:
        1.  Open your Terminal.
        2.  Type `cd ` (with a space after `cd`) and then drag the `PayrollPro` folder from your file manager into the Terminal window. This will paste the folder path. Press Enter.
        3.  Now type `bash setup.sh` and press Enter.
            (If it says "permission denied", type `chmod +x setup.sh` first, press Enter, then try `bash setup.sh` again).

    This script will automatically install all the bits and pieces PayrollPro needs. It might take a few minutes, so grab a quick cup of tea! ☕ Just follow any instructions it gives you.

## 3. ▶️ How to Run PayrollPro

Once the setup script is finished and says "Setup Complete!":

1.  **Open your command line tool** (Terminal on Mac/Linux, Command Prompt or PowerShell on Windows).
2.  **Go into the PayrollPro folder**. If you're not already there from the setup script, use the `cd` command (e.g., `cd C:\Projects\PayrollPro` or `cd /Users/YourName/Projects/PayrollPro`).
3.  **Type this one command** and press Enter:
    ```
    npm run dev
    ```
4.  **Wait a moment!** You'll see some text scrolling in your command line. Look for a line that says something like:
    `➜ Local: http://localhost:5173/`
    That's the address for PayrollPro! (The number `5173` might be different if that port is busy, so always check what your terminal says).

5.  **Open your web browser** (like Chrome, Firefox, or Edge) and go to that address (e.g., `http://localhost:5173`).

Voila! You should see the PayrollPro login page. 🎉

## 4. 🔑 Your First Login

To get into the system for the first time:

*   **Username**: `admin`
*   **Password**: `admin123`

It's a good idea to change this password later in the "Settings" section of the app.

## 5. 📚 Want More Details?

This guide was just for getting started quickly! If you want to know more about all the features, advanced setup, or how the system works under the hood, check out the full `README.md` file in the main `PayrollPro` folder.

## 🆘 Uh Oh! Something Went Wrong?

Don't worry, it happens! Here are a few quick tips:

*   **Did you do the "Before You Begin" checks?** Make sure Node.js and npm are installed and working.
*   **Read the messages!** If the `setup.bat` or `setup.sh` script showed any red error messages, they might tell you what's wrong.
*   **Check the command line when you run `npm run dev`**. Are there any red error messages there?
*   **Browser Console**: If PayrollPro loads but looks strange or something doesn't work, press `F12` in your browser. This opens "Developer Tools". Click on the "Console" tab – any red messages there can be very helpful!
*   **Try again**: Sometimes, just closing the command line, reopening it, and running `npm run dev` again can fix small glitches.

If you're still stuck, the main `README.md` has a more detailed troubleshooting section, or you can ask the person who gave you PayrollPro for help.

---

We hope you find PayrollPro useful and easy to use! Happy Payroll-ing! 🎈
