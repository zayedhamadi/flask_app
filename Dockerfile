FROM ubuntu:20.04


RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install flask

COPY app.py /opt/app.py

ENV FLASK_APP=/opt/app.py

EXPOSE 5000

CMD ["/opt/venv/bin/flask", "run", "--host=0.0.0.0", "--port=5000"]
