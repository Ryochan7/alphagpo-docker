#!/bin/bash

# venv should exist on Docker image build. Not needed
#
#echo "Checking for virtualenv..."
#if [ ! -d venv ]; then
#  echo "Creating virtualenv..."
#  virtualenv venv
#  source venv/bin/activate
#  pip install -r requirements.txt
#  pip install -r requirements-dev.txt
#  pip install -r requirements-doc.txt
#  pip install -r requirements-setup.txt
#  pip install -r requirements-test.txt
#fi

echo "Activating virtualenv..."
source /app/venv/bin/activate
