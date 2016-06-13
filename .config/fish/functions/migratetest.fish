function migratetest -d 'run migrations for test env'
  env RAILS_ENV=test bundle exec rake db:migrate
end
