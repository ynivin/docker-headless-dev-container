FROM consol/centos-xfce-vnc

# Switch to root user to install additional software
USER 0

## Install a gedit
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
RUN yum check-update -y || :
RUN yum install code -y

## switch back to default user
USER 1000