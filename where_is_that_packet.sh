#!/bin/bash


# -B 
############################################################################
# Set the operating system capture buffer size to buffer_size, in units  of 
# KiB (1024 bytes).
B="-B 128" #kb

# -C
############################################################################
# Before writing a raw packet to a savefile, check whether the file is cur-
# rently larger than file_size and, if so, close the current  savefile  and
# open  a  new  one.  Savefiles after the first savefile will have the name
# specified with the -w flag, with a number after it,  starting  at  1  and
# continuing  upward.   The  units  of  file_size  are  millions  of  bytes
# (1,000,000 bytes, not 1,048,576 bytes).
C="-C 1" # 128, 256, 512, etc in mb 


# -n
############################################################################
# Don't convert addresses (i.e., host addresses,  port  numbers,  etc.)  to
# names.
n="-n"

# -s 
############################################################################
# Snarf  snaplen  bytes of data from each packet rather than the default of
# 65535 bytes.  Packets truncated because of a limited snapshot  are  indi-
# cated  in  the  output  with ``[|proto]'', where proto is the name of the
# protocol level at which the truncation has occurred.   Note  that  taking
# larger  snapshots  both  increases the amount of time it takes to process
# packets and, effectively, decreases the amount of packet buffering.  This
# may  cause  packets to be lost.  You should limit snaplen to the smallest
# number that will capture the protocol information you're  interested  in.
# Setting  snaplen to 0 sets it to the default of 65535, for backwards com-
# patibility with recent older versions of tcpdump.
s="-s 0"
# vvv
############################################################################
# Even  more  verbose  output.   For  example, telnet SB ... SE options are
# printed in full.  With -X Telnet options are printed in hex as well.
vvv="-vvv"

# -w
############################################################################
# Write  the raw packets to file rather than parsing and printing them out.
# They can later be printed with the -r option.  Standard output is used if
# file is ``-''.
#
# This  output  will be buffered if written to a file or pipe, so a program
# reading from the file or pipe may not see packets for an arbitrary amount
# of  time after they are received.  Use the -U flag to cause packets to be
# written as soon as they are received.
#
# The MIME type application/vnd.tcpdump.pcap has been registered with  IANA
# for  pcap files. The filename extension .pcap appears to be the most com-
# monly used along with .cap and .dmp. Tcpdump  itself  doesn't  check  the
# extension  when  reading  capture files and doesn't add an extension when
# writing them (it uses magic numbers in the file header instead). However,
# many  operating  systems and applications will use the extension if it is
# present and adding one (e.g. .pcap) is recommended.
#
# Location:
w="-w /Users/Shared/$(date +%Y-%m-%d_%H-%M-%S)_tcmdump" # Add Location

echo "**********************************************************"
echo "starting: /usr/sbin/tcpdump $vvv $n $s $B $C $w "
echo "**********************************************************"
sudo /usr/sbin/tcpdump $vvv $n $s $B $C $w 

exit 0
