# PowerShell script to replace paths in all .bat files
$search1 = "E:/vcpkg/buildtrees"
$replace1 = "/data/workspace/vcpkg/buildtrees"
$search2 = "E:/vcpkg/downloads"
$replace2 = "/data/workspace/vcpkg/downloads"

Write-Host "Starting path replacement..."
Write-Host "Search1: $search1 -> Replace1: $replace1"
Write-Host "Search2: $search2 -> Replace2: $replace2"
Write-Host ""

Get-ChildItem -Path "." -Filter "*.bat" | ForEach-Object {
    if ($_.Name -ne "ALL替换.bat") {
        Write-Host "Processing $($_.Name)..."
        $content = Get-Content -Path $_.FullName -Raw
        $content = $content -replace [regex]::Escape($search1), $replace1
        $content = $content -replace [regex]::Escape($search2), $replace2
        Set-Content -Path $_.FullName -Value $content -NoNewline
        Write-Host "  - Updated $($_.Name)"
    }
}

Write-Host ""
Write-Host "Done!"