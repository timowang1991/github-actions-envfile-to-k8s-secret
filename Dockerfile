FROM python:3.8-alpine

RUN apk add git

WORKDIR /opt

COPY ./entrypoint.sh /opt/entrypoint.sh

COPY ./main.py /opt/main.py

CMD ["entrypoint.sh"]