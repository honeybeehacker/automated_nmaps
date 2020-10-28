#!/bin/bash

# Initial reconnaissance nmap scans automated into a single script. 
# Includes four iterations of scans: 
# quick initial stealth scan (SYN packets w/o complete TCP handshake) 
# TCP scan of all ports including version detection
# UDP scan of top 200 ports including version detection (w/o) DNS resolution
# Optional nmap scripts with version and OS detection

echo "Target IP: "
read IP
echo " "
echo "Initial Scan: "
nmap IP -sS
echo " "
echo "TCP Scan: "
nmap IP -p- -sV --reason
echo " "
echo "UDP Scan: "
nmap -sV -n --top-ports 200
echo " "
echo "Would you like to further scan using nmap scripts? (yes/no): "
read yesno
echo " "
if [ $yesno == yes ]
then
    echo "Scripts Scan: "
    nmap IP -sV -sC -O
    echo " "
    echo "Scan complete"
else
    echo "Scan complete"
fi

