$packages = "wireshark;agentransack;docker-desktop;wsl2;wiztree"

& "$(Split-Path $MyInvocation.MyCommand.Path)\\installList.ps1" -packages $packages
