FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y gcc python-dev libkrb5-dev && \
  apt-get install python3-pip -y && \
  pip3 install --upgrade pip && \
  pip3 install --upgrade virtualenv && \
  pip3 install pywinrm[kerberos] && \
  apt install krb5-user -y && \
  pip3 install pywinrm && \
  apt-get install -y sshpass && \
  apt-get install -y vim && \
  apt-get install -y ansible

RUN sed -i 's/#host_key_checking = False/host_key_checking = False/' /etc/ansible/ansible.cfg
