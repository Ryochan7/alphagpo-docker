FROM debian:latest

# Install dependencies
RUN apt-get update \
  && apt-get install -y libpq-dev libjpeg-dev zlib1g-dev libwebp-dev \
  build-essential python3-dev virtualenv libffi-dev git python3 python3-pip vim

# Install mygpo
RUN mkdir /app
ADD feedservice/requirements.txt /app/feedservice/requirements.txt

WORKDIR /app
RUN virtualenv feedservice-venv \
  && . feedservice-venv/bin/activate \
  && pip3 install -r /app/feedservice/requirements.txt

RUN mkdir -p /app/feedservice/envs

COPY ./scripts /app/
