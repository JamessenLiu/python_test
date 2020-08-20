import os


def run():
    os.system("uwsgi -w demo.wsgi -s :8000 &")
    os.system("daphne -b 0.0.0.0 -p 8001 --proxy-headers demo.asgi:application > logs/asgi.log 2>&1 &")