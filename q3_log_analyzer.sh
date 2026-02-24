#!/bin/bash
# q3_log_analyzer.sh
# This script analyzes a log file and shows useful statistics.

if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

logfile=$1

if [ ! -f "$logfile" ]; then
    echo "Log file not found."
    exit 1
fi

if [ ! -s "$logfile" ]; then
    echo "Log file is empty."
    exit 1
fi

echo "================================="
echo "        LOG FILE ANALYSIS        "
echo "================================="

echo "Log File: $logfile"
echo "Total Entries: $(wc -l < "$logfile")"

echo ""
echo "Unique IP Addresses:"
awk '{print $1}' "$logfile" | sort -u

echo ""
echo "Status Code Summary:"
awk '{print $NF}' "$logfile" | sort | uniq -c

echo ""
echo "Most Frequently Accessed Page:"
awk '{print $7}' "$logfile" | sort | uniq -c | sort -nr | head -1

echo ""
echo "Top 3 IP Addresses:"
awk '{print $1}' "$logfile" | sort | uniq -c | sort -nr | head -3

