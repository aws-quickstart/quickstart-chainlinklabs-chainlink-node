#!/bin/bash

# 1. walletPwd

printf "$1" > /home/ec2-user/.chainlink/.password

echo
echo -e "Created keystore password file"
echo
