function gitStatus {
    git status    
}

function Invoke-Starship-TransientFunction {
    return "$([char]0x2550)$([char]0xf197)  $([char]0xe370) "
}

$ENV:STARSHIP_CONFIG = "PATH TO TOML"

Invoke-Expression (&starship init powershell)

Enable-TransientPrompt

New-Alias "gs" gitStatus
