#!/bin/ps1


# does the host enteries already exist?
grep -q "lab1" 'C:\Windows\System32\drivers\etc\hosts'
if (!($?))
{
  write-output 'adding lab1 to host_file'
  write-output '192.168.50.101 lab1' >>  'C:\Windows\System32\drivers\etc\hosts'
}
else
{
  write-output 'lab1 found. No changes made.'
}

# does the host enteries already exist?
grep -q "ansible" 'C:\Windows\System32\drivers\etc\hosts'
if (!($?))
{
  write-output 'adding ansible to host_file'
  write-output '192.168.50.105 ansible' >> 'C:\Windows\System32\drivers\etc\hosts'
}
else
{
  write-output 'ansible found. No changes made.'
}
