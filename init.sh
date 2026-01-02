#!/bin/bash

#RUN python3 -m pip install --upgrade pip
python3 -m venv .venv
source .venv/bin/activate
pip install conan
conan profile detect 
conan install . --output-folder=build --build=missing
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build . -v