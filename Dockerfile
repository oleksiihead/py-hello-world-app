FROM python:3.9-slim-buster

RUN useradd serve

WORKDIR /home/serve

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY app app
COPY hello-world.py ./

ENV FLASK_APP hello-world.py

RUN chown -R serve:serve ./
USER serve

EXPOSE 80

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
