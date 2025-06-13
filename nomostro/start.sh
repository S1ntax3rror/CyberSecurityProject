#!/bin/bash
set -e
echo "Starting the http server..."
nhttpd
tail -f /dev/null
