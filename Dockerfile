FROM python:3.6-slim-stretch
WORKDIR /app
USER root

ADD . .
RUN apt-get update && apt-get install -y build-essential && apt-get install -y procps
RUN pip install --no-cache-dir -r requirements.txt
RUN uwsgi -w config.wsgi --http :8000 --env DJANGO_SETTINGS_MODULE=config.dev -d start \
    && daphne -b 0.0.0.0 -p 8001 --proxy-headers config.asgi-dev:application > logs/asgi.log 2>&1 &
