#!/bin/bash

# Switch the WIENER Off

echo Switching the WIENER Power Supply OFF

read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

# Switch the PowerBoard OFF

echo Switching the PowerBoard OFF

./PwB_DOWN_fast.sh

sleep 5

# Switch the CarrierBoard OFF

echo Switching the CarrierBoard OFF

./Carrier_DOWN_fast.sh

sleep 5

# Switch the WIENER Off

./mainswitchOFF.sh

sleep 5

echo The system is now OFF



