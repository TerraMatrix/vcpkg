@echo off
setlocal enabledelayedexpansion

set "search1=F:/vcpkg/buildtrees"      //�滻buildtrees�ļ���·��
set "replace1=F:/vcpkg/buildtrees"
set "search2=F:/vcpkg/download"     //�滻downloads�ļ���·��
set "replace2=F:/vcpkg/downloads"

for %%f in (*.bat) do (
    if /i not "%%~nxf"=="ALL�滻.bat" (
        set "input=%%f"
        set "output=%%f.tmp"
        (for /f "usebackq delims=" %%l in ("!input!") do (
            set "line=%%l"
            set "line=!line:%search1%=%replace1%!"
            set "line=!line:%search2%=%replace2%!"
            echo !line!
        )) > "!output!"
        move /y "!output!" "!input!" > nul
    )
)

echo Done!