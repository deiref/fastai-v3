FROM python:3.7-slim-stretch

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt --upgrade

RUN pip install fastai --upgrade

RUN pip install https://github.com/fastai/fastai1/archive/master.zip

COPY app app/

RUN python app/server.py

EXPOSE 5042

CMD ["python", "app/server.py", "serve"]
