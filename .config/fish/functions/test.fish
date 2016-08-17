function runtest -d "Run tests"
  if set -q argv;
    env bundle exec rake test TEST=$argv
  else;
    bundle exec rake test
  end
end
