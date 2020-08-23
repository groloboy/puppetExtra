# -*- mode: ruby -*-
$script = <<-SCRIPT
echo I am provisioning...
apt-get update
echo Now puppet provision...
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "hashicorp/precise64"
    # make sure our apt sources are up to date…
    config.vm.provision :shell, :inline => $script# config for the appserver box, same name as .pp file.
    config.vm.define "appserver" do |app|
        #app.vm.network :hostonly, "66.66.66.10"
        # bridge the VM on the host’s eth0 interface
        # if eth0 does not exist then Vagrant will
        # prompt you to select an actual interface.
        app.vm.network :private_network, ip: "192.168.100.3"
        #Puppet gets grumpy if the hostname is not a FQDN…
        app.vm.host_name = "appserver"
        app.vm.provision :puppet do |puppet|# change fqdn to give to change the vm virtual host
            puppet.facter = {
                "fqdn" => "appserver",
            }
            puppet.module_path = "puppet/modules"
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file = "appserver.pp"
        end
    end
end