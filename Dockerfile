FROM ubuntu:18.04
RUN apt-get update && apt-get install -y firefox
RUN echo "Defaults        env_keep += \"DISPLAY XAUTHORITY\"" >> /etc/sudoers
RUN echo "Defaults        env_keep += \"https_proxy\"" >> /etc/sudoers
CMD /usr/bin/firefox
