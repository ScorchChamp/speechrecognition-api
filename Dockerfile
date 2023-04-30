FROM python:3.11

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install flask
RUN pip install speechRecognition

# copy every content from the local file to the image
COPY . /app

# configure the container to run in an executed manner
ENTRYPOINT [ "python" ]

CMD ["app.py" ]