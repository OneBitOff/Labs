#Daniel Neff 6/4/21
#One known elevation error, script still runs
$ErrorActionPreference= 'silentlycontinue'
Start-Transcript -Path C:\Temp\DefaultApps.log
Clear

function Set-DefaultApps {
    Add-Type -AssemblyName 'System.Windows.Forms'
    Start-Process $env:windir\system32\control.exe -ArgumentList '/name Microsoft.DefaultPrograms /page pageDefaultProgram\pageAdvancedSettings?pszAppName=google%20chrome'
    #Open the default app selector and set outlook to default email
	#The sleep times allow the processor to catch up other wise the script fails
    Sleep 8
	[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
	Sleep 4
	[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}")
    Sleep 3
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
	Sleep 4
	#set photos to default for photos
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}")
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Sleep 5
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Sleep 10
    #Set Chrome to default browser
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}")
    Sleep 3
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Sleep 3
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{ENTER}")

    #close default apps when finished
    Stop-Process -Name "SystemSettings" -Force  
}
Set-DefaultApps
Clear #END
Stop-Transcript