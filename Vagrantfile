Vagrant.configure('2') do |config|

  config.vm.define 'lab1' do |lab1|
    lab1.vm.box = 'gusztavvargadr/windows-server'
    lab1.vm.box_version = '1809.0.1909-standard-core'
    lab1.vm.network :private_network, ip: '192.168.50.101'
    lab1.vm.provider :virtualbox do |v|
      v.customize ['modifyvm', :id, '--memory', 2048]
      v.customize ['modifyvm', :id, '--cpus', 2]
      v.customize ['modifyvm', :id, '--name', 'lab1']
    end
    lab1.vm.provision 'shell', inline: <<-SCRIPT
        $PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
    SCRIPT
  end

  config.vm.define 'ansible' do |ansible|
    ansible.vm.box = 'centos/7'
    ansible.vm.network :private_network, ip: '192.168.50.105'
    ansible.vm.provider :virtualbox do |v|
      v.customize ['modifyvm', :id, '--memory', 512]
      v.customize ['modifyvm', :id, '--name', 'ansible']
    end
    ansible.vm.provision 'shell', inline: <<-SCRIPT
        sh /vagrant/setup_hosts_file.sh
        yum install -y -q epel-release
        yum install -y -q ansible python-pip
        yes | pip install "pywinrm>=0.3.0"
        /bin/cp -rf /vagrant/group_vars /etc/ansible/group_vars
        /bin/cp -rf /vagrant/hosts /etc/ansible/hosts
        /bin/cp -rf /vagrant/roles/* /etc/ansible/roles
        /bin/cp -f /vagrant/*.yml /etc/ansible/
        cd /etc/ansible ; ansible-playbook lab.yml
    SCRIPT
  end
end
