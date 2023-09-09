#!/bin/bash
cd /app/mygpo-git

# Add a sleep period to wait for other containers to start.
# TODO: Find better way to wait for other containers
sleep 20

source /app/scripts/start-virtual-env.sh

echo "Migrating database..."
envdir envs/dev python manage.py migrate
echo "Starting server..."
envdir envs/dev python manage.py runserver 0.0.0.0:8000
