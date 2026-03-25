# Network Scanning Automation

This project is part of my cybersecurity assignment where I implemented basic network scanning tools using Python.

The idea is to automate common commands like ping, arp and nmap using Python and understand how they work behind the scenes.

---

## Tools Used

* Python 3
* Nmap
* Built-in tools (Ping and ARP)

---

## Setup / Installation

Make sure Python is installed:

```
python3 --version
```

Install Nmap:

On Mac:

```
brew install nmap
```

On Linux:

```
sudo apt install nmap
```

On Windows:
Download from https://nmap.org

---

## Files in this Project

* ping_scanner.py → checks if a host is reachable and shows response time
* arp_scanner.py → shows IP and MAC address mapping from ARP table
* nmap_scanner.py → performs different types of network scans
* screenshots/ → contains output screenshots

---

## How to Run

Run each file using:

```
python3 ping_scanner.py
python3 arp_scanner.py
python3 nmap_scanner.py
```

---

## Example Usage

Ping Scanner:

```
Enter hostname or IP: google.com
```

ARP Scanner:

```
Shows list of devices connected in the network
```

Nmap Scanner:

```
Enter target IP: 127.0.0.1
Choose scan type
```

---

## Notes

* Tested using localhost (127.0.0.1)
* Works on Mac (should also work on Linux/Windows)
* Some scans may take time depending on network
* Nmap OS detection may need admin permissions

---

## Important

This project is only for learning purposes.

Only scan networks that you own or have permission to scan. Unauthorized scanning is not allowed.

---

## Screenshots

Screenshots of outputs are included in the screenshots folder.

---

## Conclusion

This assignment helped me understand how network scanning works and how Python can be used to automate system commands. It also gave me some idea about how tools like Nmap actually work internally.
