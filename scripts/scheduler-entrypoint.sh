#!/bin/bash
cd /app/mygpo-git

source /app/scripts/start-virtual-env.sh

echo "Starting scheduler..."
cd /app/mygpo-git
envdir envs/dev celery -A mygpo beat -l DEBUG --scheduler django_celery_beat.schedulers:DatabaseScheduler
# envdir envs/dev celery 
echo "I guess we're done here."
