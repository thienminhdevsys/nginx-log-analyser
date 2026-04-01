#!/bin/bash

# ============================================
# Nginx Log Analyser
# Usage: ./analyze_logs.sh <path-to-log-file>
# ============================================

# --- Kiểm tra tham số đầu vào ---
if [ -z "$1" ]; then
    echo "Usage: $0 <nginx-log-file>"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' not found!"
    exit 1
fi

# ============================================
# 1. Top 5 IP addresses với nhiều request nhất
# ============================================
echo "================================================"
echo " Top 5 IP Addresses with Most Requests"
echo "================================================"
awk '{print $1}' "$LOG_FILE" \
    | sort \
    | uniq -c \
    | sort -rn \
    | head -5 \
    | awk '{printf "  %-20s %s requests\n", $2, $1}'

# ============================================
# 2. Top 5 paths được request nhiều nhất
# ============================================
echo ""
echo "================================================"
echo " Top 5 Most Requested Paths"
echo "================================================"
awk '{print $7}' "$LOG_FILE" \
    | sort \
    | uniq -c \
    | sort -rn \
    | head -5 \
    | awk '{printf "  %-30s %s requests\n", $2, $1}'

# ============================================
# 3. Top 5 response status codes
# ============================================
echo ""
echo "================================================"
echo " Top 5 Response Status Codes"
echo "================================================"
awk '{print $9}' "$LOG_FILE" \
    | sort \
    | uniq -c \
    | sort -rn \
    | head -5 \
    | awk '{printf "  %-10s %s times\n", $2, $1}'

# ============================================
# 4. Top 5 User Agents
# ============================================
echo ""
echo "================================================"
echo " Top 5 User Agents"
echo "================================================"
awk -F'"' '{print $6}' "$LOG_FILE" \
    | sort \
    | uniq -c \
    | sort -rn \
    | head -5 \
    | awk '{
        count = $1
        $1 = ""
        sub(/^ /, "")
        printf "  [%s requests] %s\n", count, $0
    }'

echo ""
echo "================================================"
echo " Analysis Complete!"
echo "================================================"
