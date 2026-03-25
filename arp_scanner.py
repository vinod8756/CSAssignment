import subprocess
import re

# Function to get ARP table
def get_arp_table():
    try:
        result = subprocess.run(
            ["arp", "-a"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        return result.stdout

    except Exception as e:
        print("Error retrieving ARP table:", e)
        return ""


# Function to extract IP and MAC addresses
def parse_arp_table(output):

    pattern = r'(\d+\.\d+\.\d+\.\d+).*?(([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2})'
    matches = re.findall(pattern, output)

    entries = []

    for match in matches:
        ip = match[0]
        mac = match[1]
        entries.append((ip, mac))

    return entries


# Function to display results
def display_results(entries):

    print("\nIP Address\t\tMAC Address")
    print("-------------------------------------------")

    for ip, mac in entries:
        print(f"{ip}\t{mac}")

    print("\nTotal entries:", len(entries))


# Function to save results to file
def save_results(entries):

    choice = input("Save results to file? (y/n): ").lower()

    if choice == "y":
        try:
            with open("arp_results.txt", "w") as f:
                for ip, mac in entries:
                    f.write(f"{ip} {mac}\n")

            print("Results saved to arp_results.txt")

        except Exception as e:
            print("Error saving file:", e)


# Main function
def main():

    print("=== ARP Scanner ===")
    print("Scanning ARP table...\n")

    output = get_arp_table()

    if not output:
        print("No ARP data found")
        return

    entries = parse_arp_table(output)

    if entries:
        display_results(entries)
        save_results(entries)
    else:
        print("No entries found")


if __name__ == "__main__":
    main()