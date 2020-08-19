FROM python:3.6-slim-stretch

WORKDIR /app
USER root

ADD . .
RUN apt update && apt-get install -y gcc
RUN pip3 install --no-cache-dir -r requirements.txt

CMD chmod 755 start.py
