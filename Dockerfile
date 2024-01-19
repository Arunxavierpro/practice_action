FROM ubuntu:20.04
RUN apt-get update && apt-get install -y software-properties-common gcc && \
    add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y python3.6 python3.6-distutils python3-pip
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python3", "app.py"]
