# Chukka Environment Setup Bootstrapper
#
$dir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$dirChoco = $dir + "\\choco"

Write-Host @"

----------------------------------------
 _____  _   _ _   _ _   __ _   __  ___ 
/  __ \| | | | | | | | / /| | / / / _ \ 
| /  \/| |_| | | | | |/ / | |/ / / /_\ \ 
| |    |  _  | | | |    \ |    \ |  _  | 
| \__/\| | | | |_| | |\  \| |\  \| | | |  
 \____/\_| |_/\___/\_| \_/\_| \_/\_| |_/   

--------Environment Bootstrapper--------

"@


Write-Host @"

--------------Chocolatey----------------

"@
If(!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
    Write-Host "Chocolatey not detected.`r`nInstalling Chocolatey..."

    & "$dirChoco\\chocoInstall.ps1"

    # Emulate refreshenv for the current PowerShell session
    $env:ChocolateyInstall = Convert-Path "$((Get-Command choco).Path)\..\.." 
    Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
}
Else{
    Write-Host "Chocolatey install detected.`r`nSkipping..."
}



Write-Host @"

------------------Core------------------

"@
Write-Host "Checking for Core Packages..."
& "$dirChoco\\core.ps1"

Write-Host @"

---------------Core Tools---------------

"@
$input = Read-Host "Install Core Tools? y/n"
If($input -eq "y"){
    choco install cmder neovim obsidian cmake fd make mingw python ripgrep -y
}
Else {
    Write-Host "Skipping..."
}

Write-Host @"

-------------Personal Core---------------

"@
$input = Read-Host "Install Personal Core? y/n"
If($input -eq "y"){
    choco install firefox spotify discord -y
}
Else {
    Write-Host "Skipping..."
}
