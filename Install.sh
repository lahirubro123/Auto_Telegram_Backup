#!/usr/bin/env bash

#loading Animation
sleep 5 &
pid=$!frames="/ | \\ -"while kill -0 $pid 2&>1 > /dev/null;
do
    for frame in $frames;
    do
        printf "\r$frame Loading..." 
        sleep 0.5
    done
done
printf "\n"

# Install  packages
echo script from Bunny_LK
sleep 5


apt-get update
apt-get upgrade
sudo apt install python3-pip
sudo pip3 install -U telegram-upload

# Creating Script
echo  What Is Your Backup File Description ?
read description
echo what is your File Path '/path/path/text.txt' ?
read path
echo What is Your Telegram - Phone number, username, Bot invite link or use “me” to send to 'saved messages'  ?
read link
echo Upload Time ? 'use Crontab Format'
read timez


(crontab -l; echo "$timez sudo telegram-upload --to $link --caption $description $path") | sort -u | crontab -
telegram-upload --to $link --caption $description $path

echo Script Done !!
