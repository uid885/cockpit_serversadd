#!/bin/bash -
# Author:             Christo Deale                  
# Date  :             2024-01-09             
# cockpit_serversadd: Utility to add multiple servers to Cockpit             

# Define an array of server IPs or hostnames
servers=("server1" "server2" "server3")

# Define the Cockpit server that will be used to manage the other servers
cockpit_server="cockpit-server"

# Iterate over the servers array
for server in "${servers[@]}"; do
  # Add the server to Cockpit
  ssh -t "$cockpit_server" "sudo cockpit-bridge --add-host=$server"
  
  # Check if the addition was successful
  if [ $? -eq 0 ]; then
    echo "Server $server added to Cockpit successfully."
  else
    echo "Failed to add server $server to Cockpit."
  fi
done
