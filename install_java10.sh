#!/usr/bin/env bash

for f in /vagrant/archive/*jdk*_linux-x64_bin_ri.tar.gz; do
  jdk=$f
done

if [[ $jdk == "/vagrant/archive/*jdk*_linux-x64_bin_ri.tar.gz" ]]; then
  defaultjdk=openjdk-10+44_linux-x64_bin_ri.tar.gz
  wget -q -O /vagrant/archive/${defaultjdk} https://download.java.net/openjdk/jdk10/ri/${defaultjdk}
  jdk=/vagrant/archive/${defaultjdk}
else
  :
fi

mkdir /opt/java
cd /opt/java
tar zxvf ${jdk}
cd /home/vagrant

javaHome=/opt/java/jdk-10

echo "export JAVA_HOME=${javaHome}" >> .bash_profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> .bash_profile
