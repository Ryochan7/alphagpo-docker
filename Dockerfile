FROM debian:latest

# Install dependencies
RUN apt-get update \
  && apt-get install -y libpq-dev libjpeg-dev zlib1g-dev libwebp-dev \
  build-essential python3-dev virtualenv libffi-dev git python3 python3-pip

# Install mygpo
RUN mkdir /app
#RUN git clone https://github.com/gpodder/mygpo.git /app/mygpo-git

# Need to package updated requirements files for now.
# Upstream mygpo repo has a few outdated Python packages
# that will not work with Python 3.11
ADD requirements/requirements.txt /app/mygpo-git/requirements.txt
ADD requirements/requirements-dev.txt /app/mygpo-git/requirements-dev.txt
ADD requirements/requirements-doc.txt /app/mygpo-git/requirements-doc.txt
ADD requirements/requirements-setup.txt /app/mygpo-git/requirements-setup.txt
ADD requirements/requirements-test.txt /app/mygpo-git/requirements-test.txt

# Write venv to /app so it is contained in the Docker image
WORKDIR /app
RUN virtualenv venv \
  && . venv/bin/activate \
  && pip install -r /app/mygpo-git/requirements.txt \
  && pip install -r /app/mygpo-git/requirements-dev.txt \
  && pip install -r /app/mygpo-git/requirements-doc.txt \
  && pip install -r /app/mygpo-git/requirements-setup.txt \
  && pip install -r /app/mygpo-git/requirements-test.txt

# TODO: Likely useless due to mygpo-git dir bind mount. Leave for now
RUN mkdir -p /app/mygpo-git/envs

COPY ./scripts /app/
