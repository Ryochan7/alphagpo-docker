#!/bin/bash
cd /app/alphagpo-git

# Add a sleep period to wait for other containers to start
# TODO: Find better way to wait for other containers
sleep 10

source /app/scripts/start-virtual-env.sh

echo "Starting scheduler..."
cd /app/alphagpo-git
envdir envs/dev celery -A mygpo beat -l DEBUG --scheduler django_celery_beat.schedulers:DatabaseScheduler
# envdir envs/dev celery 
echo "I guess we're done here."
