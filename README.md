hack-vagrant
============

This is a Vagrant project for use at any of the hack-a-thons

## Vagrant

install from http://downloads.vagrantup.com/
Do not use rubygems, that is deprecated from Vagrant.

## Basic usage

Install vagrant and the associated virtual machine software; usually Virtualbox, but also VMWare Fusion.

after you clone this repo, just cd to the appropriate folder and:

``` bash
git submodule init
git submodule update
vagrant up
```

Once this is all complete head on over to http://localhost:8080/ofni.php and you should see the handy dandy phpinfo output.

## Advanced usage

There are a few different virtualhosts installed. If you have the magic of dnsmasq, you can see each of them. By default the symfony project is the first to be loaded so it takes precedence.

### dnsmasq

dnsmasq is a magical creature that acts as a dns cache and can do some awesome things like we're about to do, VERY simply. 

#### dnsmasq configuration

if you want *.lvhack to resolve to 127.0.0.1 then you add this to your /etc/dnsmasq.conf

```
address=/lvhack/127.0.0.1
```

now http://silex.lvhack:8080 will actually go to your localbox which vagrant has just forwarded 8080 to your VM.

if you want to have that pesky 8080 go away then you should add this:

```
address=/lvhack/172.24.123.123
```

We have 172.24.123.123 pointing to the vagrant box. so now you should only need to do http://symfony.lvhack on your local machine.

### http://symfony.lvhack:8080

This is the playground we will be generally playing in.

### http://silex.lvhack:8080

This is a fun playground also, maybe another time?

