
LINK="https://raw.githubusercontent.com/ZyCromerZ/redmi_begonia_dump/$branch"

generateLib(){
    rm -rf ./system//vendor/lib/egl/*
    rm -rf ./system//vendor/lib64/egl/*
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
    wget "$1"/$2 -O ./system/$2
    FileSize="$(wc -c "system/$2" | awk '{print $1}')"
    [ "$FileSize" == '0' ] && rm -rf ./system/$2
}

generateLib "$LINK"
Version="$(date +'%m%d%Y')"
VersionCode="$(date +'%s')"
sed -i "s/00000/$Version/g" ./module.prop 
sed -i "s/11111/$VersionCode/g" ./module.prop 
sed -i "s/22222/$ZipName/g" ./module.prop

GpuZipName="$(pwd)/Mali.GPU.update-downdate.from.$ZipName"

zip -r9 "$GpuZipName" * -x .git README.md .gitignore *.zip getlib.sh

git reset --hard