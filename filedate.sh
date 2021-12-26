#!/bin/bash
if [ -d ~/logs ]
then
        date=$(date -u +%Y%m%d_%H%M%S)
        touch ~/logs/$date
else
        mkdir ~/logs
        date=$(date -u +%Y%m%d_%H%M%S)
        touch ~/logs/$date
fi
