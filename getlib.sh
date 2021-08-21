#!/bin/bash
[[ -z "$FROM" ]] && FROM="https://raw.githubusercontent.com/ZyCromerZ/redmi_begonia_dump"

LINK="$FROM/$branch"

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
    for ListFiles in egl.cfg libGLES_mali.so libGLES_meow.so libMEOW_gift.so libMEOW_trace.so
    do
        getLib "$1" "vendor/lib/egl/$ListFiles"
        getLib "$1" "vendor/lib64/egl/$ListFiles"
    done
}

getLib(){
    link="$1"
    path="$2"
    wget "$link/$path" -O "$GetLibPath/system/$path"
    FileSize="$(wc -c "$GetLibPath/system/$path" | awk '{print $1}')"
    [ "$FileSize" == '0' ] && rm -rf "$GetLibPath/system/$path"
}

generateLib "$LINK"
TimeBuild="$(date +'%m-%d-%Y %T')"
sed -i "s/00000/$TimeBuild/g" "$GetLibPath/META-INF/com/google/android/update-binary" 
sed -i "s/11111/$ZipName/g" "$GetLibPath/META-INF/com/google/android/update-binary"

GpuZipName="$GetLibPath/[$(date +'%s')][Recovery]Mali.GPU.from.$ZipName"

rm -rf compilled-gdrive
zip -r9 "$GpuZipName" * -x ./.git ./README.md ./.gitignore ./*.zip ./getlib.sh ./run.sh

[[ ! -d compilled-gdrive ]] && git clone https://${GIT_SECRET}@github.com/ZyCromerZ/uploader-kernel-private.git compilled-gdrive --depth=1
cd compilled-gdrive
chmod +x run.sh
. run.sh "$GpuZipName" doc "$(date +'%m-%d-%Y')"
rm -rf "$GpuZipName"

git reset --hard