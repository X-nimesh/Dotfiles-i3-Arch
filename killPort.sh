#!/bin/bash

# Check if port number is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

port=$1

# Check if lsof command is available
if ! command -v lsof &> /dev/null; then
    echo "lsof command not found. Please install it first."
    exit 1
fi

# Check if any process is listening on the specified port
if lsof -ti :$port &> /dev/null; then
    echo "Killing process listening on port $port"
    kill -9 $(lsof -t -i:$port)
else
    echo "No process found listening on port $port"
fi

