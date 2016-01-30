#!/bin/bash
Keyword=$1
#Application=$2 # next release
# Adding Fonctionality
# hot fix
  for ip in $(lsof -n -i | awk '{ print $1,$9; }' | sort -u  | grep uTo | cut -d'>' -f2 | cut -d':' -f1 | grep -v uTorrent  )
     do
        #search=$(whois $ip | egrep  'descr|country')
        belongto=$(whois $ip  | grep -m 1  descr  | cut -d ':' -f2)
        country=$(whois $ip  | grep -m 1 country | cut -d ':' -f2 | tr -d '[[:space:]]' )
        #search="FREE SAS"
        if [ -n "$belongto" ]
          then
              echo $belongto | grep "$Keyord" && echo " I catched an ip than needs to be verified"
        fi
        #dns=$(nslookup $ip | grep name | cut -d'=' -f2)
        echo "$country  $ip $belongto"

     done
