FROM debian:latest

# Install dependencies
RUN apt-get update \
  && apt-get install -y libpq-dev libjpeg-dev zlib1g-dev libwebp-dev \
  build-essential python3-dev virtualenv libffi-dev git python
RUN mkdir /app
WORKDIR /app

# Install mygpo
RUN git clone https://github.com/gpodder/mygpo.git /app
RUN virtualenv venv \
  && . venv/bin/activate \
  && pip install -r requirements.txt \
  && pip install -r requirements-dev.txt \
  && pip install -r requirements-doc.txt \
  && pip install -r requirements-setup.txt \
  && pip install -r requirements-test.txt

RUN mkdir -p /app/envs

COPY ./docker-entrypoint.sh /app/