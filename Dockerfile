FROM python:3.11.6-slim

ENV PYTHONBUFFERED=1

WORKDIR /app

# 필수 패키지 설치 (git, gcc, python3-dev)
RUN apt-get update && apt-get install -y git gcc python3-dev

COPY ./requirements.txt app/requirements.txt

RUN pip install -r app/requirements.txt

COPY . .

CMD ["python","manage.py","runserver","0.0.0.0:8000"]