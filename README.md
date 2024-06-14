# FriendlyELEC-Ubuntu20-Docker

This docker image provide a base build environment for cross-compiling your code.  

## Usage

- Clone the repository

```bash
git clone https://github.com/littlecxm/friendlyelec-ubuntu20-docker.git
```

- Build the docker image

```bash
docker build -t "fa-ubuntu20" friendlyelec-ubuntu20-docker
```

- Run the docker container

```bash
docker run --name fa-ubuntu20 --privileged -it -v /tmp:/tmp -v /dev:/dev -v ~/work:/work fa-ubuntu20 bash
```

## Build FriendlyWRT

Follow [official guide](https://wiki.friendlyelec.com/wiki/index.php/How_to_Build_FriendlyWrt/zh) to build FriendlyWRT.
