# Jenkins Basic

Jenkins service with user authentication disabled and docker cli inside.

## Build it

```
$ docker build -t jenkins2-basic .
```

## Run it

```
$ docker run -dt --name jenkins \
        -p 8080:8080 \
        -v /var/run/docker.sock:/var/run/docker.sock \
        jenkins2-basic
```

Visit `8080` port, you would see a running Jenkins.

