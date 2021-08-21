#!/bin/bash

currPath="$(pwd)"

MakeGpuModule(){
    ZipName="$1"
    branch="$2"
    chmod +x getlib.sh
    . getlib.sh
    cd $currPath
}

MakeGpuModule miui_BEGONIAIDGlobal_V12.5.2.0.RGGIDXM_c690ecd789_11.0.zip begonia-user-11-RP1A.200720.011-V12.5.2.0.RGGIDXM-release-keys

cd "$currPath" && rm -rf "$currPath/*" 