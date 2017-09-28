dashd
=====
Docker that listens for Dash button presses on its network and uses an ifttt webhook giving the mac address of the button

* Give it the environment variable given by ifttt.com for webhook KEY=asdf1234
* Give it access to your real network (eth0) so it can listen to ARP requests
* You'll have to make your own ifttt applet