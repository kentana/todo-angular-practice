#!/bin/bash
# docker up and execute migration.

# move to application root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${SCRIPT_DIR}
cd ../

cd docker

# foreground.
# docker-compose up

# background.
docker-compose up -d

# TODO: temporary solution.
# wait 5 sec.
sleep 5

# create db.
docker-compose run --rm rails rails db:create

# migrate db.
docker-compose run --rm rails rails db:migrate
