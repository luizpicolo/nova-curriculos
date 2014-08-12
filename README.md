# Nova Curriculos

[ ![Codeship Status for luizpicolo_/nova-curriculos](https://www.codeship.io/projects/45fcd340-0090-0132-fb71-6a55843d78ca/status)](https://www.codeship.io/projects/30001)

## Execute project

    git clone git@bitbucket.org:luizpicolo_/nova-curriculos.git
    bundle install
    rake db:create
    rake db:migrate
    
execute server

    bundle exec rake sunspot:solr:start (development)
    bundle exec rake sunspot:solr:reindex (development)
    rails s
    open http://localhost:3000
    
## Generate Access to Admin

    rails c

copy 

    User.new({:name => "YOUR NAME", :email => "YOUR MAIL", :password => "YOUR PASSWORD", :password_confirmation => "CONFIRME YOUR PASSWORD", :admin => true}).save


## Dependencies

- Ruby 2.1.0+
- Mysql 5.5+ or Postgre 9.3+ DataBase
- rvm 1.25.x+ (optional)


## Execute test

    bundle exec sunspot-solr start -p 8983
    rspec

## Deployment

    mina deploy
    mina deploy:cleanup

## Contributors

- Gabriel Medina - Front-end Developer
- Vivi Vresk - Designer
- Luiz Picolo - Back-end Developer

---

(c) 2014 Nova Curriculos
