FROM python:3.6-slim-stretch
WORKDIR /app
USER root

ADD . .
RUN apt-get update && apt-get install -y build-essential && apt-get install -y procps
RUN pip install --no-cache-dir -r requirements.txt
RUN uwsgi -w demo.wsgi -s :8000 --processes=4 -d start
