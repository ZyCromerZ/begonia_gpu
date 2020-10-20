
LINK="https://raw.githubusercontent.com/ZyCromerZ/redmi_begonia_dump/$branch"

getLib(){
    rm -rf ./system//vendor/lib/egl/*
    rm -rf ./system//vendor/lib64/egl/*
    wget "$1"/vendor/lib/egl/egl.cfg -O ./system//vendor/lib/egl/egl.cfg
    wget "$1"/vendor/lib/egl/libGLES_mali.so -O ./system//vendor/lib/egl/libGLES_mali.so
    wget "$1"/vendor/lib/egl/libGLES_meow.so -O ./system//vendor/lib/egl/libGLES_meow.so
    wget "$1"/vendor/lib/egl/libMEOW_trace.so -O ./system//vendor/lib/egl/libMEOW_trace.so
    wget "$1"/vendor/lib/egl/egl.cfg -O ./system//vendor/lib/egl/egl.cfg
    wget "$1"/vendor/lib64/egl/libGLES_mali.so -O ./system//vendor/lib64/egl/libGLES_mali.so
    wget "$1"/vendor/lib64/egl/libGLES_meow.so -O ./system//vendor/lib64/egl/libGLES_meow.so
    wget "$1"/vendor/lib64/egl/libMEOW_trace.so -O ./system//vendor/lib64/egl/libMEOW_trace.so
}

getLib "$LINK"
Version="$(date +'%m%d%Y')"
VersionCode="$(date +'%s')"
sed -i "s/00000/$Version/g" ./module.prop 
sed -i "s/11111/$VersionCode/g" ./module.prop 
sed -i "s/22222/$ZipName/g" ./module.prop

GpuZipName="$(pwd)/Mali.GPU.update-downdate.from.$ZipName.zip"

zip -r9 "$GpuZipName" * -x .git README.md .gitignore *.zip getlib.sh