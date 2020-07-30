#!/bin/bash
# Collect stats for each active wireless interface
# I'm adding the following commented command as a placeholder, in case systemd decides to assign goofy names
# to wifi interfaces. It's something to check.
# ip -a link | grep -v link | awk '{print $2}' This will show a list of just the interface names
# as they would appear in /proc/net/wireless. It could then create variables to add in the subroutine below.

for i in $(grep 'wlan' /proc/net/wireless)
do
    # we could just do    wifistats=$(grep  wlan /proc/net/wireless) # but that's less fun
    # using this method, you can just gather the fields you want.
    wifistats=$(awk '/wlan/{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11}' /proc/net/wireless)
    echo $(date "+%Y_%m_%d_%M_%S") $wifistats  >> /etc/saildrone/system.wireless
done
