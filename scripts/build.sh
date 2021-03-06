#~/bin/bash
set -e

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
NORMAL="\033[0m"

################################################################################
# Function definitions
usage() {
  echo -e "Usage: $0 <image-tag> <Dockerfile-dir>"
}

log() {
  echo -e "$(date +'%d-%m-%Y %H:%M:%S') ${YELLOW}==${NORMAL} $1"
}

error() {
  echo -e "${RED}Please specify all required parameters.${NORMAL}"
  usage
  exit 1
}
################################################################################
[ $# == 2 ] || error

tag=$1
targetDir=$2
logFile="$targetDir/build.log"
dockerFile="$targetDir/Dockerfile"
gitRev=$(git rev-parse --short HEAD)
revTag="$tag-$gitRev"

log "Dockerfie: ${BLUE}$dockerFile${NORMAL}" 
log "Tag:       ${YELLOW}$tag${NORMAL}"
log "Building temporary image..."
ID=$(uuidgen | tr [:upper:] [:lower:])
docker build -t $ID $targetDir >$logFile 

log "Squashing image and tagging..."
params=""
[[ $tag =~ base ]] && params="$params -from root"
[[ ! $tag =~ [-.:]$ ]] && params="$params -t $tag"
docker save $ID | sudo docker-squash $params | docker load >>$logFile

log "Removing temporary image..."
docker rmi $ID >>$logFile

log "${GREEN}DONE${NORMAL}"
