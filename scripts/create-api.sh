#!/bin/bash

printf "$1
$2" > /home/ec2-user/.chainlink/.api

echo
echo -e "Created Chainlink node API file"
echo
