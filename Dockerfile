FROM python:3.10-alpine

COPY . /app
WORKDIR app

RUN pip install pipenv
RUN pipenv install --deploy --system

ENV APP_ENV=prod
ENV PYTHONUNBUFFERED=1

EXPOSE 8000

CMD [ "pipenv", "run", "gunicorn", "--bind=0.0.0.0:8000", "--worker-tmp-dir", "/dev/shm", "app.hello:app"]
