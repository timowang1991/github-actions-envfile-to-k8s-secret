FROM python:3.8-alpine

WORKDIR /opt

COPY ./entrypoint.sh /opt/entrypoint.sh

COPY ./main.py /opt/main.py

ENTRYPOINT ["/opt/entrypoint.sh"]