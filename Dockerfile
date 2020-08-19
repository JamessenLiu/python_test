FROM rackspacedot/python37

WORKDIR /app
USER root

ADD . .
RUN pip3 install --no-cache-dir -r requirements.txt

CMD python3 manage.py runserver 0.0.0.0:5000
