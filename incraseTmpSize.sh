#!/bin/bash

sudo rm -rf /tmp/*
sudo mount -o remount,size=20G,noatime /tmp
echo "Done. Please use 'df -h' to make sure folder size is increased."
