$packages = "firefox;spotify;obsidian"

& "$(Split-Path $MyInvocation.MyCommand.Path)\\installList.ps1" -packages $packages
