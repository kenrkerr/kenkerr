FROM nvidia/cuda:7.5-devel-ubuntu14.04
#7.5-runtime-ubuntu14.04

RUN apt-get update && apt-get -y --force-yes install cuda-samples-7.5 && apt-get clean
RUN make -C /usr/local/cuda/samples/1_Utilities/deviceQuery
RUN ln -s /usr/local/cuda/samples/1_Utilities/deviceQuery/deviceQuery /usr/bin
RUN apt-get update


RUN apt-get -y -q install git  
RUN apt-get -y -q install autotools-dev 
RUN apt-get -y -q install build-essential 
RUN apt-get -y -q install automake 
RUN apt-get -y -q install openssl 
RUN apt-get -y -q install libssl1.0.0 
RUN apt-get -y -q install libcurl4-openssl-dev 
RUN apt-get -y -q install libcurl4-nss-dev 
RUN apt-get -y -q install libcurl4-gnutls-dev


RUN cd /usr/local;git clone https://github.com/cbuchner1/ccminer.git

RUN mkdir /usr/local/ccminer/m4;cp /usr/share/aclocal/libcurl.m4 /usr/local/ccminer/m4

RUN cd /usr/local/ccminer; sed -i.bak 's/aclocal/aclocal -I m4/' autogen.sh

RUN cd /usr/local/ccminer; (echo "ACLOCAL_AMFLAGS = -I m4";cat Makefile.am )>xxxx;mv xxxx Makefile.am

RUN cd /usr/local/ccminer; echo ./autogen.sh>run.sh;echo ./configure>>run.sh;echo make>>run.sh;echo ls -l>>run.sh; chmod 777 run.sh

ADD ./NAE/help.html /etc/NAE/help.html

