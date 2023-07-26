#!/bin/bash

# Function to check if a Docker container needs an update
check_update() {
  service_name="$1"

  if [ -f "/home/draugmar/docker/$service_name/docker-compose.yml" ]; then
    compose_file="/home/draugmar/docker/$service_name/docker-compose.yml"
  elif [ -f "/home/draugmar/docker/$service_name/docker-compose.yaml" ]; then
    compose_file="/home/draugmar/docker/$service_name/docker-compose.yaml"
  else
    echo "ERROR: No 'docker-compose.yml' found in $service_name"
    echo "-----------------------"
    return
  fi

  # Get the current version of the containers
  current_versions=$(docker-compose -f "$compose_file" ps -q | xargs docker inspect --format='{{index .Config.Labels "version"}}' 2>/dev/null)
  docker-compose -f "$compose_file" pull --quiet
  docker-compose -f "$compose_file" up -d

  # Get the latest version of the containers after the update
  latest_versions=$(docker-compose -f "$compose_file" ps -q | xargs docker inspect --format='{{index .Config.Labels "version"}}' 2>/dev/null)

  # Count how many images have newer versions
  count_updates=0
  IFS=$'\n'
  for i in $current_versions; do
    for j in $latest_versions; do
      if [ "$i" != "$j" ]; then
        ((count_updates++))
        break
      fi
    done
  done

  if [ $count_updates -gt 0 ]; then
    echo "Container: $service_name"
    echo "Update is available!"
    echo "Performing update..."
    echo "Update completed for $service_name"
    echo "-----------------------"
  else
    echo "Container: $service_name"
    echo "No update needed."
    echo "-----------------------"
  fi
}

# Loop through each service directory and check for updates
for service_dir in /home/draugmar/docker/*/; do
  service_name=$(basename "$service_dir")
  check_update "$service_name"
done
