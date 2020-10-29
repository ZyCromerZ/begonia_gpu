#!/bin/bash

currPath="$(pwd)"

MakeGpuModule(){
    ZipName="$1"
    branch="$2"
    chmod +x getlib.sh
    . getlib.sh
    cd $currPath
}

MakeGpuModule miui_BEGONIAGlobal_V11.0.6.0.PGGMIXM_41b14febb2_9.0.zip begonia-user-9-PPR1.180610.011-V11.0.6.0.PGGMIXM-release-keys

MakeGpuModule miui_BEGONIAIDGlobal_V11.0.2.0.PGGIDXM_56ff332bed_9.0.zip begonia-user-9-PPR1.180610.011-V11.0.2.0.PGGIDXM-release-keys

MakeGpuModule miui_BEGONIA_20.9.10_c84222bc2b_10.0.zip begonia-user-10-QP1A.190711.020-20.9.10-release-keys

MakeGpuModule begonia_global_images_V12.0.3.0.QGGMIXM_20200902.0000.00_10.0_global_abde420a62.tgz begonia-user-10-QP1A.190711.020-V12.0.3.0.QGGMIXM-release-keys

MakeGpuModule begonia_id_global_images_V12.0.1.0.QGGIDXM_20200729.0000.00_10.0_global_b9571b29f9.tgz begonia-user-10-QP1A.190711.020-V12.0.1.0.QGGIDXM-release-keys

MakeGpuModule miui_BEGONIARUGlobal_V12.0.3.0.QGGRUXM_1725d98751_10.0.zip begonia-user-10-QP1A.190711.020-V12.0.3.0.QGGRUXM-release-keys

MakeGpuModule miui_BEGONIA_20.9.17_c8cda40c33_10.0.zip begonia-user-10-QP1A.190711.020-20.9.17-release-keys

MakeGpuModule miui_BEGONIA_20.9.24_939a40bb01_10.0.zip  begonia-user-10-QP1A.190711.020-20.9.24-release-keys

MakeGpuModule miui_BEGONIA_20.10.15_2cd7a116ad_10.0.zip begonia-user-10-QP1A.190711.020-20.10.15-release-keys

MakeGpuModule miui_BEGONIA_20.10.19_ed7c98faae_10.0.zip  begonia-user-10-QP1A.190711.020-20.10.19-release-keys

MakeGpuModule miui_BEGONIAIDGlobal_V12.0.2.0.QGGIDXM_931415b370_10.0.zip begonia-user-10-QP1A.190711.020-V12.0.2.0.QGGIDXM-release-keys

MakeGpuModule miui_BEGONIA_20.10.20_5799a21d5f_10.0.zip begonia-user-10-QP1A.190711.020-20.10.20-release-keys

MakeGpuModule miui_BEGONIAEEAGlobal_V12.0.2.0.QGGEUXM_7b0e08bd84_10.0.zip begonia-user-10-QP1A.190711.020-V12.0.2.0.QGGEUXM-release-keys

MakeGpuModule miui_BEGONIA_20.10.22_ec8abec846_10.0.zip begonia-user-10-QP1A.190711.020-20.10.22-release-keys

MakeGpuModule miui_BEGONIA_20.10.29_04b140f215_10.0.zip begonia-user-10-QP1A.190711.020-20.10.29-release-keys

cd "$currPath" && rm -rf "$currPath/*" 