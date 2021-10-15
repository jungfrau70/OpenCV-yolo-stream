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
CMD ["python", "OpenCV-yolo-stream-web.py", "-y", "yolo-coco", "-u", "https://www.youtube.com/watch?v=VGmasG6_j9c" ]
                                                                    #   https://www.youtube.com/watch?v=OHkBoLsjNSE
                                                                    #   https://www.youtube.com/watch?v=-jOcsIKKA20
                                                                    
                                                                    #0.3 https://www.youtube.com/watch?v=n6LTG1y37K4&t=8s
                                                                    #0.4 https://driveandlisten.herokuapp.com/
                                                                    #0.5 https://www.youtube.com/watch?v=VGmasG6_j9c  londonbus