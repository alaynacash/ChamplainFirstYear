#!/bin/bash
#Collaborated with Zach Morris, Derek Farrell, and Morgan Hanrahan

hostfile=$1
portfile=$2
if [ -n "$1" ] && [ -n "$2" ]; then
  if [ ! -f $hostfile ] | [ ! -f $portfile ]; then
    echo "One or more of the input files were not found. Quitting"
    exit 1
  fi
  for host in $(cat $hostfile); do
    for port in $(cat $portfile); do
       timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null
      if [ $? -eq 0 ]; then
        echo "$host is open on port $port"
      else
        echo "$host is closed on port $port"
      fi
    done
  done
else
  echo "No arguments supplied"
fi
