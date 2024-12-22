#!/bin/bash

#envsetup
export PROJ=flag-arm
export TINA_TOP=$(pwd)
export VARIANT_CHOICES=tina

#lunch
export TINA_BUILD_TOP=${TINA_TOP}
export TINA_TARGET_ARCH=arm
export TARGET_PRODUCT=v536_Lindenis_SOM
export TARGET_PLATFORM=v536
export TARGET_BOARD=v536-Lindenis_SOM
export TARGET_PLAN=Lindenis_SOM
export TARGET_BUILD_VARIANT=tina
export TARGET_BUILD_TYPE=release
export TARGET_KERNEL_VERSION=4.9
export TARGET_UBOOT=u-boot-2014.07
export TARGET_CHIP=sun8iw16p1
export LICHEE_PACK_OUT_DIR=${TINA_BUILD_TOP}/out/${TARGET_BOARD}/image
export LICHEE_CHIP_CONFIG_DIR=${TINA_BUILD_TOP}/device/config/chips/${TARGET_PLATFORM}
export BUILD_ENV_SEQUENCE_NUMBER=10
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

make(){
  local start_time=$(date +"%s")
  local end_time=$(date +"%s")
  command make V=s "$@"
  local ret=$?
  local tdiff=$(($end_time-$start_time))
  local hours=$(($tdiff / 3600 ))
  local mins=$((($tdiff % 3600) / 60))
  local secs=$(($tdiff % 60))
  echo
  if [ $ret -eq 0 ] ; then
    echo -n -e "#### make completed successfully "
  else
    echo -n -e "#### make failed to build some targets "
  fi
  if [ $hours -gt 0 ] ; then
    printf "(%02g:%02g:%02g (hh:mm:ss))" $hours $mins $secs
  elif [ $mins -gt 0 ] ; then
    printf "(%02g:%02g (mm:ss))" $mins $secs
  elif [ $secs -gt 0 ] ; then
    printf "(%s seconds)" $secs
  fi
  echo -e " ####"
  echo
  return $ret
}


pack(){
  local target_img="${TINA_TOP}/out/v536-Lindenis_SOM/tina_v536-Lindenis_SOM_uart0_nor.img"
  rm -f ${target_img} >/dev/null 2>&1

  "${TINA_TOP}/scripts/pack_img.sh" \
    -p ${TARGET_BUILD_VARIANT} \
    -b ${TARGET_PRODUCT} \
    -c ${TARGET_CHIP} \
    -t ${TINA_TOP} \
    -m normal \
    -d uart0

  if [ -f "${target_img}" ]; then
    mv "${target_img}" "./flag-arm_$(git log -n 1 --pretty=format:"%h").img"
    echo "Image packing completed successfully."
  fi
}


# MAIN
#rm -rf ${TINA_TOP}/tmp

# merge split files
cd ${TINA_BUILD_TOP}/lichee/brandy/toolchain
for file in gcc-linaro-arm.tar.xz gcc-linaro-aarch64.tar.xz; do
  if [ ! -f "$file" ]; then
    echo "Merging split files into: $file.."
    #The shell expands it into a list of matching filenames in lexicographical order: file.0, file.1, file.2, etc.
    cat "$file".* > "$file"
  fi
done

. ${TINA_BUILD_TOP}/target/allwinner/v536-Lindenis_SOM/v536_Lindenis_SOM-setup.sh
cd ${TINA_BUILD_TOP}

#make menuconfig
#make kernel_menuconfig
#make -j$(nproc)
#
#make -j$(nproc) 2>&1 | tee build.log; grep -n -i "error" build.log
#parallel --joblog build_log make -j$(nproc)
