#!/bin/bash

SYSCHK=/etc/saildrone/system.check

if [ -f "$SYSCHK" ]; then
    logger system.check file exists 
  else
    logger system.check file missing
fi
echo $(date "+%Y/%m/%d_%H:%M:%S") > /etc/saildrone/system.checked
