

echo "install  osg"
echo "--------------------------------------------"
vcpkg install osg[collada,tools,plugins] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  osg"
echo "--------------------------------------------"
vcpkg install osg-qt  osgearth --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  qgis"
echo "--------------------------------------------"
vcpkg install qgis[bindings,3d,server,pip-mirrors,debug-tools,ltr] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse  --editable

