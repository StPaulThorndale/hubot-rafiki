#!/bin/bash

echo "Stopping rafiki..."
./stop.sh
sleep 3
echo "Starting rafiki..."
./start.sh
echo "Done."

