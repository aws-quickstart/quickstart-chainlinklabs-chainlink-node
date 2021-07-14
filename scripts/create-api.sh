#!/bin/bash

# 1. apiUser
# 2. apiPwd

printf "$1
$2" > /home/ec2-user/.chainlink/.api

echo
echo -e "Created Chainlink node API file"
echo