CampusPe | Bash Scripting Assignment
Cybersecurity Track

Name: Vinod R
Assignment: Bash Scripting Automation
Total Questions Attempted: 5/5

OVERVIEW

This assignment contains 5 bash scripts created as part of the CampusPe
Cybersecurity Track. The scripts focus on basic bash scripting,
file handling, text processing, and Linux automation.

All scripts were tested on Ubuntu/Debian (Kali Linux).

FILES INCLUDED

1. q1_system_info.sh
2. q2_file_manager.sh
3. q3_log_analyzer.sh
4. q4_backup.sh
5. q5_user_report.sh
6. README.txt


HOW TO RUN THE SCRIPTS

First make scripts executable:

chmod +x *.sh


Question 1:
./q1_system_info.sh

Displays system information including user, hostname, date,
OS, directory, uptime, disk and memory usage.


Question 2:
./q2_file_manager.sh

Menu driven file manager.
Test options like:
- Create file
- Delete file
- Rename file
- Search file
- Count files


Question 3:
./q3_log_analyzer.sh access.log

Analyzes a log file.
Test with:
./q3_log_analyzer.sh access.log
./q3_log_analyzer.sh wrongfile.log   (should show error)


Question 4:
./q4_backup.sh

Follow prompts to:
- Enter source directory
- Enter destination
- Choose backup type


Question 5:
./q5_user_report.sh
or
sudo ./q5_user_report.sh

Generates user statistics and security checks.
Run with sudo for password check.


SAMPLE TEST CASES USED

For Log Analyzer:

Used log_analysis file created in Assignment 1


For Backup Script:

mkdir test_backup
touch test_backup/file{1..5}.txt
./q4_backup.sh


For File Manager:

Tested creating, renaming, deleting, and searching files.


CHALLENGES FACED

1. Understanding awk field extraction in log analysis.
2. Handling quoted values in log files.
3. Managing file permissions and executable flags.
4. Setting up GitHub authentication using personal access token.
5. Ensuring proper validation for file and directory checks.


LEARNING OUTCOMES

1. Learned how to write structured bash scripts.
2. Understood file and directory validation.
3. Practiced text processing using awk, sort, uniq, wc.
4. Implemented backup automation with timestamp.
5. Understood user account parsing from /etc/passwd.
6. Improved comfort working in Linux terminal.


ENVIRONMENT USED

Operating System: Kali Linux (Debian based)
Shell: Bash
Tools Used: nano, git, awk, find, tar


