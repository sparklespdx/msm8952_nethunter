# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Box for Ubuntu provider, Digital Ocean uses its own
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".vagrant/"

  # Local box
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
  end

  # DigitalOcean spinup
   config.vm.provider :digital_ocean do |provider, override|
      override.ssh.private_key_path = ENV['DO_SSH_KEY_PATH']
      override.vm.box = 'digital_ocean'
      override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
      provider.token = ENV['DO_APIKEY']
      provider.image = 'ubuntu-14-04-x64'
      provider.region = 'sfo2'
      provider.size = '8gb'
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  # Installs build dependencies and prepares environment
  # config.vm.provision "shell", inline: <<-SHELL
  #   sh /vagrant/provision.sh
  #   sh /vagrant/get_sources.sh
  # SHELL
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yml"
  end
end
