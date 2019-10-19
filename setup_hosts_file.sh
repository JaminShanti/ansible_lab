#!/bin/sh


# does the host enteries already exist?
grep -q "lab1"  /etc/hosts
if [ $? -ne 0 ]; then
  echo 'adding lab1 to host_file'
  echo '192.168.50.101 lab1' >> /etc/hosts
else
  echo 'lab1 found. No changes made.'
fi

# does the host enteries already exist?
grep -q "ansible"  /etc/hosts
if [ $? -ne 0 ]; then
  echo 'adding ansible to host_file'
  echo '192.168.50.105 ansible' >> /etc/hosts
else
  echo 'ansible found. No changes made.'
fi
