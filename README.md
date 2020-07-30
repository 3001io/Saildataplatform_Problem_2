# Saildrone_Problem_2
A proposed solution to creating system and wireless status logs.
Instructions
Install the two scripts wifistatus.sh and systemcheck.sh in /var/saildrone/scripts
Install wifistatus.service and systemcheck.service in the /lib/systemd/system/
Install wifistatus.timer and systemcheck.timer in /lib/systemd/system/timers.target.wants/
Create symlink in /etc/systemd/system for each .service file
Create symlink in /etc/systemd/system/timer.target.wants/ for each .timer file

The "systemcheck" service will send a message to syslog as either "system.check file exists" or "system.check file missing"
depending on whether the file /etc/saildrone/system.check exists.
It will update the file /etc/saildrone/system.checked with a single line, only saving the lastest check time,
replacing the previous check time. This can be altered to append the time rather than replace, if desired.

The "wifistatus" service will gather wireless interface stats from the /proc/net/wireless file.
It will loop through each interface starting with "wlan", this is in case the device has more than one wireless interface.
To choose which stats are gathered, run "cat /proc/net/wireless", decide which fields are needed on the device,
and edit the "print" field to only include those fields. It also shows if devices use "wlan" as the prefix for wireless interfaces.
By default ten stats are gathered and appended to the file /etc/saildrone/system.wireless preceded by the system time and date. 

A concern is while the system.check file is stored and rotated in the syslog, the wifi status will over time be a single large file.
It would be easy to address but this was not part of this scope of work.
Another concern is whether the device uses "wlan" as the interface name. This should be checked as above. The script could be altered
to use whatever names are active, but it will always be easier to just test and adjust as needed.


LinkedIn profile: https://www.linkedin.com/in/herb-garcia-b9926411/
email: herb@3001.io
