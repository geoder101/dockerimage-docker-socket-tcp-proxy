default:
	$(error Please select a target. Type `make help` for more information.)

## Build the image
build:
	docker build -t geoder101-docker-socket-tcp-proxy .

## Run an instance of the built image
run:
	docker run --name docker_tcp_sock -v /var/run/docker.sock:/var/run/docker.sock -p 8000:8000 geoder101-docker-socket-tcp-proxy &

## Update git dependencies
gitdependencies:
	git submodule update --init --recursive --remote
	git submodule foreach git reset --hard origin/master

-include includes/makefile/help.mk
