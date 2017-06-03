# petstore-pipeline

Dockerfile and Ansible scripts to initialize pipeline instance.

## Test jenkins image

**Build it**

```
$ docker build -t petstore-pipeline .
```

**Run it**

```
$ docker run -dt --name -p 8080:8080 jenkins petstore-pipeline
```

Visit `8080` port, you would see a running Jenkins.

