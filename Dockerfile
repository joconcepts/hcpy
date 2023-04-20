FROM python:slim AS build
WORKDIR /app
RUN apt-get update ; DEBIAN_FRONTEND=noninteractive apt-get \
  --no-install-recommends -y install gcc libc6-dev libssl-dev
COPY requirements.txt /app
RUN pip3 install --user -r requirements.txt


FROM python:slim
COPY --from=build /root/.local /root/.local
WORKDIR /app
COPY . /app
ENTRYPOINT ["python3", "hc2mqtt", "config.json"]
