# Turn off AutoComplete
Set-PSReadlineOption -PredictionSource None

# Oh My Posh
oh-my-posh init pwsh --config "C:\_Configurations\afowler.omp.json" | Invoke-Expression
