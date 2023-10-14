
$profilePath = $PROFILE
function Set-PSReadlineKeyMappings {
    # Check if the $PROFILE file exists
    if (-not (Test-Path -Path $profilePath)) {
        Write-Host "Creating profile..."
        New-Item -ItemType File -Path $profilePath -Force  
    }
    else {
        Write-Host "Profile already exists $profilePath"
        $choice = Read-Host "Do you want to append profile (Y/N)"
        if ($choice -eq "Y" -or $choice -eq "y") {
             Write-Warning "You choose to append your profile"
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
            Write-Warning "Ok, key mappings not configured"
        }
    }
  
}

function Get-OhMyPOSH {
 
    $ohMyPOSHFolder = "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\bin\oh-my-posh.exe"  
    if (Test-Path -Path $ohMyPOSHFolder -PathType Leaf) {
        "Oh my posh is already installed !"
        return
    } 

    $choice = Read-Host "Do you want to install OhMyPOSH (Y/N)"
    if ($choice -eq "Y" -or $choice -eq "y") {
        Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))

        $poshInit = @"
oh-my-posh init pwsh | Invoke-Expression
"@
    
        Add-Content -Path $profilePath -Value $poshInit
        Write-Host "Oh my posh installed"
    }
    else {
        Write-Host "ohMyPOSH won´t be installed"
        return
    }
   
}
function  Get-NerdFonts {
    $request = Invoke-WebRequest -Uri "https://www.nerdfonts.com/font-downloads" -UseBasicParsing
    $myArray = New-Object string[] $request.Links.Count
    $iterator = 1
    Write-Host "Listings Nerd Fonts..."
    foreach ($letter in $request.Links)
    {
        $link = $letter.href
        # $choice = Read-Host "What do you want to install?"
        if ($link -like  "*.zip") { 
            Write-Host "$iterator : $link"
            $myArray[$iterator - 1] = $link
            $iterator++
        }
    }
    [int]$choice = Read-Host "What do you want to install? Write the number"
    if ($choice -gt $myArray.Count -OR $choice -lt 1){
        Write-Host "Wrong choice. Cannot install nerd fonts"
        return
    }
    $currentDir = Get-Location
    $urlChoosed = $myArray[$choice - 1]
    $fileNameWithExtension = $urlChoosed.Split("/")[-1]
    $fileName = $fileNameWithExtension -replace "[.zip]", ""
    $pathName = "$currentDir\NerdFonts"
    $fileNamePath = "$pathName\$fileNameWithExtension"
    New-Item -Path $currentDir -Name "NerdFonts" -ItemType Directory
    New-Item -Path $pathName -Name "$fileName" -ItemType Directory
    Invoke-WebRequest -Uri $urlChoosed -OutFile $fileNamePath

    Expand-Archive -LiteralPath $fileNamePath -DestinationPath "$pathName\$fileName\"
}

