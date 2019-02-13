FROM ubuntu:18.04

ENV ETL_PATH /root/etlegacy

RUN apt-get update -y && apt-get install -y wget
RUN apt-get install -y nano
RUN wget -O etlegacy-v2.76-x86_64.tar.gz https://www.etlegacy.com/download/file/121 \
&& tar -xzf etlegacy-v2.76-x86_64.tar.gz && rm -f etlegacy-v2.76-x86_64.tar.gz \
&& mv etlegacy-v2.76-x86_64 $ETL_PATH

ENV PAK_MIRROR mirror.etlegacy.com/etmain/

WORKDIR $ETL_PATH/etmain
RUN wget http://$PAK_MIRROR/pak0.pk3 \
&& wget http://$PAK_MIRROR/pak1.pk3 \
&& wget http://$PAK_MIRROR/pak2.pk3 \
&& wget http://$PAK_MIRROR/mp_bin.pk3

COPY etl_server.cfg /root/etlegacy/etmain/
EXPOSE 27960/udp
WORKDIR $ETL_PATH
RUN apt-get -y install git

# Change last_commit hash as a cache buster
# FROM: https://github.com/mingfang/docker-cloud9/blob/master/Dockerfile
ENV latest_commit b70a6ab4752b50f18962b12d01cd6044b84c8316

COPY userScript.sh /root/etlegacy/etmain/userScript.sh

ENTRYPOINT ["/bin/bash" , "-c", "source /root/etlegacy/etmain/userScript.sh"]