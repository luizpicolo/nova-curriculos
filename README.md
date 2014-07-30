# Nova Curriculos

## Execute project

    git clone git@bitbucket.org:luizpicolo_/nova-curriculos.git
    bundle install
    rake db:create
    rake db:migrate
    
test

    rspec
    
execute server

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


## Deployment

    [add instructions]

## Contributors

- Gabriel Medina - Front-end Developer
- Vivi Vresk - Designer
- Luiz Picolo - Back-end Developer

---

(c) 2014 Nova Curriculos
