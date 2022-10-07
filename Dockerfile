FROM ubuntu:20.04 as base
#Requirements
LABEL maintainer="tabledevil"
LABEL docker.cmd="docker run -it --rm -v /mnt/sdc1:/data tabledevil/kaspersky"
RUN apt update && apt install -y wget perl

#Fix Locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM=screen-256color
RUN apt-get update \
  && apt-get install -yq locales \
  && locale-gen en_US.UTF-8 \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Download & Install Kaspersky (TODO: Update to 11)
RUN wget "https://products.s.kaspersky-labs.com/endpoints/keslinux10/10.1.1.6421/multilanguage-10.1.1.6421/babce9ef/kesl_10.1.1-6421_amd64.deb" 
RUN dpkg -i kesl_10.1.1-6421_amd64.deb 
RUN rm kesl_10.1.1-6421_amd64.deb

#Copy answerfile and run setup
ADD answer.txt /root/answer.txt
RUN /opt/kaspersky/kesl/bin/kesl-setup.pl --autoinstall=/root/answer.txt ; true

FROM ubuntu:20.04
COPY --from=base / /
ADD start.sh /root/start.sh
ADD readme /root/readme
RUN chmod +x /root/start.sh
ENTRYPOINT ["/root/start.sh"]
CMD ["shell"]