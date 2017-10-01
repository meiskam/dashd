# dashd

Docker that listens for Amazon Dash button presses on its network and uses an ifttt webhook giving the mac address of the button  
Hub: https://hub.docker.com/r/meiskam/dashd/

* Give it the environment variable given by ifttt.com for webhook KEY=asdf1234
* Give it access to your real network (eth0) so it can listen to ARP requests
* You'll have to make your own ifttt applet, [example](https://i.imgur.com/qsvtBJt.png)

## Command examples
`docker build . -t dashd`  
`docker run -d -e "KEY=asdf1234" --net=eth0 --rm --name="dashd" dashd`  
`docker run -d -e "KEY=asdf1234" -e "DATE=%m/%d/%y %H:%M:%S" -e "TZ=4" -e "QUIET=1" --net=eth0 --rm --name="dashd" dashd`  
`docker run -d -e "KEY=asdf1234" -e "MUSIC=1" --privileged --net=eth0 --rm --name="dashd" dashd`  

## Variables
Var   | Values  | Desc
----- | ------- | ---
KEY   | string  | your ifttt webhook key
QUIET | boolean | silence text output
DATE  | string  | format as specified by https://linux.die.net/man/1/date
MUSIC | boolean | plays beep on button press, requires `--privileged`