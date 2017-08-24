# Jenkins Basic

This image simply have maven tool, docker service, and basic plugins installed,
for easier automation setup pipeline.

This image is already in Dockerhub.
Link: [flin/jenkins-v2-basic:2.75](https://hub.docker.com/r/flin/jenkins-v2-basic/).

What's inside:

- Jenkins v2.75
- Docker 17.06.1-ce
- Jdk 1.8.0
- Maven 3.5
- Jenkins Git Plugin
- Jenkins Pipeline Plugin

## Build it

```
$ docker build -t jenkins-v2-basic .
```

## Run it

```
$ docker run -dt --name jenkins \
        -p 8000:8000 \
        -e REGISTRY_IP=<your-http-registry-ip> \
        jenkins-v2-basic
```

Visit `8000` port, you would see a running Jenkins.

