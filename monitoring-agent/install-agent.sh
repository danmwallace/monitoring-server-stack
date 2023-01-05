#!/bin/bash

main() {
  printf "Installing Loki & promtail agents..\n"
  sudo chown -R 10001:10001 ./loki
  sudo chown -R 10001:10001 ./promtail
  docker compose -f ./docker-compose.yml up -d
}

main "$@"