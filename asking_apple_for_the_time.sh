#!/bin/sh

# So this little one liner checks to see if you can access Apple's Time Server

# nc options used
# -z Specifies that nc should just scan for listening daemons, without sending 
#    any data to them.  It is an error to use this option in conjunction with the -l
#    option.
#
# -u Use UDP instead of the default option of TCP.

/usr/bin/nc -zu time.apple.com 123 2>&1 | awk '{print toupper ($NF)}'

exit 0
