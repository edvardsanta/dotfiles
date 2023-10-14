function Get-WSL {   	
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
            
    wsl --set-default-version 2
}


function Get-ArchWSL {
    $archWslUrl = "https://github.com/yuk7/ArchWSL/releases"
    $request = Invoke-WebRequest -Uri $archWslUrl -UseBasicParsing
    $myArray = New-Object string[] $request.Links.Count
    $iterator = 1
    Write-Host "Listings releases..."
    foreach ($letter in $request.Links)
    {
        $link = $letter.href
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
    $pathName = "$currentDir\ArchWsl"
    $fileNamePath = "$pathName\$fileNameWithExtension"
    New-Item -Path $currentDir -Name "ArchWsl" -ItemType Directory
    New-Item -Path $pathName -Name "$fileName" -ItemType Directory
    Invoke-WebRequest -Uri $urlChoosed -OutFile $fileNamePath

    Expand-Archive -LiteralPath $fileNamePath -DestinationPath "$pathName\$fileName\"
}