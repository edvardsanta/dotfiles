function Set-PSReadlineKeyMappings {
    # Check if the $PROFILE file exists
    $profilePath = $PROFILE
    if (-not (Test-Path -Path $profilePath)) {
        Write-Host "Creating profile..."
        New-Item -ItemType File -Path $profilePath -Force  
    }
    else {
        Write-Host "Profile already exists $profilePath"
        $choice = Read-Host "Do you want to append profile (Y/N)"
        if ($choice -eq "Y" -or $choice -eq "y") {
             Write-Warning "You choose to override your profile"
        $keyMappings = @"
# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
"@
    
        # Append the key mappings to the $PROFILE file
        Add-Content -Path $profilePath -Value $keyMappings
        Write-Host "Content Appended"
        }
        else {
            Write-Warning "Sorry, i cannot continue"
            Exit
        }
    }
  
}
