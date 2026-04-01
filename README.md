# nginx-log-analyser
Tool to analyze logs from the command line
# 📊 Nginx Log Analyser

A simple shell script to analyze Nginx access log files from the command line.

![Shell Script](https://img.shields.io/badge/Shell-Bash-green?logo=gnu-bash)
![License](https://img.shields.io/badge/License-MIT-blue)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-lightgrey)

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Output Example](#output-example)
- [How It Works](#how-it-works)
- [License](#license)

---

## 🔍 Overview
PROJECT LINK https://roadmap.sh/projects/nginx-log-analyser
---

## ✨ Features

- ✅ Top 5 IP addresses with the most requests
- ✅ Top 5 most requested paths
- ✅ Top 5 response status codes
- ✅ Top 5 user agents

---

## 🛠 Requirements

- Bash `4.0+`
- Standard Unix tools: `awk`, `sort`, `uniq`, `head`
- A valid Nginx access log file

---

## 📦 Installation

```bash
# Clone the repository
git clone https://github.com/your-username/nginx-log-analyser.git

# Navigate into the directory
cd nginx-log-analyser

# Give execute permission to the script
chmod +x analyze_logs.sh
```

---

## 🚀 Usage

```bash
./analyze_logs.sh <path-to-nginx-log-file>
```

**Example:**

```bash
./analyze_logs.sh /var/log/nginx/access.log
```

---

## 📤 Output Example

```
================================================
 Top 5 IP Addresses with Most Requests
================================================
  192.168.1.1          4 requests
  192.168.1.2          3 requests
  192.168.1.6          2 requests
  192.168.1.5          2 requests
  192.168.1.4          2 requests

================================================
 Top 5 Most Requested Paths
================================================
  /index.html                    7 requests
  /about.html                    3 requests
  /api/login                     2 requests
  /products.html                 1 requests
  /contact.html                  1 requests

================================================
 Top 5 Response Status Codes
================================================
  200        11 times
  404        1 times
  500        1 times
  401        1 times
  301        1 times

================================================
 Top 5 User Agents
================================================
  [4 requests] Mozilla/5.0 (Windows NT 10.0; Win64; x64)
  [3 requests] curl/7.68.0
  [2 requests] Mozilla/5.0 (iPhone; CPU iPhone OS 14)
  [2 requests] Mozilla/5.0 (Macintosh; Intel Mac OS X)
  [2 requests] Mozilla/5.0 (Linux; Android 10)
```

---

## ⚙️ How It Works

The script processes each line of the Nginx access log using standard Unix tools in a pipeline:

```
Log File → awk (extract column) → sort → uniq -c (count) → sort -rn → head -5
```

### Nginx Log Format

Each log line follows this structure:

```
IP - - [Date Time] "METHOD /path HTTP/1.1" STATUS SIZE "Referrer" "User-Agent"
$1            $4          $7               $9                        $6 (by ")
```

| Column | Field |
|--------|-------|
| `$1` | IP Address |
| `$7` | Request Path |
| `$9` | Status Code |
| `$6` (split by `"`) | User Agent |

---

## 📁 Project Structure

```
nginx-log-analyser/
├── analyze_logs.sh   # Main script
└── README.md         # Documentation
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---


