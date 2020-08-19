FROM rackspacedot/python37

WORKDIR /app
USER root

ADD . .
RUN pip install --no-cache-dir -r requirements.txt
RUN chmod 755 start.py

ENTRYPOINT ["python3", "./start.py"]
