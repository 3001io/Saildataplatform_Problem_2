# Saildrone_Problem_2
A proposed solution to creating system and wireless status logs.
Install the two scripts wifistatus.sh and systemcheck.sh in /var/saildrone/scripts
Install wifistatus.service and systemcheck.service in the /lib/systemd/system/
Install wifistatus.timer and systemcheck.timer in /lib/systemd/system/timers.target.wants/
Create symlink in /etc/systemd/system for each service file
Create symlink in /etc/systemd/system/timer.target.wants/ for each timer file
