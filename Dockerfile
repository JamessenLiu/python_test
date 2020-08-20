FROM rackspacedot/python37

WORKDIR /app
USER root

ADD . .
RUN pip install -r requirements.txt

CMD python manage.py runscript start

