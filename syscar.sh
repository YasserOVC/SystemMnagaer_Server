#!/bin/bash

# name=$(hostname)
os=$(hostnamectl)
timeup=$(uptime)
time=$(date)

cat syscarwel

echo "	" 
echo "today is : $time"
echo "your system uptime: $timeup"
echo "	"
echo "your OS: "
echo " $os "
