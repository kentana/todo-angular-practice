#!/bin/bash
# stop docker.
# when stopping <C-c> remains server pid file in foreground execution.
# this script stop docker and remove pid file.


# move to application root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${SCRIPT_DIR}
cd ../

# remove pid file.
rm -f tmp/pids/server.pid

# stop docker.
cd docker
docker-compose down -v