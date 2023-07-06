FROM alpine:latest

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN apk add --no-cache python3 && apk add --update py-pip && pip3 install flask && pip3 install speechRecognition

# copy every content from the local file to the image
COPY . /app

# configure the container to run in an executed manner
ENTRYPOINT [ "python" ]

CMD ["app.py" ]