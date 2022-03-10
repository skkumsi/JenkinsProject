FROM jenkins/jenkins
USER root
RUN apt-get update && apt-get install -y rsync python3-pip nmap telnet zip gcc maven apt-transport-https ca-certificates curl software-properties-common && pip install --upgrade awscli && apt-get update && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
apt-get update && \
apt-get install -y docker-ce docker-ce-cli containerd.io && \
usermod -s /bin/bash jenkins
#COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt && 
RUN usermod -a -G docker jenkins && usermod -a -G root jenkins
USER jenkins
