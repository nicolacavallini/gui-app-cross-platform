# Development Structure for a cross Platform Application

## Idea

The application in this repository answers a very simple question:
"Can I develop an application using my preferred environment
(ubuntu linux as an example), and then deploy it to windows using `docker`"

### Priorities

 - Guest system is linux, ubuntu I think

 - Develop an guest application using graphical resources of the host system
   both windows and linux, and maybe mac os.

## Linux

Simply copy what I did at camlin.

## Winzoz

Get inspiration from this [link](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde)

- Install the X server on windows (I don't like this very much bust still). Remember to save the configuration file.

- Make sure winzoz has the correct login credentials:
```
docker logout
docker login
```
- Prepare a simple `Dockerfile`
```
FROM ubuntu:14.04
RUN apt-get update && apt-get install -y firefox
CMD /usr/bin/firefox
```
- Configure the display variable  :
   - First Check your ETHERNET ADAPTER IP:
   ```
   ipconfig
   ```
   ```
   Ethernet adapter vEthernet (Opzione predefi):

   Connection-specific DNS Suffix  . :
   Link-local IPv6 Address . . . . . : fe80::c4ef:28df:2c8d:2e6b%15
   IPv4 Address. . . . . . . . . . . : 172.20.42.193
   Subnet Mask . . . . . . . . . . . : 255.255.255.240
   Default Gateway . . . . . . . . . :
   ```
   - Set the `DISPLAY` variable
   ```
   set-variable -name DISPLAY -value 172.20.42.193
   ```
- Run the container:
```
docker run -ti --rm -e DISPLAY=$DISPLAY firefox
```
