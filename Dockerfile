FROM nvidia/cuda:7.5-ubuntu14.04

RUN apt-get update && apt-get -y --force-yes install cuda-samples-7.5 && apt-get clean
RUN make -C /usr/local/cuda/samples/1_Utilities/deviceQuery
RUN ln -s /usr/local/cuda/samples/1_Utilities/deviceQuery/deviceQuery /usr/bin
