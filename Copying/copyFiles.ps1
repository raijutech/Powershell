Set-Location $PSScriptRoot
$computers = Get-Content .\computers.txt
$source = "C:\Files\Test\*"
$dest = "c$\Users\Public\Desktop\Utilities\SuperF4"


foreach ($Computer in $Computers) {

    try {

        if (Test-Connection $Computer -Count 1 -Quiet) {
            Write-Host "$Computer is online" -ForegroundColor Green
            New-Item -ItemType directory -Path "\\$Computer\$dest"
            Copy-Item -Force $source -Destination "\\$computer\$dest" -Recurse
        }

    }

    catch {

        Write-Host "$Computer is offline" -ForegroundColor Red
        Add-Content -value $computer -path ".\deadPCs.txt"

    }
}