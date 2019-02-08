FROM ubuntu:18.04
COPY run.sh /
sudo chmod +x run.sh
ENTRYPOINT ["/run.sh"]