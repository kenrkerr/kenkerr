FROM nvidia/cuda:6.5-devel-ubuntu14.04
#7.5-runtime-ubuntu14.04

#RUN apt-get update && apt-get -y --force-yes install cuda-samples-6.5 && apt-get clean
#RUN make -C /usr/local/cuda/samples/1_Utilities/deviceQuery
#RUN ln -s /usr/local/cuda/samples/1_Utilities/deviceQuery/deviceQuery /usr/bin

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
RUN cd /usr/local/ccminer-cryptonight; echo /usr/local/ccminer/ccminer  -o stratum+tcp://monerohash.com:5555 --user=49uvSMKeK4ieyNb2Chng3G3TVBtTAib1d5bLDTimtbnBQXBAWsgTd5AMLn1mWrpejeLewm9Wv643QKiZVUQnmn4FRhTuSQq -p x -t 4>monerorun4
RUN cd /usr/local/ccminer-cryptonight; echo /usr/local/ccminer/ccminer  -o stratum+tcp://monerohash.com:5555 --user=49uvSMKeK4ieyNb2Chng3G3TVBtTAib1d5bLDTimtbnBQXBAWsgTd5AMLn1mWrpejeLewm9Wv643QKiZVUQnmn4FRhTuSQq -p x \$\*>moneroplus
RUN chmod 777 /usr/local/ccminer-cryptonight/monerorun
RUN chmod 777 /usr/local/ccminer-cryptonight/monerorun4
RUN chmod 777 /usr/local/ccminer-cryptonight/moneroplus
RUN ln -s /usr/local/ccminer-cryptonight/ccminer /usr/bin
RUN chmod -R go+rw /usr/local/ccminer-cryptonight
ADD ./NAE/help.html /etc/NAE/help.html

