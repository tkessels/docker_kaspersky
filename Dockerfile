FROM ubuntu:18.04
RUN apt update && apt install -y wget perl
RUN wget "https://products.s.kaspersky-labs.com/endpoints/keslinux10/10.1.1.6421/multilanguage-10.1.1.6421/babce9ef/kesl_10.1.1-6421_amd64.deb"
RUN dpkg -i kesl_10.1.1-6421_amd64.deb
ADD answer.txt /root/answer.txt
RUN /opt/kaspersky/kesl/bin/kesl-setup.pl --autoinstall=/root/answer.txt ; true
