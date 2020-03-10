#!/bin/bash

snmpget -v 2c -m +WIENER-CRATE-MIB -c public 169.254.1.200 sysMainSwitch.0
