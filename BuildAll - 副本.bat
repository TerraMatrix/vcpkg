

echo "install  osg"
echo "--------------------------------------------"


echo "install  osg"
echo "--------------------------------------------"


echo "install  qgis"
echo "--------------------------------------------"
vcpkg install qgis[bindings,3d,server,pip-mirrors,debug-tools,ltr] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse  --editable

