FROM python:3.6-slim-stretch

WORKDIR /app
USER root

ADD . .
RUN apt-get update && apt-get install -y build-essential && apt-get install -y procps
RUN pip3 install --no-cache-dir -r requirements.txt

CMD chmod 755 start.py
