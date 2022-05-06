#Daniel Neff 6/7/21
#Script enables stereo mixer as a recording device
Start-Transcript -Path C:\Temp\NoTrace.log
Clear
function Set-EraseF {
	Add-Type -AssemblyName 'System.Windows.Forms'
    Start-Process $env:windir\system32\control.exe -ArgumentList '/name Microsoft.FolderOptions '
	[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}")
	Sleep 1
	[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}")
    Sleep 1
	[System.Windows.Forms.SendKeys]::SendWait("{-}")
    Sleep 1
	[System.Windows.Forms.SendKeys]::SendWait("{TAB}{-}")
    Sleep 1
	[System.Windows.Forms.SendKeys]::SendWait("{TAB}{Enter}")
    Sleep 3
	[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}{TAB}")
    Sleep 1
    [System.Windows.Forms.SendKeys]::SendWait("{Enter}")
    Sleep 4
    [System.Windows.Forms.SendKeys]::SendWait("{Enter}")
}

Set-EraseF 
Clear #END
Stop-Transcript
