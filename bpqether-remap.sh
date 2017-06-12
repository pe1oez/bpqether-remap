#!/bin/sh
# bpqether-remap.sh - together with udev rule it's remap bpq device to ethernet interface.
#
# udev rule "/etc/udev/rules.d/70-bpqether-remap.rules":
# KERNEL=="bpq?", SUBSYSTEM=="net", PROGRAM="/usr/local/bin/bpqether-remap.sh %k", NAME="%c"
#
# See kernel log if the udev rule and this script has changed the mapping.
# $ dmesg | grep rename | grep bpq
# bpq1: renamed from bpq0
#
# July 2016, february 2017, Wietse Ruyg - PE1OEZ.
#
bpqdev="$1"
ether=$(awk -v dev="$bpqdev" '$1==dev {print $2}' /proc/net/bpqether 2>/dev/null)
#
case $ether in
    # map bpq0 to eth0 (or the new names enp1s0 or p3p1)
    eth0|enp1s0|p3p1)
	echo bpq0
	;;
    # map bpq1 to wlan0 (or the new name wlp2s0)
    wlan0|wlp2s0)
	echo bpq1
	;;
    *)
	echo $bpqdev
esac
#
exit 0
