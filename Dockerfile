FROM rackspacedot/python37

WORKDIR /app
USER root

ADD . .
RUN pip install --no-cache-dir -r requirements.txt

CMD chmod 755 start.py && python3 start.py
