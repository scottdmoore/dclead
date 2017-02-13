#!/bin/bash

while true
do
  git remote update
  UPSTREAM='@{u}'
  LOCAL=$(git rev-parse @{0})
  REMOTE=$(git rev-parse "$UPSTREAM")
  BASE=$(git merge-base @{0} "$UPSTREAM")

  if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
  elif [ $LOCAL == $BASE ]; then
    echo "Need to pull"
    git pull
    docker build --tag scoot21613/dclead .
    docker-compose up hugo
  fi
  sleep 10
done
