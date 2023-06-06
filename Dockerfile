# build from alpine
FROM alpine:3.14.2

WORKDIR /usr/local/src
# alpine update
RUN apk update
RUN apk add --no-cache bash git ffmpeg make g++ vim wget
# RUN apt update
# RUN apt install -y git ffmpeg make g++ vim wget
RUN git clone https://github.com/ggerganov/whisper.cpp.git -b v1.4.0 --depth 1

# whisper.cpp setup
WORKDIR /usr/local/src/whisper.cpp
RUN bash ./models/download-ggml-model.sh medium.en

# quantize a model with Q5_0 method
RUN make quantize
RUN ./quantize models/ggml-medium.en.bin models/ggml-base.en-q5_0.bin q5_0

RUN apk add --no-cache --virtual libsdl2-dev

RUN make

ADD entrypoint.sh /usr/local/bin
