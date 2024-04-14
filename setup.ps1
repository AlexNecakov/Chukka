# Chukka Environment Setup Bootstrapper

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

    & ".\chocolatey-install.ps1"

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
choco install git
choco install 7zip


Write-Host @"

---------------Core Tools---------------

"@
$input = Read-Host "Install Core Tools? y/n"
If($input -eq "y"){
    choco install cmder
    choco install neovim
    choco install obsidian

    choco install cmake
    choco install fd
    choco install make
    choco install mingw
    choco install python
    choco install ripgrep
}
Else {
    Write-Host "Skipping..."
}
