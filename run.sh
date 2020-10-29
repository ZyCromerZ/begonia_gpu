#!/bin/bash

currPath="$(pwd)"

MakeGpuModule(){
    ZipName="$1"
    branch="$2"
    chmod +x getlib.sh
    . getlib.sh
    cd $currPath
}

MakeGpuModule miui_BEGONIA_20.10.29_04b140f215_10.0.zip begonia-user-10-QP1A.190711.020-20.10.29-release-keys

cd "$currPath" && rm -rf "$currPath/*" 