# build from alpine
FROM nvidia/cuda:11.6.2-devel-ubuntu20.04

WORKDIR /usr/local/src
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
        bash git make vim wget g++ ffmpeg
RUN git clone https://github.com/ggerganov/whisper.cpp.git -b v1.4.0 --depth 1

# whisper.cpp setup
WORKDIR /usr/local/src/whisper.cpp
RUN bash ./models/download-ggml-model.sh medium.en

# quantize a model with Q5_0 method
RUN make quantize
RUN ./quantize models/ggml-medium.en.bin models/ggml-medium.en-q5_0.bin q5_0

RUN make clean
RUN WHISPER_CUBLAS=1 make -j

# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
# RUN apk add sdl2-dev
# RUN make command

ADD cmd /usr/local/bin
