FROM python:3.8-alpine

RUN apk add git

COPY ./entrypoint.sh /entrypoint.sh

COPY ./main.py /main.py

CMD ["/entrypoint.sh"]