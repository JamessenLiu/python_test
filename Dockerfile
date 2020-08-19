FROM python:3.6-stretch

WORKDIR /app
USER root

ADD . .
RUN pip3 install --no-cache-dir -r requirements.txt

CMD chmod 755 start.py
