# bpqether-remap
Remap bpq device to ethernet interface if necessary.

The problem is that BPQETHER maps randomly on each bootup a particular bpq interface to an ethernet interface.
bpqether-remap maps always bpq0 to ethernet interface p3p1 (or eth0)
and maps bpq1 to ethernet interface wlp2s0 (or wlan0)


bpqether-remap.sh - together with udev rule it's remap bpq device to ethernet interface.

udev rule "/etc/udev/rules.d/70-bpqether-remap.rules":
KERNEL=="bpq?", SUBSYSTEM=="net", PROGRAM="/usr/local/bin/bpqether-remap.sh %k", NAME="%c"

See kernel log if the udev rule and this script has changed the mapping.
$ dmesg | grep rename | grep bpq
bpq1: renamed from bpq0

Wietse Ruyg, PE1OEZ
