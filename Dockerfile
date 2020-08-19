FROM rackspacedot/python37

WORKDIR /app
USER root

ADD . .
RUN pip3 install -r requirements.txt

CMD wsgi -w demo.wsgi -s :8000 --processes=4
