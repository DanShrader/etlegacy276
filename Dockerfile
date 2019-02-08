FROM ubuntu:18.04
COPY run.sh /
ENTRYPOINT ["/run.sh"]