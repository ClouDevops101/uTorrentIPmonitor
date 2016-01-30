#!/bin/bash
Keyword=$1
#Application=$2 # next release it will be implemented
# Adding Fonctionality
# hot fix
  for ip in $(lsof -n -i | awk '{ print $1,$9; }' | sort -u  | grep uTo | cut -d'>' -f2 | cut -d':' -f1 | grep -v uTorrent  )
    do
      # Make a whois lookup and get description
      belongto=$(whois $ip  | grep -m 1  descr  | cut -d ':' -f2)
      # Make a whois lookup and get country code
      country=$(whois $ip  | grep -m 1 country | cut -d ':' -f2 | tr -d '[[:space:]]' )
      # Lookup for the given keyword
      if [ -n "$belongto" ]
        then
          echo $belongto | grep "$Keyord" && echo " I catched an IP : $ip that needs to be verified !!!"
      fi
      # Making list of detected IP
      echo "$country  $ip $belongto"
    done
