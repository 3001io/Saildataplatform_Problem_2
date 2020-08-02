#!/bin/bash

SYSCHECKED=/etc/saildrone/system.checked
SYSCHK=/etc/saildrone/system.check

if [ -f "$SYSCHK" ]; then
    logger system.check file exists 
  else
    logger system.check file missing
fi
if [ ! -f "SYSCHECKED" ]; then
   touch /etc/saildrone/system.checked
fi
echo $(date "+%Y/%m/%d_%H:%M:%S") > /etc/saildrone/system.checked
