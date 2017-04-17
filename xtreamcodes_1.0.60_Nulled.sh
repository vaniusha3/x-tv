#!/bin/bash
echo " "
jeshile='\e[40;38;5;82m' #jeshile
jo='\e[0m' # pa ngjyra
os=$(exec uname -m|grep 64)
if [ "$os" = "" ]
then os="x86"
else os="x64"
fi
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Checking System Version  │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
sleep 3
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Detected a $os System   │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
sleep 3
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Installing Web Server   │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
echo " "
apt-get update && apt-get upgrade -y && apt-get install htop -y
apt-get install lsb-release nscd curl php5 php5-mysql php5-cli php5-curl unzip curl libcurl3 libcurl3-dev php5-curl -y
sudo apt-get update && sudo apt-get install vlc vlc-plugin-* -y && sudo apt-get install vlc browser-plugin-vlc -y
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl && chmod a+rx /usr/local/bin/youtube-dl
sudo updatedb
sudo apt-get update
sudo apt-get install php5-dev php5-gd -y
apt-get install php5-geoip php5-fpm mcrypt php5-mcrypt php5enmod mcrypt -y
apt-get install apache2 apache2-mpm-prefork apache2-utils libapache2-mod-php5 libapr1 libaprutil1 libdbd-mysql-perl libdbi-perl libnet-daemon-perl libplrpc-perl libpq5 mysql-client-5.5 mysql-common mysql-server mysql-server-5.5 php5-common php5-mysql -y
apt-get install phpmyadmin -y
sudo php5enmod mcrypt
service apache2 reload && service apache2 restart
echo " "
echo -e "${jeshile} ┌────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Enable IP Forwarding Tables  │ \e[0m"
echo -e "${jeshile} └────────────────────────────────┘ \e[0m"
echo " "
# BLOCK THE MOTHERFUCKER
echo 1 > /proc/sys/net/ipv4/ip_forward
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -p /etc/sysctl.conf
sysctl net.ipv4.ip_forward
echo " "
echo -e "${jeshile} ┌─────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │    Blocking IP FORWARD Tables   │ \e[0m"
echo -e "${jeshile} └─────────────────────────────────┘ \e[0m"
echo " "
/sbin/iptables -t nat -I OUTPUT --dest 149.202.206.51/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 62.210.244.112/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest xtream-codes.com/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 119.249.54.71/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 38.30.65.218/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 221.194.47.224/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 218.65.30.38/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 116.31.116.34/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 91.197.232.109/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 121.18.238.104/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 221.194.44.195/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 123.103.255.80/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 185.73.239.0/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 185.73.239.7/28 -j DNAT --to-destination 127.0.0.1
echo " "
echo -e "${jeshile} ┌─────────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Blocking SSH Connection   │ \e[0m"
echo -e "${jeshile} └─────────────────────────────┘ \e[0m"
echo " "
sudo /sbin/iptables -I INPUT -s 119.249.54.71 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 119.249.54.71 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 38.30.65.218 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 221.194.47.224 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 218.65.30.38 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 116.31.116.34 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 91.197.232.109 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 121.18.238.104 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 221.194.44.195 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 149.202.206.51 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 123.103.255.80 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 123.103.255.87 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 62.210.244.112 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.239.0 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.239.7 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s xtream-codes.com -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 104.20.86.174 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 149.202.206.51 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 54.208.22.70 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 51.206.202.149 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.239.7 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 94.23.120.89 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 104.18.44.225 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 37.59.239.66 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 37.59.239.66 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 46.4.28.40 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 108.162.196.124 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 91.228.53.61 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.239.17 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.236.54 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.2 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.3 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.4 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.5 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.6 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.7 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.8 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.9 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.10 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.11 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.12 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.13 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.14 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.15 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.16 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.17 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.18 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.19 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.20 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.21 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.22 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.23 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.24 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 202.12.28.140 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 192.5.4.1 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 199.212.0.53 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 200.3.13.14 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 193.0.9.5 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.236.54 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 104.28.18.95 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 94.23.120.89 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables -I INPUT -s 37.59.239.66 -p tcp --dport ssh -j REJECT
sudo /sbin/iptables-save
echo " "
echo -e "${jeshile} ┌─────────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Blocking FTP Connection   │ \e[0m"
echo -e "${jeshile} └─────────────────────────────┘ \e[0m"
echo " "
sudo /sbin/iptables -I INPUT -s 119.249.54.71 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 38.30.65.218 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 221.194.47.224 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 218.65.30.38 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 116.31.116.34 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 91.197.232.109 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 121.18.238.104 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 221.194.44.195 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 149.202.206.51 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 123.103.255.80 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 123.103.255.87 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 62.210.244.112 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.239.0 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.239.7 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s xtream-codes.com -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 104.20.86.174 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 54.208.22.70 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 51.206.202.149 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.239.7 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 94.23.120.89 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 104.18.44.225 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 37.59.239.66 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 37.59.239.66 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 46.4.28.40 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 108.162.196.124 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 91.228.53.61 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.239.17 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.236.54 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.2  -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.3 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.4 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.5 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.6 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.7 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.8 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.9 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.10 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.11 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.12 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.13 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.14 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.15 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.16 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.17 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.18 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.19 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.20 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.21 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.22 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.23 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.49.91.24 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 202.12.28.140 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 192.5.4.1 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 199.212.0.53 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 200.3.13.14 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 193.0.9.5 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 185.73.236.54 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 104.28.18.95 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 94.23.120.89 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables -I INPUT -s 37.59.239.66 -p tcp --dport 21 -j REJECT
sudo /sbin/iptables-save
echo " "
echo -e "${jeshile} ┌─────────────────────┐ \e[0m"
echo -e "${jeshile} │   Blocking TUNTAP   │ \e[0m"
echo -e "${jeshile} └─────────────────────┘ \e[0m"
echo " "
sudo ip tuntap add tun0 mode tun
sudo sudo ip addr add 119.249.54.71/28 dev tun0
sudo ip addr add 38.30.65.218/28 dev tun0
sudo ip addr add 221.194.47.224/28 dev tun0
sudo ip addr add 218.65.30.38/28 dev tun0
sudo ip addr add 116.31.116.34/28 dev tun0
sudo ip addr add 91.197.232.109/28 dev tun0
sudo ip addr add 121.18.238.104/28 dev tun0
sudo ip addr add 221.194.44.195/28 dev tun0
sudo ip addr add 123.103.255.80/28 dev tun0
sudo ip addr add 185.73.239.0/28 dev tun0
sudo ip addr add 185.73.239.7/28 dev tun0
sudo ip addr add 119.249.54.71 dev tun0
sudo ip addr add 119.249.54.71 dev tun0
sudo ip addr add 38.30.65.218 dev tun0
sudo ip addr add 221.194.47.224 dev tun0
sudo ip addr add 218.65.30.38 dev tun0
sudo ip addr add 116.31.116.34 dev tun0
sudo ip addr add 91.197.232.109 dev tun0
sudo ip addr add 121.18.238.104 dev tun0
sudo ip addr add 221.194.44.195 dev tun0
sudo ip addr add 149.202.206.51 dev tun0
sudo ip addr add 123.103.255.80 dev tun0
sudo ip addr add 123.103.255.87 dev tun0
sudo ip addr add 62.210.244.112 dev tun0
sudo ip addr add 185.73.239.0 dev tun0
sudo ip addr add 185.73.239.7 dev tun0
sudo ip addr add 104.20.86.174 dev tun0
sudo ip addr add 149.202.206.51 dev tun0
sudo ip addr add 54.208.22.70 dev tun0
sudo ip addr add 51.206.202.149 dev tun0
sudo ip addr add 185.73.239.7 dev tun0
sudo ip addr add 94.23.120.89 dev tun0
sudo ip addr add 104.18.44.225 dev tun0
sudo ip addr add 37.59.239.66 dev tun0
sudo ip addr add 37.59.239.66 dev tun0
sudo ip addr add 46.4.28.40 dev tun0
sudo ip addr add 108.162.196.124 dev tun0
sudo ip addr add 91.228.53.61 dev tun0
sudo ip addr add 185.73.239.17 dev tun0
sudo ip addr add 185.73.236.54 dev tun0
sudo ip addr add 185.49.91.2 dev tun0
sudo ip addr add 185.49.91.3 dev tun0
sudo ip addr add 185.49.91.4 dev tun0
sudo ip addr add 185.49.91.5 dev tun0
sudo ip addr add 185.49.91.6 dev tun0
sudo ip addr add 185.49.91.7 dev tun0
sudo ip addr add 185.49.91.8 dev tun0
sudo ip addr add 185.49.91.9 dev tun0
sudo ip addr add 185.49.91.10 dev tun0
sudo ip addr add 185.49.91.11 dev tun0
sudo ip addr add 185.49.91.12 dev tun0
sudo ip addr add 185.49.91.13 dev tun0
sudo ip addr add 185.49.91.14 dev tun0
sudo ip addr add 185.49.91.15 dev tun0
sudo ip addr add 185.49.91.16 dev tun0
sudo ip addr add 185.49.91.17 dev tun0
sudo ip addr add 185.49.91.18 dev tun0
sudo ip addr add 185.49.91.19 dev tun0
sudo ip addr add 185.49.91.20 dev tun0
sudo ip addr add 185.49.91.21 dev tun0
sudo ip addr add 185.49.91.22 dev tun0
sudo ip addr add 185.49.91.23 dev tun0
sudo ip addr add 185.49.91.24 dev tun0
sudo ip addr add 202.12.28.140 dev tun0
sudo ip addr add 192.5.4.1 dev tun0
sudo ip addr add 199.212.0.53 dev tun0
sudo ip addr add 200.3.13.14 dev tun0
sudo ip addr add 193.0.9.5 dev tun0
sudo ip addr add 185.73.236.54 dev tun0
sudo ip addr add 104.28.18.95 dev tun0
sudo ip addr add 94.23.120.89 dev tun0
sudo ip addr add 37.59.239.66 dev tun0
sudo ip addr add 119.249.54.71 dev tun0
sudo ip addr add 38.30.65.218 dev tun0
sudo ip addr add 221.194.47.224 dev tun0
sudo ip addr add 218.65.30.38 dev tun0
sudo ip addr add 116.31.116.34 dev tun0
sudo ip addr add 91.197.232.109 dev tun0
sudo ip addr add 121.18.238.104 dev tun0
sudo ip addr add 221.194.44.195 dev tun0
sudo ip addr add 149.202.206.51 dev tun0
sudo ip addr add 123.103.255.80 dev tun0
sudo ip addr add 123.103.255.87 dev tun0
sudo ip addr add 62.210.244.112 dev tun0
sudo ip addr add 185.73.239.0 dev tun0
sudo ip addr add 185.73.239.7 dev tun0
sudo ip addr add 104.20.86.174 dev tun0
sudo ip addr add 54.208.22.70 dev tun0
sudo ip addr add 51.206.202.149 dev tun0
sudo ip addr add 185.73.239.7 dev tun0
sudo ip addr add 94.23.120.89 dev tun0
sudo ip addr add 104.18.44.225 dev tun0
sudo ip addr add 37.59.239.66 dev tun0
sudo ip addr add 37.59.239.66 dev tun0
sudo ip addr add 46.4.28.40 dev tun0
sudo ip addr add 108.162.196.124 dev tun0
sudo ip addr add 91.228.53.61 dev tun0
sudo ip addr add 185.73.239.17 dev tun0
sudo ip addr add 185.73.236.54 dev tun0
sudo ip addr add 185.49.91.2  dev tun0
sudo ip addr add 185.49.91.3 dev tun0
sudo ip addr add 185.49.91.4 dev tun0
sudo ip addr add 185.49.91.5 dev tun0
sudo ip addr add 185.49.91.6 dev tun0
sudo ip addr add 185.49.91.7 dev tun0
sudo ip addr add 185.49.91.8 dev tun0
sudo ip addr add 185.49.91.9 dev tun0
sudo ip addr add 185.49.91.10 dev tun0
sudo ip addr add 185.49.91.11 dev tun0
sudo ip addr add 185.49.91.12 dev tun0
sudo ip addr add 185.49.91.13 dev tun0
sudo ip addr add 185.49.91.14 dev tun0
sudo ip addr add 185.49.91.15 dev tun0
sudo ip addr add 185.49.91.16 dev tun0
sudo ip addr add 185.49.91.17 dev tun0
sudo ip addr add 185.49.91.18 dev tun0
sudo ip addr add 185.49.91.19 dev tun0
sudo ip addr add 185.49.91.20 dev tun0
sudo ip addr add 185.49.91.21 dev tun0
sudo ip addr add 185.49.91.22 dev tun0
sudo ip addr add 185.49.91.23 dev tun0
sudo ip addr add 185.49.91.24 dev tun0
sudo ip addr add 202.12.28.140 dev tun0
sudo ip addr add 192.5.4.1 dev tun0
sudo ip addr add 199.212.0.53 dev tun0
sudo ip addr add 200.3.13.14 dev tun0
sudo ip addr add 193.0.9.5 dev tun0
sudo ip addr add 185.73.236.54 dev tun0
sudo ip addr add 104.28.18.95 dev tun0
sudo ip addr add 94.23.120.89 dev tun0
sudo ip addr add 37.59.239.66 dev tun0
sudo ip addr add 149.202.206.48 dev tun0
sudo ip addr add 185.73.239.7 dev tun0
sudo ip addr add 149.202.206.51 dev tun0
sudo ip addr add 62.210.244.122 dev tun0
sudo ip addr add 123.103.255.87 dev tun0
sudo ip addr add 185.135.158.190 dev tun0
sudo ip addr add 116.31.116.34 dev tun0
sudo ip addr add 119.249.54.71 dev tun0
sudo ip addr add 38.30.65.218 dev tun0
sudo ip addr add 221.194.47.224 dev tun0
sudo ip addr add 121.18.238.104 dev tun0
sudo ip addr add 221.194.44.195 dev tun0
sudo ip addr add 218.65.30.38 dev tun0
sudo ip addr add 91.197.232.109 dev tun0
sudo ip addr add 185.73.239.0 dev tun0
sudo ip addr add 62.210.244.122 dev tun0
sudo ip addr add 123.103.255.80 dev tun0
sudo ip addr add 104.20.86.174 dev tun0
echo " "
echo -e "${jeshile} ┌────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  install Iptables Persistent And Open VPN  │ \e[0m"
echo -e "${jeshile} └────────────────────────────────────────────┘ \e[0m"
echo " "
sudo apt-get install iptables-persistent && apt-get install openvpn -y
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Downloanding Extracting And Installing  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
#mkdir /var/www/html
#cd /var/www/html #DESTINACIONI KRYESOR ADMIN - TEMPLATES ETC
cd /var/www/html && wget http://downloads.sourceforge.net/project/iptv-md/xtream/Xtream_Codes_v1.0.60_Nulled.zip && unzip Xtream_Codes_v1.0.60_Nulled.zip && cp /var/www/html/downloads/iptv_panel_pro.zip /tmp && chmod a+x /tmp/iptv_panel_pro.zip && cp /var/www/html/downloads/install_iptv_pro.php /root/ && cd /root && chmod a+x /root/install_iptv_pro.php && php install_iptv_pro.php
chmod 775 /var/www/html/Xtream_Codes_v1.0.60_Nulled.zip
rm /var/www/html/Xtream_Codes_v1.0.60_Nulled.zip
cp /var/www/html/downloads/iptv_panel_pro.zip /tmp
chmod a+x /tmp/iptv_panel_pro.zip
#cp /var/www/html/downloads/install_iptv_pro.php /root/ #FSHIHET AUTOMATIKISHT MBAS INSTALIMIT
#cd /root
#chmod a+x /root/install_iptv_pro.php
#php install_iptv_pro.php  #KJO ESHTE LULKUQJA
echo " "
#REPLACE CONFIG, ALL ORIGINAL FILES ARE BACKUP WITH END backup_by_TRC4
echo -e "${jeshile} ┌─────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Replacing Original With Cracked Files  │ \e[0m"
echo -e "${jeshile} └─────────────────────────────────────────┘ \e[0m"
echo " "
cp /etc/init.d/xtreamcodes_pro_panel /etc/init.d/xtreamcodes_pro_panel_backup_by_TRC4
echo -e "${jeshile} [+] /etc/init.d/xtreamcodes_pro_panel Backup as xtreamcodes_pro_panel_backup_by_TRC4 \e[0m"
cp /var/www/html/crack/xtreamcodes_pro_panel /etc/init.d/xtreamcodes_pro_panel
echo -e "${jeshile} [+] New xtreamcodes_pro_panel File Coppied to /etc/init.d/xtreamcodes_pro \e[0m"
cp /etc/rc.local /etc/rc.local_backup_by_TRC4
echo -e "${jeshile} [+] /etc/rc.local backuped as rc.local_backup_by_TRC4 \e[0m"
cp /var/www/html/crack/rc.local /etc/rc.local
echo -e "${jeshile} [+] New rc.local File Coppied to /etc/rc.local \e[0m"
chmod +x /etc/rc.local
echo -e "${jeshile} [+] chmod +x rc.local \e[0m"
echo " "
#MYSQL CONFIG, ALL ORIGINAL FILES ARE BACKUP WITH END backup_by_TRC4
echo -e "${jeshile} ┌──────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Modified MYSQL Connections  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────┘ \e[0m"
echo " "
cp /etc/mysql/my.cnf /etc/mysql/my_config.cnf_backup_by_TRC4
echo -e "${jeshile} [+] /etc/mysql/my.cnf backuped as my.cnf_backup_by_TRC4 \e[0m"
echo -e "${jeshile} [+] ORIGINAL FILE /var/www/html/crack/mysqlcnf/original \e[0m"
sed -i 's/max_connections = 5000/max_connections = 20000/g' /etc/mysql/my.cnf
echo -e "${jeshile} [+] MYSQL Connections Has Been Now Modified Minimum 5000 to Maximum 20000 \e[0m"
service mysql restart
echo " "
echo -e "${jeshile} ┌───────────────────────┐ \e[0m"
echo -e "${jeshile} │  Removing TEMP Files  │ \e[0m"
echo -e "${jeshile} └───────────────────────┘ \e[0m"
echo " "
rm /root/install_iptv_pro.php
rm /root/xtreamcodes_1.0.60_Nulled.sh
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Xtream Fuckers 10.60 Nulled By Albanian Crackers (TRC4) │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────────────────┘ \e[0m"
echo -e "${jeshile} ┌──────────────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │[+] installation Completed                                │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────────────────┘ \e[0m"
echo -e "${jeshile} ┌──────────────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │[+] Email: TRC4@USA.COM                                   │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────────────────┘ \e[0m"
echo -e "${jeshile} ┌──────────────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │[+] Webpage: Albdroid.AL                                  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────────────────┘ \e[0m"
echo -e "${jeshile} ┌──────────────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │[+] Source: Kodi.AL                                       │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────────────────┘ \e[0m"
echo -e "${jeshile} ┌──────────────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │[+] Location: Albania,Greece,Italy,Rotterdam              │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────────────────┘ \e[0m"
echo -e "${jeshile} ┌──────────────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │[+] Happy Streaming Gangsters ;-)                         │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────────────────┘ \e[0m"
echo -e "${jeshile} ┌──────────────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │[+]        Serveri Do Te Behet Automatic Reboot           │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────────────────┘ \e[0m"
echo " "
sleep 8
reboot
echo " "
echo -e "${jeshile} ┌───────────────────────┐ \e[0m"
echo -e "${jeshile} │[R]  Rebooting VPS...  │ \e[0m"
echo -e "${jeshile} └───────────────────────┘ \e[0m"
echo " "
