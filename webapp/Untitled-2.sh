#!/bin/bash
## Descriptio: docker script
## Author:Temo Ngu
## Date: jan 18 2021

docker -v >/dev/null 2>&1
if [$? -eq 0 ]
then
yum install docker
fi
echo "is docker active? "
read ans  
systemctl start docker
systemctl enable docker 
echo "have you build your image?"
read build
echo "which port do you want expose?"
read expose
echo "was your dockerfile created?"
read created
echo "do you want to remove image?"
read image
exit 0
