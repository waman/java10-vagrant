#!/usr/bin/env bash

for f in /vagrant/archive/*jdk*_linux-x64_bin.tar.gz; do
  jdk=$f
done

if [[ $jdk == "/vagrant/archive/*jdk*_linux-x64_bin.tar.gz" ]]; then
  defaultjdk=openjdk-10+46_linux-x64_bin.tar.gz
  wget -q -O /vagrant/archive/$defaultjdk https://download.java.net/java/jdk10/archive/46/GPL/$defaultjdk
  jdk=/vagrant/archive/$defaultjdk
else
  :
fi

mkdir /opt/java
cd /opt/java
tar zxvf ${jdk}
cd /home/vagrant

export JAVA_HOME=/opt/java/jdk-10
export PATH=$PATH:$JAVA_HOME/bin

echo "export JAVA_HOME=$JAVA_HOME" >> .bash_profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> .bash_profile
