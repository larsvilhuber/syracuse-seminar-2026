#!/bin/bash

# Load configuration from .myconfig.sh
PWD=$(pwd)
. ${PWD}/.myconfig.sh

# Set environment variables for docker-compose
export DOCKERSPACE=$space
export DOCKERREPO=$repo
export TAG=$tag
export CONTAINER_NAME="syracuse-seminar-rstudio"

# Show help if requested
if [[ "$1" == "-h" ]]; then
  cat << EOF
$0 [up|down|logs|ps] [DOCKER_ARGS...]

Commands:
  up      Start the container (default)
  down    Stop the container
  logs    View container logs
  ps      Show running containers

Parameters from .myconfig.sh:
  DOCKERSPACE: $space
  DOCKERREPO: $repo
  TAG: $tag
EOF
  exit 0
fi

# Parse docker-compose command
CMD=${1:-up}
shift

case $CMD in
  up|down|logs|ps)
    docker-compose $CMD $@
    ;;
  *)
    echo "Unknown command: $CMD"
    exit 1
    ;;
esac
