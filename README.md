# hr-dash-env

## Install
```
git clone git@github.com:hr-dash/hr-dash-env.git
vagrant box add centos-6.5 https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box
vagrant up
```

## Execute
### development(vagrant)
```
bundle exec itamae ssh --vagrant -y nodes/vagrant.yml --sudo roles/vagrant.rb
```
