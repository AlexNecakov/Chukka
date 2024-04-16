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
& "$dirChoco\\coreTools.ps1"
}
Else {
    Write-Host "Skipping..."
}

Write-Host @"

-------------Personal Core---------------

"@
$input = Read-Host "Install Personal Core? y/n"
If($input -eq "y"){
& "$dirChoco\\corePersonal.ps1"
}
Else {
    Write-Host "Skipping..."
}

Write-Host @"

-------------Heavy Tools-----------------

"@
$input = Read-Host "Install Heavy Tools? y/n?"
If($input -eq "y"){
& "$dirChoco\\heavyTools.ps1"
}
Else {
    Write-Host "Skipping..."
}

Write-Host @"

---------------Media Tools---------------

"@
$input = Read-Host "Install Media Tools? y/n?"
If($input -eq "y"){
& "$dirChoco\\mediaTools.ps1"
}
Else {
    Write-Host "Skipping..."
}
Write-Host @"

---------------Gaming----=---------------

"@
$input = Read-Host "Install Gaming Suite? y/n?"
If($input -eq "y"){
& "$dirChoco\\games.ps1"
}
Else {
    Write-Host "Skipping..."
}

Write-Host @"

-------------NeoVim Configure------------

"@
$input = Read-Host "Configure NeoVim? y/n?"
If($input -eq "y"){
git clone https:\\github.com\AlexNecakov\VimConfig $env:userprofile\\AppData\\Local\\nvim
}
Else {
    Write-Host "Skipping..."
}

