# ExtHunter

**ExtHunter** is a Bash-based passive reconnaissance utility that scans lists of gathered endpoints for file extensions that commonly indicate sensitive information leaks — such as `.env`, `.sql`, `.bak`, `.zip`, `.log`, and more.

## 🔍 Use Case

Ideal for bug bounty hunters, penetration testers, or OSINT analysts who already have gathered endpoints (via tools like `waybackurls`, `gau`, or `katana`) and want to filter out the juicy ones quickly.

---

## 📁 Folder Structure
ExtHunter/
├── grep_extensions.sh # Main script
├── Target/ # Input folder containing endpoint files per domain
│ ├── example.com.txt
│ └── testdomain.txt
├── Result/ # Output folder with filtered results
│ └── example.com_grep.txt


---

## 🚀 Features

- Scans for 50+ sensitive file extensions
- Filters input files placed inside `Target/` directory
- Automatically saves results in `Result/` with timestamps
- Auto-creates `Result/` folder if missing
- Lightweight, fast, and shell-script friendly

---

## 🔧 Installation

Clone the repo and give the script execute permissions:

```bash
git clone https://github.com/<your-username>/ExtHunter.git
cd ExtHunter
chmod +x grep_extensions.sh
```

---

## Useage 
Place any endpoint file (e.g., from waybackurls, gau, katana) in the Target/ folder.

Run the script:

```bash
./grep_extensions.sh
Enter the name of the file when prompted (e.g., example.com.txt).
```

Results will be saved to Result/matched_<timestamp>.txt.

--- 

## Extensions Covered
Includes common sensitive file types:

.env, .sql, .log, .bak, .zip, .tar, .gz, .json, .xml, .db, .conf, .key, .pem, .crt, .csr, .sh, .py, .php, .jsp, .aspx, .doc, .pdf, .xls, .csv, .ini, .cfg, .txt, .mp4, .mov, and more.

