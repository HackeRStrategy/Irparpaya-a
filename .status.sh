#!/bin/bash
#status host
echo -e "\e[1;32m"
while read LINE; do
  curl -o /dev/null --silent --head --write-out '%{http_code}' "$LINE"
  echo ' '$LINE
done < lista-host.txt
