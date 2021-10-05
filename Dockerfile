FROM jjanzic/docker-python3-opencv:latest

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

COPY .  ./app
WORKDIR ./app
RUN pip install -r requirements.txt
EXPOSE 4455