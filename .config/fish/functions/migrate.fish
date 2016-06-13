function migrate -d 'run migrations'
  env RAILS_ENV=development bundle exec rake db:migrate
end
