#!/bin/bash

FILE=/etc/saildrone/system.check
if [ -f "$FILE" ]; then
    logger system.check file exists 
  else
    logger system.check file missing
fi
