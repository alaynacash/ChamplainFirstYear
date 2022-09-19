#! /bin/bash

hostt=$1
server=$2

for host in $(seq 0 254); do
  nslookup $1.$host $2 | grep "name"
done
