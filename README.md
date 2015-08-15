# Docker TCP socket proxy

A simple proxy which proxies the docker `unix://` socket
to a `tcp://` socket.

This is useful when you want to expose the docker daemon
through `tcp` **on-demand**.

For instance, when your docker deamon has been started as, say:

    docker -d -H unix:///var/run/docker.sock

and you don't want to restart it as, say:

     docker -d \
        -H unix:///var/run/docker.sock \
        -H tcp://localhost:8000

Instead you want to expose the docker daemon through `tcp`
and on-demand, without restarting the service.

## Usage

### 1) Start the proxy

To launch the proxy for the first time do:

    docker run \
        -d \
        --name docker_tcp_sock \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -p 8000:8000 \
        geoder101/docker-socket-tcp-proxy

#### Remarks

Should you wish to stop it then you can simply do:

    docker stop docker_tcp_sock

And should you wish to start it again just do:

    docker start docker_tcp_sock

### 2) Use the `tcp://localhost:8000`  socket

Provided that the proxy is up and running
you should be able to connect to the docker daemon
through the `tcp://` socket.

For instance, you can do:

    docker -H tcp://localhost:8000 ps
