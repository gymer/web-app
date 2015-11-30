# web-app
Client office web application.

cp config/database.example.yml config/database.yml
cp config/secrets.example.yml config/secrets.yml

bower install

bin/rails s

## Test

rake db:test:prepare

bin/rspec
