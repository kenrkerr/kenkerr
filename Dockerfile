FROM nvidia/cuda:6.5-devel-ubuntu14.04
#7.5-runtime-ubuntu14.04

RUN apt-get update && apt-get -y --force-yes install cuda-samples-6.5 && apt-get clean
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


RUN cd /usr/local;git clone https://github.com/tsiv/ccminer-cryptonight.git
RUN ln -s /usr/local/ccminer-cryptonight /usr/local/ccminer

RUN cd /usr/local/ccminer-cryptonight; ./autogen.sh
RUN cd /usr/local/ccminer-cryptonight; ./configure
RUN cd /usr/local/ccminer-cryptonight;  make
RUN cd /usr/local/ccminer-cryptonight; echo /usr/local/ccminer/ccminer  -o stratum+tcp://monerohash.com:5555 --user=49uvSMKeK4ieyNb2Chng3G3TVBtTAib1d5bLDTimtbnBQXBAWsgTd5AMLn1mWrpejeLewm9Wv643QKiZVUQnmn4FRhTuSQq -p x >monerorun
RUN chmod 777 /usr/local/ccminer-cryptonight/monerorun
RUN ln -s /usr/local/ccminer-cryptonight/ccminer /usr/bin
RUN chmod -R go+rw /usr/local/ccminer-cryptonight

RUN cd /usr/local;git clone https://github.com/OhGodAPet/cpuminer-multi.git
RUN cd /usr/local/cpuminer-multi; ./autogen.sh
RUN cd /usr/local/cpuminer-multi; ./configure
RUN cd /usr/local/cpuminer-multi; make
RUN ln -s /usr/local/cpuminer-multi/minerd /usr/bin
RUN cd /usr/local/cpuminer-multi; echo /usr/local/cpuminer-multi/minerd  -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u 49uvSMKeK4ieyNb2Chng3G3TVBtTAib1d5bLDTimtbnBQXBAWsgTd5AMLn1mWrpejeLewm9Wv643QKiZVUQnmn4FRhTuSQq -p x >cpuminerrun
RUN chmod 777 /usr/local/cpuminer-multi/cpuminerrun
RUN chmod -R go+rw /usr/local/cpuminer-multi
ADD ./NAE/help.html /etc/NAE/help.html
