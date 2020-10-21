#!/bin/bash
[[ -z "$LINK" ]] && LINK="https://raw.githubusercontent.com/ZyCromerZ/redmi_begonia_dump/$branch"

GetLibPath="$(pwd)"

generateLib(){
    rm -rf $GetLibPath/system/vendor/lib/egl/*
    rm -rf $GetLibPath/system/vendor/lib64/egl/*
    [ ! -d $GetLibPath/system ] && mkdir $GetLibPath/system
    [ ! -d $GetLibPath/system/vendor ] && mkdir $GetLibPath/system/vendor
    [ ! -d $GetLibPath/system/vendor/lib ] && mkdir $GetLibPath/system/vendor/lib
    [ ! -d $GetLibPath/system/vendor/lib64 ] && mkdir $GetLibPath/system/vendor/lib64
    [ ! -d $GetLibPath/system/vendor/lib/egl ] && mkdir $GetLibPath/system/vendor/lib/egl
    [ ! -d $GetLibPath/system/vendor/lib64/egl ] && mkdir $GetLibPath/system/vendor/lib64/egl
    getLib "$1" "vendor/lib/egl/egl.cfg"
    getLib "$1" "vendor/lib/egl/libGLES_mali.so"
    getLib "$1" "vendor/lib/egl/libGLES_meow.so"
    getLib "$1" "vendor/lib/egl/libMEOW_trace.so"
    getLib "$1" "vendor/lib64/egl/egl.cfg"
    getLib "$1" "vendor/lib64/egl/libGLES_mali.so"
    getLib "$1" "vendor/lib64/egl/libGLES_meow.so"
    getLib "$1" "vendor/lib64/egl/libMEOW_trace.so"
}

getLib(){
    link="$1"
    path="$2"
    wget "$link/$path" -O "$GetLibPath/system/$path"
    FileSize="$(wc -c "$GetLibPath/system/$path" | awk '{print $1}')"
    [ "$FileSize" == '0' ] && rm -rf "$GetLibPath/system/$path"
}

generateLib "$LINK"
Version="$(date +'%m-%d-%Y %T')"
VersionCode="$(date +'%s')"
sed -i "s/00000/$Version/g" "$GetLibPath/module.prop" 
sed -i "s/11111/$VersionCode/g" "$GetLibPath/module.prop" 
sed -i "s/22222/$ZipName/g" "$GetLibPath/module.prop"
sed -i "s/22222/$ZipName/g" "$GetLibPath/customize.sh"

GpuZipName="$GetLibPath/[Magisk]Mali.GPU.from.$ZipName"

rm -rf compilled-gdrive
zip -r9 "$GpuZipName" * -x ./.git ./README.md ./.gitignore ./*.zip ./getlib.sh ./run.sh

[[ ! -d compilled-gdrive ]] && git clone https://${GIT_SECRET}@github.com/ZyCromerZ/gdrive_uploader.git compilled-gdrive
cd compilled-gdrive
chmod +x run.sh
. run.sh "$GpuZipName" doc "$(date +'%m-%d-%Y')"

git reset --hard