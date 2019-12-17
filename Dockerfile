FROM ubuntu:18.04
LABEL maintainer="tabledevil"
LABEL docker.cmd="docker run -it --rm -v /mnt/sdc1:/data tabledevil/kaspersky"
RUN apt update && apt install -y wget perl
RUN wget "https://products.s.kaspersky-labs.com/endpoints/keslinux10/10.1.1.6421/multilanguage-10.1.1.6421/babce9ef/kesl_10.1.1-6421_amd64.deb" && dpkg -i kesl_10.1.1-6421_amd64.deb && rm kesl_10.1.1-6421_amd64.deb
ADD answer.txt /root/answer.txt
RUN /opt/kaspersky/kesl/bin/kesl-setup.pl --autoinstall=/root/answer.txt ; true
ADD start.sh /root/start.sh
add readme /root/readme
RUN chmod +x /root/start.sh
ENTRYPOINT ["/root/start.sh"]
CMD ["shell"]
