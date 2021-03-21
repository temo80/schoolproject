#!/bin/bash

#Description:
#Author:
#Date:


 # Checking the hostname
 echo "the hostname is $(hostname)"

 ## Checking the size of the hard
 then
 echo "user puppet exists on this server "
 
 else
 echo "user puppet is miising on this system"
 fi 
 ## check the user puppet's shell
 PUPPET_SHELL=`grep puppet /etc/passwd | awk -F: ' {PRINT$7}'`
 echo "the shell for user puppet is ${PUPPET_SHELL}"

 ## Check if docker is installed

 docker -v
 if [$? -ne 0 ]
 then
 echo "docker is not installed"
 fi

 ## check if group puppet exists

 grep -q puppet /etc/group
 if [ $? -eq 0 ]
 then
 echo "group puppet "
 else
 echo "group puppet does not exist "
 fi
 ## Check if file /etc/grub.conf file exists
 if [ -f /etc/grub.conf ]
 then
 echo "file /etc/grub.conf exists on the system "
 else
 echo "file /etc/grub.conf missing on this server"
 fi
  ## check if directory exists
  
  if [ -d /etc ]
  then
  echo " directory /etc exist on the server "
  else
  echo "Directory missing on the system "
  fi
   ## Check if file /etc/selinux file exists
 if [ -f /etc/selinux ]
 then
 echo "file /etc/selinux exists on the system "
 else
 echo "file /etc/selinux missing on this server"
 fi
  ## check if system is 32 or 64 bits

  echo "the system  is $(getconf LONG_BIT) bits"
  ## check cpu number

  echo "This system has $(nproc) cpus "

  ## check total memory

  MEM= `free -m |grep Mem: |awk '{print$2}'`
  echo "The total memory is ${MEM} "

  ##Check the kernel first digit
  KER=`uname -r|awk -F. '{print$1}'`
  if [ ${KER} -lt 3 ]
  then
  echo "This system's kernel is not up to date"
  else
  echo "Your kernel meets the requirements"
  fi

  ## check the os version
  OS=`cat /etc/*release |grep PRETTY_NAME|awk -F= '{print$2}'`
  echo "the Os is: ${OS}"
  exit 0