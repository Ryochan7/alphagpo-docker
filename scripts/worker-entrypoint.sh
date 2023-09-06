#!/bin/bash
cd /app/mygpo-git

# Add a sleep period to wait for other containers to start
# TODO: Find better way to wait for other containers
sleep 10

source /app/scripts/start-virtual-env.sh

echo "Starting worker..."
envdir envs/dev celery -A mygpo worker --concurrency=3 -l info -Ofair
