FROM centos/python-36-centos7

WORKDIR /app
USER root

ADD . .
RUN pip3 install -r requirements.txt

EXPOSE 8000

CMD uwsgi -w demo.wsgi --http :8000 --processes=4 &
