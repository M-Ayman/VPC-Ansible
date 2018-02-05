#!/bin/bash

#to add multi-ports ports=(4444 3333 8888)
ports=(6666 6634)

# your credentials
access_key=AKIAJ4S4OUPIFK7MSQW
secret_key=ZNiaHb8Te2ee06wNMWBJVIX+KsusgQsvC+TWEEWE
region=us-east-2

# Security group name
sg_name=launch-wizard-1

#Configure your machine to access aws account
aws configure set aws_access_key_id $access_key
aws configure set aws_secret_access_key $secret_key
aws configure set default.region $region
case $1 in
	add)

for i in ${ports[*]} 
do 
aws ec2 authorize-security-group-ingress --group-name $sg_name --protocol tcp --port $i --cidr 0.0.0.0/0
done
	;;

	remove)
for i in ${ports[*]}
do
aws ec2 revoke-security-group-ingress --group-name $sg_name  --protocol tcp --port $i --cidr 0.0.0.0/0
done

	;;
esac
