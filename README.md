# 📊 Attendance Planner 

> **Know exactly how many days you can safely miss and still stay above 80% or required attendance.**  
> Built for students of Punjab Group of Colleges (PGC) with 1-click portal scraping, group cloud sync, and smart exam protection.

---

## ✨ Features at a Glance

* 🎯 **80% Safety Guarantee:** Calculates the exact maximum number of days and lectures you can miss without dropping below the mandatory 80% cutoff.
* ⚡ **1-Click Portal Scrape:** Tap **Calculate** while on `my.pgc.edu/attend` to instantly pull your real-time attendance figures.
* ✨ **Simple Mode (Default):** Clean, distraction-free view with only what matters:
  * Days you can safely miss
  * Total skippable lecture cushion
  * Projected attendance percentage
  * Present / Absent / Leaves / Remaining breakdown
  * Section schedule summary (upcoming exams, prep study offs, official holidays)
* 🛠️ **Advanced Mode:** Power controls for section admins & organizers:
  * Custom planned leaves calendar
  * Exam date & prep study off editor
  * Fee installment cutoff manager
  * Group permission manager (Admin, Editor, Student)
* 🏖️ **Absence Strategy Switcher:**
  * **Max Days Off (Thu 1st):** Prioritizes 5-lecture Thursdays first so you get the highest total number of days off.
  * **Heavy Days First (6-lec 1st):** Prioritizes heavy 6-lecture days (Mon–Wed, Fri–Sat) so you skip exhausting packed schedules first.
* 📝 **Exam & Prep Off Protection:** Exams count as 1 lecture, and study prep days count as 0 lectures. Both are automatically protected from absence recommendations.
* 🌐 **Section Cloud Sync:** One student or CR inputs the exam dates and holidays—everyone in the section syncs automatically in real-time.

---

## 🚀 1-Click Installation Guide

No manual ZIP extracting or terminal knowledge needed! The 1-click script downloads and sets up everything for you.

### 🪟 Windows Setup (Easiest)

1. **Create an empty folder** anywhere on your computer (e.g. `Documents\Attendance`).
2. **Download [`windows-update.bat`](https://raw.githubusercontent.com/Colaup747/attendance-calc/main/windows-update.bat)** and place it into that folder.  
   *(Tip: Right-click the link above $\rightarrow$ **Save link as...** $\rightarrow$ save into your new folder).*
3. **Double-click `windows-update.bat`**.
   * It will download the latest version, unpack all required files, and open Chrome's Extensions page automatically!
4. **Load into Google Chrome:**
   * In Chrome, turn **ON** the **Developer mode** toggle in the top-right corner.
   * Click the **Load unpacked** button in the top-left corner.
   * Select your `Attendance` folder!
5. **Pin the extension:** Click the puzzle icon 🧩 in Chrome's top bar and pin **Attendance Planner** 📌!

---

### 🍎 macOS Setup

1. **Create an empty folder** (e.g. `Documents/Attendance`).
2. **Download [`mac-update.command`](https://raw.githubusercontent.com/Colaup747/attendance-calc/main/mac-update.command)** into that folder.
3. **Double-click `mac-update.command`**.
   * If macOS shows an *unidentified developer* warning: Right-click the file $\rightarrow$ select **Open** $\rightarrow$ click **Open**.
4. In Google Chrome (`chrome://extensions`):
   * Enable **Developer mode** in the top-right corner.
   * Click **Load unpacked** and select your `Attendance` folder.
5. Pin **Attendance Planner** 📌 to your toolbar!

---

## ⚡ How to Update (1-Click)

Whenever a new update is released, you will see an **Update Available** banner inside the extension:

1. Open your `Attendance` folder.
2. Double-click `windows-update.bat` (Windows) or `mac-update.command` (macOS).
3. Tap **⟳ Reload** inside the extension banner or in Chrome extensions!

That's it! All your attendance data and settings are safely preserved across updates.

---

## 📖 How to Use

1. Log into your PGC student portal at [**`my.pgc.edu/attend`**](https://my.pgc.edu/attend).
2. Click the **Attendance Planner** icon in your Chrome toolbar.
3. Tap **⟳ Calculate**.
4. The extension instantly computes:
   * **You Can Safely Miss:** Whole days you can take off without dropping below 80%.
   * **Lectures Skippable Total:** Your exact lecture safety cushion.
   * **Projected Attendance:** What your final percentage will be if you miss those days.
5. Tap **🏖️ Max Days** or **⚡ Heavy Days** to switch between maximizing total days off or skipping heavy days first.

---

## 🌐 Class Section Cloud Sync

Share your section's exam dates and study leaves so only one student needs to enter them:

1. Click **✨ Simple** in the top bar to switch to **🛠️ Advanced Mode**.
2. Go to the **Settings** tab $\rightarrow$ **Group Cloud Sync**.
3. Enter your section group code (e.g. `ICS-2A` or `FSC-1B`), your name, and a 4-digit PIN.
4. Tap **🔐 Join / Login**.
5. Once logged in:
   * Any student can tap **☁️ Save Changes to Cloud** in the **Exams** tab to publish exam dates and prep offs to the section.
   * All classmates in the group will receive the updated dates automatically!

---

## 🔒 Privacy & Security

* **100% Client-Side:** Calculations run directly in your browser.
* **No Password Storage:** Portal credentials are never collected, stored, or transmitted.
* **Open Source:** You can inspect all files (`popup.js`, `calc.js`, `content.js`) right in this repository.

---

## 👨‍💻 Developer & Contributions

* **Developer:** [Cola](https://github.com/ColaUp747)
* **Repository:** [github.com/ColaUp747/attendance-calc](https://github.com/ColaUp747/attendance-calc)
* Questions or suggestions? Open an Issue on GitHub!

