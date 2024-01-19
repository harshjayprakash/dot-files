# Turn off AutoComplete
Set-PSReadlineOption -PredictionSource None

# Oh My Posh
oh-my-posh init pwsh --config "C:\_Configurations\afowler.omp.json" | Invoke-Expression

# A List of Project Directories
$projectList = [ordered]@{
    "df" = "Personal/dot-files";
    "pm" = "Shared/project-manager";
    "ps" = "Personal/pwsh-scripts";
    "pw" = "Personal/personal-website";
    "xb" = "Personal/blok-experiment";
    "bpc-at" = "College/bpc-altrigonometry";
    "bpc-hw" = "College/bpc-weekly-homeworks";
    "bpc-hx" = "College/bpc-hexbaron";
    "bpc-vb" = "College/bpc-learning-visual-basic";
    "uow-cs" = "University/uow-container-stacking-problem";
    "uow-it" = "University/uow-interactive-table-prototype";
    "uow-ll" = "University/uow-library-loans";
    "uow-lp" = "University/uow-language-pwa";
    "uow-nt" = "University/uow-notes";
    "uow-pc" = "University/uow-program-catalogue-database";
    "uow-py" = "University/uow-python";
    "uow-tt" = "University/uow-automated-train-testing";
    "uow-wq" = "University/uow-wrapping-paper-quotes";
}

# Displays the list of projects with their aliases.
function Project-List {
    foreach ($project in $projectList.GetEnumerator()) {
        Write-Host $project.Name " -> " $project.Value
    }
}

# Navigates to the Workspace directory.
function Workspace-Dir {
    Set-Location "C:\Users\harsh\OneDrive\Harsh\Workspaces"
}

# Navigates to a project specific directory based on the given alias.
function Project-Dir {
    param (
        $projectInput
    )

    if ($projectInput -eq $null) {
        Write-Host "Error: Must Provide a Project Alias"
        Write-Host "       Type 'Project-List' for available options."
        return
    }

    foreach ($project in $projectList.GetEnumerator()) {
        if ($projectInput -eq $project.Name) {
            Workspace-Dir
            Set-Location $project.Value
        }
    }
}

