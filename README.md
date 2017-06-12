# bpqether-remap
Remap bpq device to ethernet interface if necessary.

The problem is that BPQETHER maps randomly on each bootup a particular bpq interface to an ethernet interface.      
bpqether-remap maps always bpq0 to ethernet interface p3p1 (or eth0 or enp1s0)  
and maps bpq1 to ethernet interface wlp2s0 (or wlan0)
 
Download: ```$ git clone https://github.com/pe1oez/bpqether-remap.git```  
Copy the udev rule file **70-bpqether-remap.rules** in **/etc/udev/rules.d/**  
Copy the script file **bpqether-remap.sh** in **/usr/local/bin/**  
Change the *case* statment in the script file **bpqether-remap.sh** if you wants an other mapping.  

After rebooting the system see kernel log if the udev rule and this script has changed the mapping.  
```$ dmesg | grep rename | grep bpq```  
bpq1: renamed from bpq0

Have fun!,  
Wietse Ruyg, PE1OEZ
