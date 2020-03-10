Ensure the snmp package are installed in the chosen system: 
For a Ubuntu machine: sudo apt-get install snmp.
For a CentOS machine: yum -y install net-snmp-utils.
Ensure the WIENER-CRATE-MIB file is present in the system at the right directory:
For a Ubuntu machine: /home/.snmp/mibs/
For a CentOS machine: /usr/share/snmp/mibs/
Ensure the machine is connected to the MPOD Wiener Power Supply through a Ethernet cable. Also, configure the connection for a Link-Local Only. This is done thought  the Network Manager at the iPv4 Settings.
Open a web-browser and tap the following IP address: 169.254.1.240 (only for DESY!)
Ensure you have execute rights on the different scripts you want to use:
To check, open a terminal, navigate to the folder where the scripts are and type ll.
If the rights have not been granted, type: chmod +rwx script_name.sh (for the different scripts you want to use). 
Run the different scripts in the terminal in the appropriate order (remember to change the IP according to your configuration!)
./Carrier_UP_fast.sh
./PwB_UP_fast.sh
Operate the system
./PwB_DOWN_fast.sh
./Carrier_DOWN_fast.sh
