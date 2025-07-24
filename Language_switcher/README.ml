# Language Switcher

This is a lightweight AutoHotkey v2 script that allows you to **switch keyboard layout and convert mistyped text** between English and Hebrew with a single hotkey.

## 🧠 What It Does

If you accidentally type in the wrong keyboard layout (e.g., typing "akuo" instead of "שלום"), just hit \`Ctrl + \`\` (Control + backtick) and the script will:

1. **Select all text**
2. **Copy it to the clipboard**
3. **Detect your current keyboard layout** (English or Hebrew)
4. **Convert the characters** to the correct layout (while preserving upper/lowercase)
5. **Switch the Windows keyboard layout**
6. **Paste the converted text back**
7. **Move the cursor to the end so you can continue writing naturally**

## 🔑 Hotkey

* \`Ctrl + \`\`: Toggle conversion and switch layout

## 🪵 Debug Mode

* Logs each action to `debug_log.txt` in the same directory.
* You can enable/disable debug logs by editing this line in the script:

  ```ahk
  global debug := true  ; set to false to disable logging
  ```

## 🧩 Requirements

* Windows 10/11
* [AutoHotkey v2](https://www.autohotkey.com/)

## ▶️ How to Use

### Option 1: With AutoHotkey Installed

1. Install [AutoHotkey v2](https://www.autohotkey.com/download/)
2. Double-click `Language_Switcher.ahk` to run
3. Press \`Ctrl + \`\` inside any text field (Notepad, browser, etc.)

### Option 2: Compile to `.exe`

1. Open the folder where AutoHotkey is installed
2. Launch `Ahk2Exe.exe`
3. Select `Language_Switcher.ahk` as source
4. Click “Convert”
5. Share the resulting `.exe` file with friends — they don’t need AHK installed!

## ⚠️ Notes

* Works best in **Notepad**, **ChatGPT**, and many standard Windows apps
* **WhatsApp Desktop** works one-way (English ➝ Hebrew)
* **Notepad++** is currently not supported (inconsistent control handling)

---

## 📂 Folder Contents

* `Language_Switcher.ahk` – The main script
* `debug_log.txt` – Logs (created when script runs)
* `README.md` – This file

---

## 💡 Coming Soon (Optional Features)

* Tray icon with pause/exit options
* Convert only current word
* Auto-detect input field type
* Online update checking

Feel free to fork or contribute on GitHub!
