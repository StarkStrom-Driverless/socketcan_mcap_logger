# Installation
- use gcc13 for compiling 

```shell
# create pyhton env 
python3 -m venv .venv
source .venv/bin/activate

#install conan
pip install conan

# detect conan profile once
conan profile detect

# build dependecies
conan install . --output-folder=build --build=missing
cd build

# build project
cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build . -v
```

# Docker
```shell
# build docker image
docker build -t my-conan-gcc13 .

# start docker container and pass workspace to it
sudo docker run -it --rm -v /home/maximilian/Git/socketcan_mcap_logger:/workspace:Z -w /workspace my-conan-gcc13

# build 
./init.sh
```

# Usage
MCL uses gflags. Therefor it is required to parse some aruguments into the programm
- --config_file : path to the configfile of the logger
- --proto_file : path to the location where the protofiles should be stored. If you pass this argument, the logger do not start. It produces the proto-files based on the .dbc files in the config-file.

# Example
- Starting the logger
```
./MCL --config_file="~/Git/mcap_can_logger/config/config.yaml"
```


