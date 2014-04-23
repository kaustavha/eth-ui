tryethereum
===========

Try Ethereum with an online interface

### Installation:  
You need pip, nodejs and mongo-db installed, the rest of the dependencies should take care of themselves. 
[http://nodejs.org/](http://nodejs.org/)  
[http://docs.mongodb.org/manual/installation/](http://docs.mongodb.org/manual/installation/)  
[http://www.pip-installer.org/en/latest/](http://www.pip-installer.org/en/latest/)  
Also install python 2.7.5+ if you don't have it.  
Quickstart for *ubuntu systems:  
Note: do a "sudo su" before running the following  
```
apt-get install python-pip nodejs
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
apt-get update
apt-get install mongodb-org=2.6.0 mongodb-org-server=2.6.0 mongodb-org-shell=2.6.0 mongodb-org-mongos=2.6.0 mongodb-org-tools=2.6.0
sudo service mongod start
```
Look at the Cakefile first, it installs a few things.  
Remove anything you don't need or want upgraded to save time.  

Then run:  
```
cake build
```

Note:  
If you get an error from the server related to pyethtool command not found  
Include the files in pyethereum/bin in your path or copy them to /usr/local/bin on ubuntu based OSs 