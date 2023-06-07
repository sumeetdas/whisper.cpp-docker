#!/bin/bash

# MODEL_NAME=models/ggml-medium.en-q5_0.bin
MODEL_NAME=models/ggml-medium.en.bin
PROJECT_ROOT=/usr/local/src/whisper.cpp

# run different commands based on the first argument
if [ "$1" = 'command' ]; then
    echo "Running command"
    echo "Say the following phrase: 'Ok Whisper, start listening for commands'"
    # run the application
    ./command -m $MODEL_NAME -t 8 -ac 768
elif [ "$1" = 'transcribe' ]; then
    echo "Running transcribe"
    ffmpeg -i $INPUT_MEDIA_FILE_NAME -ar 16000 samples/test.wav
    ./main -m $MODEL_NAME --output-csv --output-file ./mnt/output -l $LANG -f samples/test.wav
elif [ "$1" = 'translate' ]; then
    FILE_NAME=$2
    ffmpeg -i $PROJECT_ROOT/mnt/$FILE_NAME -ar 16000 $PROJECT_ROOT/samples/test.wav
    ./main -m $MODEL_NAME -f $PROJECT_ROOT/samples/test.wav
else
    echo "Unknown command"
fi
