#!/bin/bash
#sudo bash ./shortBuild.sh
#cd ~/Ceres.js
cwd=$(pwd)
bdir=$(pwd)/build

rm -r $bdir/Ceres.js
mkdir $bdir/Ceres.js
cd $bdir/Ceres.js

#This line is returning an error due to problems with the ceres solver. The sed command is a workaround.
sed -i 's/include(CeresCodeGeneration)/# include(CeresCodeGeneration)/' $bdir/installpkg/lib/cmake/Ceres/CeresConfig.cmake
$bdir/emsdk/upstream/emscripten/emconfigure cmake $cwd/ -DCMAKE_INSTALL_PREFIX=$bdir/installpkg
$bdir/emsdk/upstream/emscripten/emmake make
cp --verbose $bdir/Ceres.js/Ceres.js $cwd/Ceres-v1.3.15.js

#~/emsdk/upstream/emscripten/emrun --browser "explorer.exe" ~/ceres.js-master/index.html
$bdir/emsdk/upstream/emscripten/emrun --browser "explorer.exe" $cwd/docs/composite.html
