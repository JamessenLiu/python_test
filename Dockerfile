FROM centos/python-36-centos7

WORKDIR /app
USER root

ADD . .
RUN pip3 install -r requirements.txt

CMD python3 manage.py runserver 0.0.0.0:8000
