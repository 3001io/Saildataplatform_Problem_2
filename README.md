# Saildrone_Problem_2
A proposed solution to creating system and wireless status logs.
Instructions
Install the two scripts wifistatus.sh and systemcheck.sh in a /var/saildrone/scripts/ directory
Install wifistatus.service and systemcheck.service in the /etc/systemd/system/
Install wifistatus.timer and systemcheck.timer in /etc/systemd/system/timers.target.wants/
Please check ownership and permission of the scripts, which should have permission to be executed. 
(example: chmod 775 /var/saildrone:scripts/*.sh)

The "systemcheck" service sends a message to syslog, either "system.check file exists" or "system.check file missing"
depending on whether the file /etc/saildrone/system.check exists.
It will update the file /etc/saildrone/system.checked with a single line, only saving the lastest check time,
replacing the previous check time. This can be altered to append the time rather than replace, if desired.
In this case the system time is saved in a "year""month""day""hour""minute""second" format, but that is easily changed and in my experience using unix time (time from epoch) works really well for time series data.

The "wifistatus" service gathers wireless interface stats from the /proc/net/wireless file.
If the device has more than one interface, the service will loop through each interface starting with "wlan" and save the data on it's own line.
To choose which stats are gathered, run "cat /proc/net/wireless", decide which fields are needed on the device,
and edit the "print" field in the awk command to only include those fields. "Cat" will also show how many wireless interfaces are present and if these interfaces use "wlan" as their prefix.
By default ten stats are gathered per interface and appended to the file /etc/saildrone/system.wireless preceded by the system time and date. The same comment regarding data format applies here. 

Concerns:
- A process should delete the /etc/saildrone/system.check file after storing the result.
- While the system.check results are stored and rotated in the syslog, wifi status will over time be a single large file.
It would be easy to address this, but it was not included as part of this scope of work.
- Given the lack of respect for traditional network interfaces by systemd, future devices may not use "wlan" as the interface name in /proc/net/wireless. This should be checked and adjusted as above. The script could be altered
to use whatever names are active, but it will always be easier to just test and adjust as needed.
- These scripts could be run as cron jobs rather than systemd services, there is no strict dependency on systemd for this application. This means very, very lightweight embedded linux distributions (like OpenWRT) could use these same scripts if desired.

LinkedIn profile: https://www.linkedin.com/in/herb-garcia-b9926411/
email: herb@3001.io
