FROM python:3.11-alpine3.19
LABEL maintainer="newscoco"

ENV PYTHONUNBUFFERED 1
ENV TZ=Asia/Seoul
ENV DISPLAY=:99

COPY ./requirements.txt /tmp/requirements.txt
COPY ./newscoco /app

WORKDIR /app
EXPOSE 8000

ARG DEV=false

RUN python -m venv /py && \ 
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    apk add --update --no-cache jpeg-dev &&  \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base musl-dev zlib zlib-dev linux-headers && \
    fi && \
    rm -rf /tmp && \
    apk del .tmp-build-deps && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user


ENV PATH="/py/bin:$PATH"

USER django-user

# CMD ["python","/app/scrap.py"]
