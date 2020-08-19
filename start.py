import os

os.system("uwsgi -w demo.wsgi -s :8000 --processes=4 &")
# os.system("daphne -b 0.0.0.0 -p 8001 --proxy-headers demo.asgi:application &")