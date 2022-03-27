#!/bin/bash
# + -- --=[GooHak by @xer0dayz
# + -- --=[http://sn1persecurity.com
#
# ABOUT:
# GooHak is a shell script to automatically launch google hacking queries against a target domain to find vulnerabilities and enumerate a target.
#
# DEPENDENCIES:
# iceweasel or xdg-utils (apt-get install xdg-utils)
# Linux

TARGET="$1"
BROWSER="firefox" # CHANGE TO DEFAULT BROWSER - FOR OSX, USE "open".
VER="1.9"
OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
DELAY=5
RESET='\e[0m'

if [ -z $TARGET ]; then
	echo -e "$OKORANGE + -- --=[https://sn1persecurity.com$RESET"
	echo -e "$OKORANGE + -- --=[GooHak v$VER by @xer0dayz$RESET"
	echo -e "$OKORANGE + -- --=[Usage: goohak <domain>$RESET"
	exit
fi

# LOAD WEBSITE IN A WEB BROSER
$BROWSER http://$TARGET 2> /dev/null
$BROWSER https://$TARGET 2> /dev/null
# TCPUTILS
$BROWSER http://www.tcpiputils.com/browse/domain/$TARGET 2> /dev/null
# NETCRAFT
$BROWSER http://toolbar.netcraft.com/site_report?url=$TARGET 2> /dev/null
# SHOWDAN
$BROWSER https://www.shodan.io/search?query=$TARGET 2> /dev/null
# CENSYS
$BROWSER https://www.censys.io/ipv4?q=$TARGET 2> /dev/null
# CRT.SH
$BROWSER https://crt.sh/?q=%25.$TARGET 2> /dev/null
# ZONE-H
$BROWSER "https://www.google.ca/search?q=site:zone-h.org+$TARGET" 2> /dev/null
# XSSPOSED
$BROWSER "https://www.xssposed.org/search/?search=$TARGET&type=host" 2> /dev/null
# SECURITYHEADERS
$BROWSER "https://securityheaders.io/?q=$TARGET" 2> /dev/null
# SSLLABS
$BROWSER https://www.ssllabs.com/ssltest/analyze.html?d=$TARGET 2> /dev/null
# HEADER CHECK
$BROWSER https://securityheaders.io/?q=$TARGET 2> /dev/null
# THREATCROWD
$BROWSER https://www.threatcrowd.org/domain.php?domain=$TARGET 2> /dev/null
# ZOOMEYE
$BROWSER https://www.zoomeye.org/searchResult/bugs?q=$TARGET 2> /dev/null
# DOMAIN INFO SEARCH
$BROWSER https://securitytrails.com/search/domain/$TARGET 2> /dev/null
# WAYBACKMACHINE
$BROWSER https://web.archive.org/web/*/$TARGET 2> /dev/null
# REVERSEDNS
$BROWSER http://viewdns.info/reversewhois/?q=$TARGET 2> /dev/null
# PUNKSPIDER
$BROWSER "https://www.punkspider.org/#searchkey=url&searchvalue=$TARGET&pagenumber=1&filterType=or" 2> /dev/null

sleep $DELAY
# FIND SUBDOMAINS
$BROWSER "https://www.google.ca/search?q=site:*.$TARGET" 2> /dev/null
$BROWSER "https://www.google.ca/search?q=site:*.*.$TARGET" 2> /dev/null

sleep $DELAY
# FIND LOGIN PAGES:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+username+OR+password+OR+login+OR+root+OR+admin" 2> /dev/null
# SEARCH FOR BACKDOORS:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+inurl:shell+OR+inurl:backdoor+OR+inurl:wso+OR+inurl:cmd+OR+shadow+OR+passwd+OR+boot.ini+OR+inurl:backdoor" 2> /dev/null
# FIND SETUP OR INSTALL FILES:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+inurl:readme+OR+inurl:license+OR+inurl:install+OR+inurl:setup+OR+inurl:config" 2> /dev/null
# FIND WORDPRESS PLUGINS/UPLOADS/DOWNLOADS:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+inurl:wp-+OR+inurl:plugin+OR+inurl:upload+OR+inurl:download" 2> /dev/null
# FIND OPEN REDIRECTS:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+inurl:redir+OR+inurl:url+OR+inurl:redirect+OR+inurl:return+OR+inurl:src=http+OR+inurl:r=http" 2> /dev/null

sleep $DELAY
# FIND FILES BY EXTENSION:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+ext:cgi+OR+ext:php+OR+ext:asp+OR+ext:aspx+OR+ext:jsp+OR+ext:jspx+OR+ext:swf+OR+ext:fla+OR+ext:xml" 2> /dev/null
# FIND DOCUMENTS BY EXTENSION:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+ext:doc+OR+ext:docx+OR+ext:csv+OR+ext:pdf+OR+ext:txt+OR+ext:log+OR+ext:bak" 2> /dev/null
# FIND APACHE STRUTS RCE's:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+ext:action+OR+struts" 2> /dev/null
# FIND PASTEBIN POSTS FOR DOMAIN:
$BROWSER "https://www.google.ca/search?q=site:pastebin.com+$TARGET" 2> /dev/null
# FIND EMPLOYEES ON LINKEDIN:
$BROWSER "https://www.google.ca/search?q=site:linkedin.com+employees+$TARGET" 2> /dev/null