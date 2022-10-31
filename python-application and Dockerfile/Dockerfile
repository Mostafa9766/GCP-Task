FROM python:3.7

COPY . /gcp-task

WORKDIR /gcp-task

RUN pip install -r requirements.txt

RUN export $(cat .env | xargs)

CMD [ "python3", "hello.py" ]

