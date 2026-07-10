## 👋 Welcome to soft-serve 🚀  

soft-serve README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update soft-serve
```
  
## Install and run container
  
```shell
dockerHome="/srv/$USER/docker/casjaysdevdocker/soft-serve/soft-serve/latest/rootfs"
mkdir -p "/srv/$USER/docker/soft-serve/rootfs"
git clone "https://github.com/dockermgr/soft-serve" "$HOME/.local/share/CasjaysDev/dockermgr/soft-serve"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/soft-serve/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-soft-serve-latest \
--hostname soft-serve \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/soft-serve:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/soft-serve
    container_name: casjaysdevdocker-soft-serve
    environment:
      - TZ=America/New_York
      - HOSTNAME=soft-serve
    volumes:
      - "/srv/$USER/docker/casjaysdevdocker/soft-serve/soft-serve/latest/rootfs/data:/data:z"
      - "/srv/$USER/docker/casjaysdevdocker/soft-serve/soft-serve/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/soft-serve
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/soft-serve" "$HOME/Projects/github/casjaysdevdocker/soft-serve"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/soft-serve"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
