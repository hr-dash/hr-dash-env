# hr-dash-env

## Install
```
vagrant plugin install vagrant-hostsupdater
git clone git@github.com:hr-dash/hr-dash-env.git
vagrant up # To edit /etc/hosts sudo必要になるのでpassword入力

# Add ssh config
vagrant ssh-config --host hr-dash-server >> ~/.ssh/config
```

## Setup
`nodes/vagrant.yml`を設定

## Execute
### development(vagrant)
```
bundle exec itamae ssh --vagrant --sudo -y nodes/vagrant.yml recipes/install.rb

## deploy app from hr-dash
bundle exec cap vagrant deploy

bundle exec itamae ssh --vagrant --sudo -y nodes/vagrant.yml recipes/start.rb
```
