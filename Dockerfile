FROM nvidia/cuda:8.0-runtime-ubuntu16.04

#RUN make -C /usr/local/cuda/samples/1_Utilities/deviceQuery
RUN ln -s /usr/local/cuda/samples/1_Utilities/deviceQuery/deviceQuery /usr/bin

ADD ./NAE/help.html /etc/NAE/help.html

