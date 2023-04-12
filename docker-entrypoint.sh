#!/bin/sh
echo "Activating virtualenv..."
ls -alF
. venv/bin/activate
echo "Migrating database..."
envdir envs/dev python manage.py migrate
echo "Starting server..."
envdir envs/dev python manage.py runserver 0.0.0.0:8000
