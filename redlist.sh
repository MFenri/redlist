#!/bin/sh
# redlist.sh
# REDLIST

# Download public sources

mkdir /usr/src/redlist
cd /usr/src/redlist

# CISCO TALOS
wget https://www.talosintelligence.com/documents/ip-blacklist

# EMERGINTHREADS
wget https://rules.emergingthreats.net/fwrules/emerging-Block-IPs.txt
wget https://rules.emergingthreats.net/blockrules/compromised-ips.txt

# BINARY DEFENSE
wget https://www.binarydefense.com/banlist.txt

# Any other lists you want. Please, share any list or updates with us.

# Temporary merge and sort
cat emerging-Block-IPs.txt compromised-ips.txt banlist.txt ip-blacklist | sort > redlisttemp.txt

# Delete empty rows
sudo sed -i '/^$/d' redlisttemp.txt

# Delete rows started by "#"
sudo sed -i '/#/d' redlisttemp.txt

# Delete duplicate rows
sort redlisttemp.txt | uniq > redlist.txt

# Insert Redstout header
sed -i "1s/^/####################################\n/" redlist.txt
sed -i "2s/^/#                                  #\n/" redlist.txt
sed -i "3s/^/#   `date`   #\n/" redlist.txt
sed -i "4s/^/#                                  #\n/" redlist.txt
sed -i "5s/^/####################################\n/" redlist.txt
sed -i "6s/^/####################################\n/" redlist.txt
sed -i "7s/^/#                                  #\n/" redlist.txt
sed -i "8s/^/#     Redstout Threat IP list      #\n/" redlist.txt
sed -i "9s/^/#                                  #\n/" redlist.txt
sed -i "10s/^/#          redstout.com            #\n/" redlist.txt
sed -i "11s/^/#                                  #\n/" redlist.txt
sed -i "12s/^/#    This feed is free for use     #\n/" redlist.txt
sed -i "13s/^/#                                  #\n/" redlist.txt
sed -i "14s/^/####################################\n/" redlist.txt
sed -i "15s/^/####################################\n/" redlist.txt

# Move temporary file to webserver
mv redlist.txt /path/of/your/webserver/redlist.txt
rm *