function SetExecutionPolicy {
    if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Host "Please run this script as an administrator."
        return
    }
    $choice = Read-Host "Do you want to set the default execution policy to RemoteSigned? (Y/N)"

    if ($choice -eq "Y" -or $choice -eq "y") {
        Set-ExecutionPolicy RemoteSigned
        $CurrentExecutionPolicy = Get-ExecutionPolicy
        Write-Host "Execution Policy is now set to: $CurrentExecutionPolicy"
    }
    else {
        # If cannot or dont want RemoteSigned, let them specify an execution policy
        $newExecutionPolicy = Read-Host "Enter the desired execution policy (e.g., Restricted, AllSigned, etc.):"
        Set-ExecutionPolicy $newExecutionPolicy
        $CurrentExecutionPolicy = Get-ExecutionPolicy
        Write-Host "Execution Policy is now set to: $CurrentExecutionPolicy"
    }
}