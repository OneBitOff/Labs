#Daniel Neff 6/2/21
#Script enables stereo mixer as a recording device
Start-Transcript -Path C:\Temp\EnableStereo.log
Clear
function Set-Mixer {
	Add-Type -AssemblyName 'System.Windows.Forms'
    Start-Process $env:windir\system32\control.exe -ArgumentList '/name Microsoft.Sound /page pageSound\pageRecording '
	Sleep 6
    [System.Windows.Forms.SendKeys]::SendWait("^{TAB}")
	Sleep 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}{DOWN}{DOWN}{DOWN}{TAB}")
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
	Sleep 2
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}{TAB}{UP}")
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
	Sleep 2
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{ENTER}")
	Sleep 1
}

Set-Mixer
Clear #END
Stop-Transcript
