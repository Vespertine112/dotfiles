# I still need to build this script, just putting winget packages for now

winget install -e --id Microsoft.PowerShell.Preview
winget install -e --id Microsoft.WindowsTerminal.Preview
winget install -e --id Discord.Discord
winget install -e --id JesseDuffield.lazygit
winget install -e --id Brave.Brave
winget install -e --id Neovim.Neovim
winget install -e --id Starship.Starship
winget install -e --id Obsidian.Obsidian

# Symlink dotfile configuration 
New-Item -ItemType SymbolicLink -Path (Join-Path $env:USERPROFILE ".config\yasb") -Target (Join-Path $PWD "yasb")
New-Item -ItemType SymbolicLink -Path (Join-Path $env:USERPROFILE ".config\nvim") -Target (Join-Path $PWD "nvim")
New-Item -ItemType SymbolicLink -Path (Join-Path $env:USERPROFILE ".config\whkdrc") -Target (Join-Path $PWD "whkdrc")
New-Item -ItemType SymbolicLink -Path ($env:USERPROFILE) -Target (Join-Path $PWD ".\komorebi.json")
New-Item -ItemType SymbolicLink -Path (Join-Path $env:USERPROFILE ".config\starship.toml") -Target (Join-Path $PWD "starship\starship.toml")


