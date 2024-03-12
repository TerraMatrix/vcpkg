@echo off
setlocal enabledelayedexpansion

set "search1=x64-windows"      //Ìæ»»buildtreesÎÄ¼þ¼ÐÂ·¾¶
set "replace1=arm64-linux"
set "search2=F:/vcpkg/buildtrees"     //Ìæ»»downloadsÎÄ¼þ¼ÐÂ·¾¶
set "replace2=/data/workspace/buildtrees"
set "search3=F:/vcpkg/downloads"     //Ìæ»»downloadsÎÄ¼þ¼ÐÂ·¾¶
set "replace3=/data/workspace/downloads"

for %%f in (*.bat) do (
    if /i not "%%~nxf"=="ALLÌæ»».bat" (
        set "input=%%f"
        set "output=%%f.tmp"
        (for /f "usebackq delims=" %%l in ("!input!") do (
            set "line=%%l"
            set "line=!line:%search1%=%replace1%!"
            set "line=!line:%search2%=%replace2%!"
            set "line=!line:%search3%=%replace3%!"
            echo !line!
        )) > "!output!"
        move /y "!output!" "!input!" > nul
    )
)

echo Done!