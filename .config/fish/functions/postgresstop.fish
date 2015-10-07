function postgresstop -d 'Postgresql server stop'
  pg_ctl -D /usr/local/var/postgres stop -s -m fast
end
