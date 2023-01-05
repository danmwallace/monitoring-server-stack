#!/bin/bash

main() {
  printf "Creating monitoring network...\n"
  docker network create monitoring-network
  printf "Installing/Starting monitoring stack ...\n"
  printf "Installing/Starting Prometheus, Grafana, AlertManager, CAdvisor and NetData ... \n"
  docker-compose -f ./monitoring-stack/docker-compose.yml up -d
  printf "If there were any errors, check them with docker logs <container name> \n"
  printf "Useful commands (from within metrics-stack or efk-stack): \n"
  printf " - To turn off a service: docker compose down <grafana,prometheus,etc> \n"
  printf " - To turn on a service: docker compose up <grafana,prometheues,etc> -d (to detach) \n"
  printf "Note: These should be executed within the directory that contains the docker compose file for that service \n"
  printf "\n"
  printf "If all was successful, containers should be reachable on the following ports: \n"
  printf " - Grafana: 3000\n"
  printf " - Prometheus:9090\n"
  printf " - CAdvisor: 8080\n"
  printf " - Loki: 3100\n"
  printf " - AlertManager: 9093\n"
  printf " - If you have installed Netdata on the host, this is configured for the default port, 19999 ...\n "
  printf "\n"
  printf "If you are running this inside of an LXC container, you will need to add the following rules on the host if not already done so by install-stack.sh:\n"
  printf "lxc config device add monitor-stack grafana proxy listen=tcp:0.0.0.0:3000 connect=tcp:127.0.0.1:3000\n"
  printf "lxc config device add monitor-stack loki proxy listen=tcp:0.0.0.0:3100 connect=tcp:127.0.0.1:3100\n"
}



main "$@"
