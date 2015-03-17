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

logFile="$2/build.log"

log "Using $2/Dockerfile"
log "Building temporary image..."
ID=$(uuidgen)
docker build -t $ID . >$logFile 2>&1

log "Squashing image and tagging..."
params=""
[[ $1 =~ base ]] && params="$params -from root"
[ $1 ] && [[ ! $1 =~ [-.] ]] && params="$params -t $1"
docker save $ID | sudo docker-squash $params | docker load >>$logFile 2>&1

log "Removing temporary image..."
docker rmi $ID >>$logFile 2>&1

log "${GREEN}DONE${NORMAL}"