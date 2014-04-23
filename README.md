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
```
sudo apt-get install python-pip nodejs  
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list  
sudo apt-get update  
sudo apt-get install mongodb-org=2.6.0 mongodb-org-server=2.6.0 mongodb-org-shell=2.6.0 mongodb-org-mongos=2.6.0 mongodb-org-tools=2.6.0  
sudo service mongod start  
```

Then get out of su and run:  
```
sudo cake build  
```

You can also run "sudo cake -s build" to skip git cloning pyethereum and serpent and global npm installs.  

Note:  
If you get an error from the server related to pyethtool command not found  
Include the files in pyethereum/bin in your path or copy them to /usr/local/bin on ubuntu based OSs 