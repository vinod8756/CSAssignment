import subprocess
import sys

# Function to check if nmap is installed
def check_nmap():
    try:
        subprocess.run(
            ["nmap", "--version"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )
        return True
    except FileNotFoundError:
        return False


# Function to run selected scan
def run_scan(target, scan_type):

    # Decide command based on user choice
    if scan_type == "1":
        cmd = ["nmap", "-sn", target]

    elif scan_type == "2":
        cmd = ["nmap", target]

    elif scan_type == "3":
        ports = input("Enter port range (example 20-80): ")
        cmd = ["nmap", "-p", ports, target]

    elif scan_type == "4":
        cmd = ["nmap", "-sV", target]

    elif scan_type == "5":
        cmd = ["nmap", "-O", target]

    else:
        print("Invalid scan type")
        return

    try:
        print("\nScanning...")

        result = subprocess.run(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            timeout=120
        )

        print("\nScan Results:\n")
        print(result.stdout)

        save_results(result.stdout)

    except subprocess.TimeoutExpired:
        print("Scan timed out")

    except Exception as e:
        print("Error running scan:", e)


# Function to save scan results
def save_results(data):

    choice = input("\nSave results to file? (y/n): ").lower()

    if choice == "y":
        try:
            with open("nmap_results.txt", "w") as f:
                f.write(data)

            print("Results saved to nmap_results.txt")

        except Exception as e:
            print("Error saving file:", e)


# Main function
def main():

    print("=== Nmap Scanner ===")

    # Check if nmap exists
    if not check_nmap():
        print("Nmap is not installed. Install it first.")
        sys.exit()

    print("Nmap is installed")

    target = input("Enter target IP or network: ")

    print("""
Select Scan Type

1. Host Discovery
2. Port Scan
3. Custom Port Scan
4. Service Detection
5. OS Detection
""")

    scan_type = input("Enter choice (1-5): ")

    run_scan(target, scan_type)


if __name__ == "__main__":
    main()