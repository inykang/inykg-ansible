# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'fileutils'

Vagrant.require_version ">= 1.6.0"

# Defaults for config options defined in CONFIG
$num_instances = 3
#$instance_name_prefix = "centos"
$instance_name_prefix = "cent"
$enable_serial_logging = false
$share_home = false
$vm_gui = false
#$vm_memory = 8192
$vm_memory = 4092
#$vm_memory = 1024
$vm_cpus = 2
$forwarded_ports = {}

# Attempt to apply the deprecated environment variable NUM_INSTANCES to
# $num_instances while allowing config.rb to override it
if ENV["NUM_INSTANCES"].to_i > 0 && ENV["NUM_INSTANCES"]
  $num_instances = ENV["NUM_INSTANCES"].to_i
end

# Use old vb_xxx config variables when set
def vm_gui
  $vb_gui.nil? ? $vm_gui : $vb_gui
end

def vm_memory
  $vb_memory.nil? ? $vm_memory : $vb_memory
end

def vm_cpus
  $vb_cpus.nil? ? $vm_cpus : $vb_cpus
end

Vagrant.configure("2") do |config|
  config.vm.boot_timeout = 3000
  # always use Vagrants insecure key
  config.ssh.insert_key = false

  config.vm.box = "centos/7"

  # enable hostmanager
  config.hostmanager.enabled = true

  # configure the host's /etc/hosts
  config.hostmanager.manage_host = true

  (1..$num_instances).each do |i|
    config.vm.define vm_name = "%s-%02d" % [$instance_name_prefix, i] do |config|
      config.vm.hostname = vm_name

      ## For the second disk
      #file_2nd_disk = ".second_disk_#{i}.vdi"
      #config.vm.provider :virtualbox do |vb|
      #  unless File.exists?(file_2nd_disk)
      #    vb.customize ['createmedium', 'disk', '--filename', file_2nd_disk, '--size', 100*1024, '--variant', 'Standard']
      #    vb.customize ['storagectl', :id, '--name', "SATA Controller", '--add', "sata"]
      #    vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0,  '--type', 'hdd', '--medium', file_2nd_disk]
      #  end
      #end

      if $enable_serial_logging
        logdir = File.join(File.dirname(__FILE__), "log")
        FileUtils.mkdir_p(logdir)

        serialFile = File.join(logdir, "%s-serial.txt" % vm_name)
        FileUtils.touch(serialFile)

        config.vm.provider :virtualbox do |vb, override|
          vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
          vb.customize ["modifyvm", :id, "--uartmode1", serialFile]
        end
      end

      ## foward Docker registry port to host for node 01
      ##if i == 1
      ## foward Docker registry port to host for all nodes
      #  config.vm.network :forwarded_port, guest: 5000, host: 5000
      ##end

      config.vm.provider :virtualbox do |vb|
        vb.gui = vm_gui
        vb.memory = vm_memory
        vb.cpus = vm_cpus
      end

      ip = "172.17.8.#{100+i}"
      config.vm.network :private_network, ip: ip

    end
  end
end
