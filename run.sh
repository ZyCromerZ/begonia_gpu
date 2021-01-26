#!/bin/bash

currPath="$(pwd)"

MakeGpuModule(){
    ZipName="$1"
    branch="$2"
    chmod +x getlib.sh
    . getlib.sh
    cd $currPath
}

MakeGpuModule miui_BEGONIA_21.1.22_d28f4ee734_11.0.zip begonia-user-11-RP1A.200720.011-21.1.22-release-keys

cd "$currPath" && rm -rf "$currPath/*" 