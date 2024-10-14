#!/bin/bash

# Chemin relatif vers le fichier docker-compose.yml (au même niveau que le script)
SCRIPT_DIR="$(dirname "$0")"
DOCKER_COMPOSE_FILE="$SCRIPT_DIR/docker-compose.yaml"

# Arrêter le conteneur si déjà en cours
docker compose -f $DOCKER_COMPOSE_FILE down

# Relancer le conteneur avec le volume dynamique
docker compose -f $DOCKER_COMPOSE_FILE up -d \
  --build \
  -V

docker attach --detach-keys="ctrl-d" nvim

