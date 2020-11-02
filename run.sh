#!/bin/bash

currPath="$(pwd)"

MakeGpuModule(){
    ZipName="$1"
    branch="$2"
    chmod +x getlib.sh
    . getlib.sh
    cd $currPath
}

MakeGpuModule miui_BEGONIA_20.11.2_d7f8e06908_10.0.zip begonia-user-10-QP1A.190711.020-20.11.2-release-keys

cd "$currPath" && rm -rf "$currPath/*" 