#!/bin/bash

# move to application root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${SCRIPT_DIR}
cd ../

# TODO: copying Gemfiles is temporary solution.
# TODO: think flat structure.
# copy Gemfiles to /docker/app
cp Gemfile docker/rails/
cp Gemfile.lock docker/rails/

cp front/ng/package.json docker/angular/
cp front/ng/package-lock.json docker/angular/

# exec docker-compose up
cd docker
docker-compose build --no-cache

# remove Gemfiles and packages
rm -rf rails/Gemfile*
rm -rf angular/package*