FROM python:3.6-stretch

WORKDIR /app
USER root

ADD . .
RUN pip install -r requirements.txt

CMD python manage.py runscript start

