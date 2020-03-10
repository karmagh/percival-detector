#!/bin/bash

# Switch the WIENER On

echo Switching the WIENER Power Supply ON

read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

./mainswitchON.sh

sleep 5

# Switch the CarrierBoard On

echo Switching the CarrierBoard ON

./Carrier_UP.sh

sleep 5

# Switch the PowerBoard On

echo Switching the PowerBoard ON

./PwB_UP.sh

echo The system is now ON

sleep 5
