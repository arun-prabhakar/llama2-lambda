#!/bin/bash

python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt

MODELURL="https://huggingface.co/TheBloke/Llama-2-13B-GGML/resolve/main/llama-2-13b.ggmlv3.q2_K.bin"
DOWNLOAD_DIR="./llama_cpp_docker/"
FILE_NAME="modelfile.bin"

if [ -f "$DOWNLOAD_DIR$FILE_NAME" ]; then
    echo "Model already exists: $FILE_NAME"
else
    # Use wget to download the file
    wget -O "$DOWNLOAD_DIR$FILE_NAME" "$MODELURL"
fi

cdk deploy
