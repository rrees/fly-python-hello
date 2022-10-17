FROM python:3.10-alpine

COPY . /app
WORKDIR app

RUN pip install pipenv
RUN pipenv install

ENV PYTHONUNBUFFERED=1

EXPOSE 8000

ENTRYPOINT [ "pipenv", "run", "gunicorn", "--bind=0.0.0.0:8000", "--worker-tmp-dir", "/dev/shm", "app.hello:app"]
