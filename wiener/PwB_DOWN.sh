#!/bin/bash

# Switch the PwB Off

# echo Switching the PowerBoard OFF

# read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

# sleep 5

#m8V_supply & 8v_supply

echo Ramping m8V_supply down STEP 1

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u101 F 7

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u101 F 6

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u101 F 5

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u101 F 4

sleep 2 

echo Ramping 8V_supply down STEP 1

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u100 F 7

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u100 F 6

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u100 F 5

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u100 F 4

sleep 2 

echo Ramping m8V_supply down STEP 2

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u101 F 3

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u101 F 2

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u101 F 1

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u101 F 0.001

sleep 2 

echo Ramping 8V_supply down STEP 2

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u100 F 3

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u100 F 2

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u100 F 1

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u100 F 0.001

sleep 2 

echo 8V_supply and m8V_supply at 0 V

#PIXELRING

echo Ramping PIXELRING down

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u7 F 5

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u7 F 4

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u7 F 3

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u7 F 2

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u7 F 1

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u7 F 0.001

sleep 2 

echo PIXELRING at 0 V

#Vreg_0V7

echo Ramping Vreg_0V7 down

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u1 F 1.2

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u1 F 0.9

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u1 F 0.6

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u1 F 0.3

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u1 F 0.001

sleep 2 

echo Vreg_0V7 at 0 V

#Vreg_2V3 

echo Ramping Vreg_2V3 down

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u3 F 2.8

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u3 F 2.1

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u3 F 1.4

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u3 F 0.7

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u3 F 0.001

sleep 2 

echo Vreg_2V3 at 0 V

#Vreg_1V8

echo Ramping Vreg_1V8 down

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u2 F 1.84

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u2 F 1.38

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u2 F 0.92

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u2 F 0.46

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u2 F 0.001

sleep 2 

echo Vreg_1V8 at 0 V

#Vreg_3V3

echo Ramping Vreg_3V3 down

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u0 F 3.12

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u0 F 2.34

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u0 F 1.56

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u0 F 0.78

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u0 F 0.001

sleep 2 

echo Vreg_3V3 at 0 V

#Vcontr_all

echo Ramping Vcontr_all down

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u4 F 4.8

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u4 F 3.6

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u4 F 2.4

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u4 F 1.2

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u4 F 0.001

sleep 2 

echo Vcontr_all at 0 V

#3V3_supply 

echo Ramping 3V3_supply down

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u6 F 2.64

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u6 F 1.98

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u6 F 1.32

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u6 F 0.66

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u6 F 0.001

sleep 2 

echo 3V3_supply at 0 V

#5V1_supply

echo Ramping 5V1_supply down

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u5 F 4

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u5 F 3

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u5 F 2

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u5 F 1

sleep 2 

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputVoltage.u5 F 0.001

sleep 2 

echo 5V1_supply at 0 V

sleep 5

#Switch everything OFF

echo Switching all channels OFF

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u0 i 0

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u1 i 0

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u2 i 0

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u3 i 0

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u4 i 0

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u5 i 0

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u6 i 0

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u7 i 0

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u100 i 0

snmpset -v 2c -m +WIENER-CRATE-MIB -c guru 169.254.1.200 outputSwitch.u101 i 0

sleep 5

echo All channels are OFF

echo PowerBoard is OFF

# Switch the WIENER Off

# ./mainswitchOFF.sh

