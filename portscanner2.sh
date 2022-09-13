#!/bin/bash
#Collaborated with Matt Bobbitt, Derek Farrell, and Morgan Hanrahan

ip_prefix=$1
port=$2
  for host in $(seq 1 254);
    do
      timeout .1 bash -c "echo >/dev/tcp/$ip_prefix.$host/$port" 2> /dev/null
      if [ $? -eq 0 ];
      then
        echo "Port $port is open on host $ip_prefix.$host" > sweep.txt
      else
		echo "Port $port is closed on host $ip_prefix.$host"
      fi
	done
cat sweep.txt
