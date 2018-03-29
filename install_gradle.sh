#!/usr/bin/env bash

for f in /vagrant/archive/gradle-*-bin.zip; do
  gdlzip=$f
done

if [[ $gdlzip == "/vagrant/archive/gradle-*-bin.zip" ]]; then
  defaultzip=gradle-4.6-bin.zip
  wget -q -O /vagrant/archive/${defaultzip} https://services.gradle.org/distributions/${defaultzip}
  gdlzip=/vagrant/archive/${defaultzip}
else
  :
fi

mkdir /opt/gradle
unzip -d /opt/gradle ${gdlzip}

gdl=${gdlzip:17:-8}
cd /home/vagrant
echo "export GRADLE_HOME=/opt/gradle/$gdl" >> .bash_profile
echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> .bash_profile
