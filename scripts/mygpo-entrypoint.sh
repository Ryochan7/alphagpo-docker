#!/bin/bash
cd /app/mygpo-git

source /app/scripts/start-virtual-env.sh

echo "Migrating database..."
envdir envs/dev python manage.py migrate
echo "Starting server..."
envdir envs/dev python manage.py runserver 0.0.0.0:8000
