#!/bin/bash
set -e

cmd="$@"

until rake db:exists; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
rake db:migrate
exec rails server -b 0.0.0.0
