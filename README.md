Dockerfile to create docker image for whisper.cpp (https://github.com/ggerganov/whisper.cpp).

Inspired from https://github.com/miyataka/whisper.cpp-docker.

Aim of this project is to support all commands of whisper.cpp.

This assumes the language to be English. You can change the language type in the `Dockerfile`.

To build docker image: `docker build -t sumeetdas/whisper.cpp-docker .`

Docker command to create a container (Windows):
```sh
docker run --name whisper_cpp --gpus all -v 'C:\Users\user\dir_name':/usr/local/src/whisper.cpp/mnt sumeetdas/whisper.cpp-docker  sleep infinity
```

Docker command to run a command on the container:
```sh
docker exec whisper_cpp cmd translate $FILE_NAME
```

