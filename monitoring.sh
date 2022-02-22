#!/bin/bash

echo "#Architecture:$(uname -a)"
echo "#CPU physical: $(lscpu | grep ^CPU'(s)' | awk '{print $2}')"
echo "#vCPU: $(cat /proc/cpuinfo | grep processor | wc -l)"
echo "#Memory Usage: $(free --mega | awk '/Mem/ {printf("%s/%sMB (%d%%)", $3, $2, $3/$2*100)}')"
echo "#Disk Usage: $(df -h --total | grep total | awk '{printf("%s/%s (%s)", $3, $2, $5)}')"
echo "#CPU load: $(top -bn 1 | grep 'Cpu' | awk '{printf("%.2f%%", $2+$4)}')"
echo "#Last boot: $(who -b | awk '{printf("%s %s",$3, $4)}')"
echo "#LVM use: $([[ $(lsblk -o type | grep lvm) ]] && echo yes || echo no)"
echo "#Connexion TCP: $(netstat -a | egrep ^tcp.*ESTABLISHED$ | wc -l) ESTABLISHED"
echo "#User log: $(who | wc -l)"
echo "#Network: IP $(hostname -I) ($(ip a | grep -B 1 $(hostname -I) | head -1 | awk '{print $2}')) "
echo "#Sudo: $(cat /var/log/sudo/sudo.log | grep -c COMMAND)"
