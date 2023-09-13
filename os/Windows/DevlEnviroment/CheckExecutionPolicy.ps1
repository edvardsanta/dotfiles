. .\RunScriptsPolicy.ps1

function Get-ExecutionPolicyLocalMachine {
    $CurrentExecutionPolicy = Get-ExecutionPolicy

    # Check if the Execution Policy is set to RemoteSigned
    if ($CurrentExecutionPolicy -eq "RemoteSigned") {
        Write-Host "Execution Policy is already set to RemoteSigned."
    } else {
        SetExecutionPolicy
    }
}
