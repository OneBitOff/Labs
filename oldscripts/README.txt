#Daniel Neff 6/17/21
The following commands must be ran as the USER phsyiscally. Not the machine, not admin, not current user.
Open a powershell session through command prompt and run the below commands. 
(NOTE: Files must be copied to cd C:\SetupScripts first)

cd C:\SetupScripts
$script = Get-Content .\EnableStereo.ps1 -raw
Invoke-Expression $script
Sleep 3
$script = Get-Content .\ChangeDefaultApps.ps1 -raw
Invoke-Expression $script
Sleep 3
$script = Get-Content .\Pdfdefault.ps1 -raw
Invoke-Expression $script
Sleep 3
$script = Get-Content .\QuickAccess.ps1 -raw
Invoke-Expression $script
Sleep 3
$script = Get-Content .\NoExOutlook.ps1 -raw
Invoke-Expression $script
Sleep 3
$script = Get-Content .\ISaveWork.ps1 -raw
Invoke-Expression $script
Sleep 3
$script = Get-Content .\NoTrace.ps1 -raw
Invoke-Expression $script
Sleep 3
Remove-Item 'C:\SetupScripts' -Force  -Recurse -ErrorAction SilentlyContinue