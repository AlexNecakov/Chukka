$packages = "cmder;neovim;obsidian;cmake;fd;make;mingw;python;ripgrep"

& "$(Split-Path $MyInvocation.MyCommand.Path)\\installList.ps1" -packages $packages
