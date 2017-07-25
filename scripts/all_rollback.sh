#/bin/bash
PHINX="docker-compose run --rm db-migrate"

dbs=$(ls ./db/migrations)
for _db in ${dbs};
do
  sed -e "s/%%PHINX_DBNAME%%/${_db}/g" phinx.default.yml > phinx.tmp.yml
  ${PHINX} rollback -c phinx.tmp.yml -t 0 -v
  rm phinx.tmp.yml
done
