$packages = "obs-studio;audacity;gimp;libreoffice-fresh;sumatrapdf;sumatrapdf.commandline;vlc;"

& "$(Split-Path $MyInvocation.MyCommand.Path)\\installList.ps1" -packages $packages
