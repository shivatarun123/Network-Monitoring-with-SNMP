#################################### Installation of Netsnmp ####################
 Installation steps
1. Download netsnmp package using the following command.
   wget http://sourceforge.net/projects/net-snmp/files/net-snmp/5.7.3/net-snmp-5.7.3.tar.gz
2. Download and install net snmp perl development package using the following command.
   sudo apt-get install libperl-dev
3. Decompress the downloaded package using the following command.
   tar -xvzf net-snmp-5.7.3.tar.gz
4. Now configure the downloded package with the instructions given below.
   cd net-snmp-5.7.3/
   sudo ./configure
5. This will ask to configure netsnmp choose default configuration settings.
6. Now complile and install the configured netsnmp using the following commands.
   sudo make
   sudo make install
7. Now install management information files on your system.
   sudo apt-get install snmp-mibs-downloader
8. Download and install snmpd
   sudo apt-get install snmpd.
9. Now you have two versions of the snmpd installed in the system so locate and remove the oldest version.
   use command "find /usr/ -name libnetsnmp*" to locate the libraries
10.Remove oldest libraries:
   rm /usr/local/lib/libnetsnmp*


