#! /bin/sh

export exepath=$(cd `dirname $0`; pwd)

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/media/vis/D/workspace/vcpkg/installed/x64-linux-dynamic/lib:/media/vis/D/workspace/build-qgis-3.20.0-Qt5_dynamic-Release/SDK/lib
cd $exepath

export sofiles="$( find $exepath -type f -name "*.so" )"

for i in `ls -a $exepath`
do 
     if [ x"$i" != x"." -a x"$i" != x".." ]; then
         if [ -f "$exepath/$i" ]; then
			 if [ -x $exepath/${i}  ]; then
					export sofiles="$sofiles $exepath/$i"
			 fi
         fi
    fi
done

for i in $sofiles
do
	 echo $i
     cp -L -n $( ldd "$i" | awk '{if (match($3,"/")){ print $3}}' )  "$exepath/lib"
done
