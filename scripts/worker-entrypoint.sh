#!/bin/bash
cd /app/mygpo-git

source /app/scripts/start-virtual-env.sh

echo "Starting worker..."
envdir envs/dev celery -A mygpo worker --concurrency=3 -l info -Ofair
