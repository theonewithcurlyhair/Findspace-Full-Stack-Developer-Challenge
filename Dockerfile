FROM python:3.8.7-alpine3.11
ADD server/requirements.txt /app/requirements.txt

RUN python -m venv /env
RUN /env/bin/pip install --upgrade pip
RUN /env/bin/pip install --no-cache-dir -r /app/requirements.txt

ADD server /app
WORKDIR /app

ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH

EXPOSE 8000

CMD ["gunicorn", "--bind", ":8000", "--workers", "1", "server.wsgi"]
