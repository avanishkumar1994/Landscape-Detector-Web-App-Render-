FROM python:3.7-slim-stretch

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

RUN apt-get update
RUN apt-get install -y libsm6 libxext6 libxrender-dev libglib2.0-0

COPY app app/

RUN python app/server.py

EXPOSE 5000

CMD ["python", "app/server.py", "serve"]
