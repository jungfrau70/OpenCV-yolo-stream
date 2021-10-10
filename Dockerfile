FROM jjanzic/docker-python3-opencv:latest

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

RUN pip install --upgrade pip
RUN pip install ipykernel && \
    python -m ipykernel install --sys-prefix && \
    pip install --quiet --no-cache-dir \
    'boto3>1.0<2.0' \
    'sagemaker>2.0<3.0'

COPY ./code/  ./code
WORKDIR ./code
RUN pip install -r requirements.txt
EXPOSE 4455

#ENTRYPOINT [ "python", "OpenCV-yolo-stream-web.py",  "-u", "https://youtu.be/1EiC9bvVGnk", "-y", "yolo-coco" ]
CMD ["python", "OpenCV-yolo-stream-web.py", "-y", "yolo-coco", "-u", "https://www.youtube.com/watch?v=cPrgSpXQyo0&list=PLhftnBJAzXanV9roLJMTwgZvHpdLNdIXr" ]