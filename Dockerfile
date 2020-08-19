FROM rackspacedot/python37

WORKDIR /app
USER root

ADD . .
RUN pip3 install -r requirements.txt

CMD uwsgi -w demo.wsgi -s :8000 --processes=4 && daphne -b 0.0.0.0 -p 8001 --proxy-headers demo.asgi:application
