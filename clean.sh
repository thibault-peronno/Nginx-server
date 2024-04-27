#!/bin/bash
 
# Obtention de l'ID du conteneur Docker contenant 'nginx_master'
container_id=$(docker ps -a | grep nginx_master | awk '{print $1}')
 
# Vérification si l'ID du conteneur est non vide
if [ ! -z "$container_id" ]; then
    # Arrêt du conteneur
    docker stop "$container_id"
    
    # Suppression du conteneur
    docker rm "$container_id"
    
    # Suppression de l'image nginx:alpine
    docker rmi nginx:alpine
else
    echo "Aucun conteneur contenant 'nginx_master' trouvé."
fi
 