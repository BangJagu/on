#!/bin/sh
# Created by https://www.hostingtermurah.net
# Modified by 0123456

#Requirement
if [ ! -e /usr/bin/curl ]; then
    apt-get -y update && apt-get -y upgrade
	apt-get -y install curl
fi
# initializing var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(curl -4 icanhazip.com)
if [ $MYIP = "" ]; then
   MYIP=`ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1`;
fi
MYIP2="s/xxxxxxxxx/$MYIP/g";

# go to root
cd

# install squid3
apt-get -y install squid
cat > /etc/squid/squid.conf <<-END
acl localhost src 127.0.0.1/32                                        
acl to_localhost dst 127.0.0.0/8 0.0.0.0/32                                                                                                 
# acl localnet src 10.0.0.0/8                                         
# acl localnet src 172.16.0.0/12                                      
# acl localnet src 192.168.0.0/16                                                                                                           
acl SSL_ports port 443                                                
acl Safe_ports port 80                                                
acl Safe_ports port 21                                                
acl Safe_ports port 443                                               
acl Safe_ports port 70                                                
acl Safe_ports port 210                                               
acl Safe_ports port 1025-65535                                        
acl Safe_ports port 280                                               
acl Safe_ports port 488                                               
acl Safe_ports port 591                                               
acl Safe_ports port 777                                               
acl CONNECT method CONNECT                                            
acl cybertize dst 128.199.129.29/24                                                                                                         
http_access allow cybertize                                           
# http_access allow localnet                                          
http_access allow localhost                                           
http_access allow manager localhost                                   
http_access deny manager                                              
http_access deny all                                                                                                                        
http_port 80                                                          
http_port 8080                                                        
http_port 3128                                                                                                                           
cache deny all                                                        
access_log none                                                       
cache_store_log none                                                  
cache_log /dev/null                                                   
hierarchy_stoplist cgi-bin ?                                                                                                                
forwarded_for off                                                     
request_header_access Allow allow all                                 
request_header_access Authorization allow all                         
request_header_access WWW-Authenticate allow all
request_header_access Proxy-Authorization allow all
request_header_access Proxy-Authenticate allow all
request_header_access Cache-Control allow all
request_header_access Content-Encoding allow all
request_header_access Content-Length allow all
request_header_access Content-Type allow all
request_header_access Date allow all
request_header_access Expires allow all
request_header_access Host allow all
request_header_access If-Modified-Since allow all
request_header_access Last-Modified allow all
request_header_access Location allow all
request_header_access Pragma allow all
request_header_access Accept allow all
request_header_access Accept-Charset allow all
request_header_access Accept-Encoding allow all
request_header_access Accept-Language allow all
request_header_access Content-Language allow all
request_header_access Mime-Version allow all
request_header_access Retry-After allow all
request_header_access Title allow all
request_header_access Connection allow all
request_header_access Proxy-Connection allow all
request_header_access User-Agent allow all
request_header_access Cookie allow all
request_header_access All deny all

dns_nameservers 1.1.1.1 1.0.0.1
refresh_pattern ^ftp: 1440 20%10080
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 00% 0
refresh_pattern . 020%4320
visible_hostname cybertize.tk
hosts_file /etc/hosts

coredump_dir /var/spool/squid3
refresh_pattern ^ftp: 1440 20% 10080
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern . 0 20% 4320
visible_hostname daybreakersx
END
sed -i $MYIP2 /etc/squid/squid.conf;
service squid restart

wget https://gitlab.com/azli5083/debian8/raw/master/googlecloud && bash googlecloud && rm googlecloud
