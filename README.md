# ![image](https://github.com/eugesma/stockmanage/blob/master/app/assets/images/LogoStockManage.png?raw=true)

Stockmanage is a RoR web responsive application to manage everything related to sales and stock.

### Requisites:
* [Ruby version 2.6.5](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rvm-on-ubuntu-18-04)

* [PostgreSQL 10](https://www.digitalocean.com/community/tutorials/como-instalar-y-utilizar-postgresql-en-ubuntu-18-04-es)

### Setup development
Clone the repo...
```sh
$ git clone https://github.com/eugesma/stockmanage.git
```
Set ruby version
```sh
$ cd stockmanage
$ echo "ruby-2.6.5" > .ruby-version
$ echo "stockmanage" > .ruby-gemset
```
Install gems and dependencies
```sh
$ bundle install
```
If raise the following error
> An error occurred while installing pg (1.2.1), and Bundler cannot continue.

Try:
```sh
$ sudo apt-get install libpq-dev
$ bundle install
```
Install NodeJs
```sh
$ sudo apt-get install nodejs
```
[Create database and user](https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e) and then 
```sh
bin/rake db:migrate
```
Finally
```sh
bin/rails s
```
