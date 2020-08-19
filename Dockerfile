FROM rackspacedot/python37

WORKDIR /app
USER root

ADD . .
RUN pip3 install -r requirements.txt

CMD python3 start.py
