@echo off
setlocal enabledelayedexpansion
set "search1=E:/vcpkg/buildtrees"      //�滻buildtrees�ļ���·��
set "replace1=/data/workspace/vcpkg/buildtrees"
set "search2=E:/vcpkg/downloads"     //�滻downloads�ļ���·��
set "replace2=/data/workspace/vcpkg/downloads"
for %%f in (*.bat) do (
    if /i not "%%~nxf"=="ALL�滻.bat" (
        set "input=%%f"
        set "output=%%f.tmp"
        (for /f "usebackq delims=" %%l in ("ALL替换.bat") do (
            set "line=%%l"
            set "line=            set "line=%%l""
            set "line=            set "line=            set "line=%%l"""
            echo             set "line=            set "line=            set "line=%%l"""
        )) > "ALL替换.bat.tmp"
        move /y "ALL替换.bat.tmp" "ALL替换.bat" > nul
    )
)
echo Done
