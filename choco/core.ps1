$packages = "git;7zip"

& "$(Split-Path $MyInvocation.MyCommand.Path)\\installList.ps1" -packages $packages
