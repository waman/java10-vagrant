Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder ".", "/vagrant", disable: true
  config.vm.synced_folder "archive/", "/vagrant/archive", create: true
  config.vm.synced_folder "project/", "/home/vagrant/project", create: true

  config.vm.provision :shell, path: "ubuntu.sh"
  config.vm.provision :shell, path: "install_java10.sh"
  config.vm.provision :shell, path: "install_gradle.sh"
end