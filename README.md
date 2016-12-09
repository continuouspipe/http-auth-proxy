# HTTP Auth proxy

This Docker container is a simple HTTP proxy that will add an authentication layer.

## Getting started

```
docker run \
    -e HTTP_BACKEND=http://google.com \
    -e HTTP_USERS='samuel:password,system:otherpass' \
    docker.io/continuouspipe/http-auth-proxy
```

## Configuration

`HTTP_BACKEND`: The address of the backend
`HTTP_USERS`: A comma separated list of users. A user having the form `username:password`.
