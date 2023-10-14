#!/bin/bash
cd /app/feedservice

sleep 10

echo "Start venv script"
source /app/feedservice-venv/bin/activate

#echo `pwd`
#echo `whereis envdir`
#echo $PATH;
#echo "Migrating database..."
#envdir envs/dev python manage.py migrate
echo "Starting server..."
envdir envs python manage.py runserver 0.0.0.0:8080
#python manage.py runserver 0.0.0.0:8080
