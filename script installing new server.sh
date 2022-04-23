#!/bin/bash

#Author: George D.
#Description: This script will check the new install server
#Date: April 2022

## CPU check

CPU_N=`nproc`
if [ ${CPU_N} -lt 2]
then 
echo " CPU check failed "
else
echo " CPU check pass "
fi 


## TOTAL Memory check

totmem=`free -h | awk '/Mem\:/ { print $2 }'`
if [ ${totmem} -lt 2000 ]
then
echo " Total memory check failed "
else
echo " Total memory check pass "
fi 

##  Check if files exist

if [ -f /etc/group ]
then
echo " File /etc/group pass "
else
echo " File /etc/group fail "
fi 


if [ -f /etc/passwd ]
then 
echo " File /etc/passwd pass "
else
echo " File /etc/passwd fail "
fi 


if [ -f /etc/httpd ]
then 
echo " File /etc/httpd pass "
else
echo " File /etc/httpd fail "
fi


if [ -f /etc/kubernetes ]
then 
echo " File /etc/kubernetes pass "
else
echo " File /etc/kubernetes fail "
fi

## Check user puppet

id puppet

PUP=`$?`
if [ ${PUP} -eq 0 ]
then
echo " User puppet check pass "
else
echo " User puppet check fail "
fi 


# Kernel Version (1st digit)

KV=`uname -r | awk -F "." '{print $1}'`
if [ ${KV} -le 3 ]
then
echo " 1st digit of kernel version check failed "
else
echo " 1st digit of kernel version check pass "
fi 
