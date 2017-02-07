function reset_test_db -d 'Reset the test env database'
  env RAILS_ENV=test rake db:drop db:create db:test:prepare db:migrate
end
