# Espressobin NAS

I bought a Marvell Espressobin thinking I could use it as a NAS because it has a SATA adapter and figured I'd make some instructions and an Ansible playbook to help anyone else who wanted to try setting one up using their Ubuntu 16.04.3 image.

The performance is TERRIBLE though! There's a reason this is only good as a router. Using dd, I could only get 22 MB/s write speeds on the HDD, and my samba transfer speed was a mere 3 MB/s. I'd recommend going with another device with a better CPU!

Anyways, if you do decide to go down this route, follow the Espressobin [instructions on setting up Ubuntu on an SD card](http://wiki.espressobin.net/tiki-index.php?page=Boot+from+removable+storage+-+Ubuntu) and then connect to the espressobin using the serial cable by following their instructions. Once you're in, run the following commands:

    ifconfig eth0 up
    dhclient wan
    apt update && apt upgrade
    apt install openssh-server python bash-completion avahi-daemon
    hostname espressobin
    service avahi-daemon restart

Then you can run the ansible playbook from your control machine with ./setup.sh