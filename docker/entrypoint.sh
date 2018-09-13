#!/bin/bash

# save this file to docker/entrypoint.sh

cmd="$1"

# Run chalk to load secrets early
# (it's ok if this fails, i.e., in local dev)
_ct=$(mktemp) ; rm -f $_ct ; chalk --debug > $_ct && source $_ct ; rm -f $_ct ; unset _ct

# start
echo
echo "[APP_START] $(cat .version)"
echo

set -e
cd /opt/app

run_resque() {
  echo "starting resque"
  exec env QUEUE=* gosu app:app bundle exec rake environment resque:work
}

run_migrations() {
  echo "running migrations"
  gosu app:app bundle exec rake db:migrate
}

run_db_setup() {
  echo "running db:setup"
  gosu app:app bundle exec rake db:setup
}

run_rails() {
  # refresh public cache in volume
  mkdir -p /var/www/app
  rm -rf /var/www/app/public
  cp -a public /var/www/app/

  run_migrations

  echo "starting rails"
  exec gosu app:app bundle exec rails s
}

case "$cmd" in
  resque)
    run_resque
    ;;
  db_setup)
    run_db_setup
    ;;
  migrate)
    run_migrations
    ;;
  rails|server)
    run_rails
    ;;
  bash|shell|sh)
    exec /bin/bash
    ;;
  *)
    run_rails
    ;;
esac
