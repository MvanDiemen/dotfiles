function test-file -d 'Test a single file'
  env TEST=$argv bundle exec rake test
end
