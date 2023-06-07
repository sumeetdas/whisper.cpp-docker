Dockerfile to create docker image for whisper.cpp (https://github.com/ggerganov/whisper.cpp).

Inspired from https://github.com/miyataka/whisper.cpp-docker.

Aim of this project is to support all commands of whisper.cpp.

This assumes the language to be English. You can change the language type in the `Dockerfile`.

To build docker image: `docker build -t sumeetdas/whisper.cpp-docker .`

Docker command to create a container (Windows):
```sh
docker run --name whisper_cpp -v 'C:\Users\user\dir_name':/usr/local/src/whisper.cpp/mnt sumeetdas/whisper.cpp-docker  sleep infinitely
```

Docker command to run a command on the container:
```sh
docker exec whisper_cpp entrypoint.sh translate $FILE_NAME
```

Docker command:

```sh
docker run -v $VOLUME_PATH:/usr/local/src/whisper.cpp/mnt -it $IMAGE entrypoint.sh $COMMAND_NAME $OTHER_ARGS
```

where 
* `$VOLUME_PATH`: Path to the directory in your computer designated as a container volume.
    * Example linux path: `/home/user/whisper.cpp-docker/mnt`
    * Example windows path: `C:\Users\user\whisper.cpp-docker\mnt`
* `$IMAGE`: Name of the docker image for whisper.cpp
* `$COMMAND_NAME`: Name of the command to be executed
    * `transcribe`: Transcribe the audio file
    * `command`: Execute a command on the audio file
* `$OTHER_ARGS`: Pass on other arguments as required by the command. For example: 
    * `./mnt/$INPUT_MEDIA_FILE_NAME`: Path of the media file where `$INPUT_MEDIA_FILE_NAME` is the name of the media file in the container volume.
