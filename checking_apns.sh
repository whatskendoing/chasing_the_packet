#!/bin/sh

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/Users/Shared/apns_testing.log 2>&1

echo "############################################################################"
echo "Check Apple Cert                                                           #"
echo "############################################################################"
   
   /usr/bin/openssl s_client -showcerts -connect apple.com:443

echo "############################################################################"
echo "Check access to Apple Time Server                                          #"
echo "############################################################################"

   /usr/bin/nc -zu time.apple.com 123 2>&1 | awk '{print toupper ($NF)}'

echo "############################################################################"
echo "# APNS                                                                     #"
echo "# Source: https://support.apple.com/en-us/HT203609                         #"
echo "# https://developer.apple.com/library/archive/technotes/tn2265/_index.html #"
echo "############################################################################"

   /System/Library/PrivateFrameworks/ApplePushService.framework/apsctl status

echo "############################################################################"
echo "# Test 443                                                                 #"
echo "############################################################################"
   
   /usr/bin/nc -zv -4 api.push.apple.com 443
   /usr/bin/nc -zv -4 api.development.push.apple.com 443 
    
echo "############################################################################"
# Test 2195                                                                      #"
echo "############################################################################"
   
   /usr/bin/nc -zv -4 gateway.push.apple.com	2195
   /usr/bin/nc -zv -4 gateway.sandbox.push.apple.com 2195
    
echo "############################################################################"
# Test 2196                                                                      #"
echo "############################################################################"
   
   /usr/bin/nc -zv -4 gateway.push.apple.com 2196
   /usr/bin/nc -zv -4 gateway.sandbox.push.apple.com 2196
    
echo "############################################################################"
# Test 2197                                                                      #"
echo "############################################################################"
   
   /usr/bin/nc -zv -4 api.push.apple.com 2197
   /usr/bin/nc -zv -4 api.development.push.apple.com 2197 

echo "############################################################################"
echo "# Test 443 & 5223                                                          #"
echo "############################################################################"
   for i in {0..50}
   do
      /usr/bin/nc -zv -4 "$i-courier.sandbox.push.apple.com" 443
      /usr/bin/nc -zv -4 "$i-courier.sandbox.push.apple.com" 5223
      /usr/bin/nc -zv -4 "$i-courier.push.apple.com" 443
      /usr/bin/nc -zv -4 "$i-courier.push.apple.com" 5223
   done
