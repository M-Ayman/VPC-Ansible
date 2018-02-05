#!/bin/bash


#Install Require Packages
case "$1" in 
"Red Hat Enterprise"|"CentOS"|"Scientific")
		yum install -y python python-pip
		pip install awscli
	;;
"Ubuntu"|"Debian")
		apt install -y python python-pip
                pip install awscli
	;;
esac

