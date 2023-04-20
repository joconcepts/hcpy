FROM python:slim
WORKDIR /app
RUN apt-get update ; DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential libssl-dev
COPY requirements.txt /app
RUN pip3 install -r requirements.txt
COPY . /app
ENTRYPOINT ["python3", "hc2mqtt", "config.json"]
