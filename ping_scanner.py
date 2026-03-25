import subprocess
import platform
import re

# Function to ping a single host
def ping_host(host):

    # Detect OS to decide ping parameter
    os_type = platform.system().lower()
    param = "-n" if os_type == "windows" else "-c"

    try:
        # Run ping command
        result = subprocess.run(
            ["ping", param, "4", host],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            timeout=10
        )

        output = result.stdout

        print(f"\nHost: {host}")

        # Check if ping was successful
        if result.returncode == 0:
            print("Status: Reachable")

            # Try to extract average time
            avg_time = extract_avg_time(output)

            if avg_time:
                print("Average Time:", avg_time, "ms")
            else:
                print("Average Time: Not found")

        else:
            print("Status: Unreachable")

    except subprocess.TimeoutExpired:
        print("Ping request timed out")

    except Exception as e:
        print("Error:", e)


# Function to extract average response time
def extract_avg_time(output):

    # For Mac/Linux format
    match = re.search(r'=\s*([\d\.]+)/([\d\.]+)/([\d\.]+)/', output)
    if match:
        return match.group(2)

    # For Windows format
    match = re.search(r'Average = (\d+)', output)
    if match:
        return match.group(1)

    return None


# Function to handle multiple hosts
def scan_multiple_hosts(hosts):
    for host in hosts:
        ping_host(host.strip())


# Main function
def main():
    print("=== Ping Scanner ===")

    choice = input("Ping multiple hosts? (y/n): ").lower()

    if choice == "y":
        hosts = input("Enter hosts separated by comma: ").split(",")
        scan_multiple_hosts(hosts)
    else:
        host = input("Enter hostname or IP: ")
        ping_host(host)


if __name__ == "__main__":
    main()