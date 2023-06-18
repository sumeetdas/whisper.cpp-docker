#!/bin/bash

# MODEL_NAME=models/ggml-medium.en-q5_0.bin
MODEL_NAME=models/ggml-medium.en.bin
PROJECT_ROOT=/usr/local/src/whisper.cpp

# run different commands based on the first argument
if [ "$1" = 'sample' ]; then 
    echo "Convert audio to text without any logging"
    ./main -m $MODEL_NAME -f $PROJECT_ROOT/samples/jfk.wav --no-timestamps 
# elif [ "$1" = 'command' ]; then
#     echo "Running command"
#     echo "Say the following phrase: 'Ok Whisper, start listening for commands'"
#     # run the application
#     ./command -m $MODEL_NAME -t 8 -ac 768
elif [ "$1" = 'run' ]; then
    echo "Running transcribe $2"
    ffmpeg -i $PROJECT_ROOT/mnt/$2 -ar 16000 samples/test.wav
    ./main -m $MODEL_NAME -f samples/test.wav --no-timestamps
else
    echo "Unknown command"
fi
