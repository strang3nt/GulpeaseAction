FROM ubuntu:18.04
ENV LANG en_US.UTF-8
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt install -y poppler-utils locales python python-pip wget
RUN locale-gen
RUN pip install textract


COPY gulpease.py /gulpease.py
COPY entrypoint.sh /entrypoint.sh


RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
