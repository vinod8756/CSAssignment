
#!/bin/bash
# q5_user_report.sh
# This script generates report about users in the system.
# It shows statistics, user details, groups and security checks.

echo "================================="
echo "        USER ACCOUNT REPORT      "
echo "================================="

TOTAL=$(cut -d: -f1 /etc/passwd | wc -l)
SYSTEM_USERS=$(awk -F: '$3 < 1000 {count++} END {print count}' /etc/passwd)
REGULAR_USERS=$(awk -F: '$3 >= 1000 {count++} END {print count}' /etc/passwd)
LOGGED_IN=$(who | awk '{print $1}' | sort -u | wc -l)

echo "Total Users: $TOTAL"
echo "System Users (UID < 1000): $SYSTEM_USERS"
echo "Regular Users (UID >= 1000): $REGULAR_USERS"
echo "Currently Logged In: $LOGGED_IN"

echo ""
echo "Regular User Details:"
printf "%-15s %-6s %-20s %-15s\n" "Username" "UID" "Home Directory" "Shell"
awk -F: '$3 >= 1000 {printf "%-15s %-6s %-20s %-15s\n",$1,$3,$6,$7}' /etc/passwd

echo ""
echo "Group Information:"
cut -d: -f1 /etc/group

echo ""
echo "Security Checks:"
echo "Users with UID 0:"
awk -F: '$3 == 0 {print $1}' /etc/passwd

if [ -r /etc/shadow ]; then
    echo "Users without passwords:"
    awk -F: '($2==""){print $1}' /etc/shadow
else
    echo "Run as root to check password status."
fi

echo ""
echo "Inactive Users (Never logged in):"
lastlog | grep "Never logged in"
