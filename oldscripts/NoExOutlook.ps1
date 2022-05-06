#Daniel Neff 6/10/21
#Turns off cache exchange mode and deletes any ost file from outlook
function NoCache{    
    Add-Type -AssemblyName 'System.Windows.Forms'
    Start-Process $env:windir\system32\control.exe -ArgumentList '/name Microsoft.UserAccounts'
    Sleep 6
    [System.Windows.Forms.SendKeys]::SendWait("{Backspace}")
    Sleep 2
    [System.Windows.Forms.SendKeys]::SendWait("^{f}")
    Sleep 1
    [System.Windows.Forms.SendKeys]::SendWait("{m}{a}{i}{l}")
    Sleep 3
    [System.Windows.Forms.SendKeys]::SendWait("{down}{enter}")
    Sleep 4
    [System.Windows.Forms.SendKeys]::SendWait("{Enter}")
    Sleep 4
    [System.Windows.Forms.SendKeys]::SendWait("%{A}")
    Sleep 4
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{-}")
    Sleep 4
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{Enter}{Enter}")
    Sleep 4
	[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{Enter}")
	Sleep 4
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}{Enter}")
    Sleep 2
    [System.Windows.Forms.SendKeys]::SendWait("{Backspace}")
    Sleep 2
    $TitleToKill = "User Accounts"
    get-process | where-object {$_.MainWindowTitle -eq $TitleToKill} | stop-process	-Force  					
}

function NoOstfile {
	$user = $env:UserName
	$folder = "C:\users\" + $user +"\AppData\Local\Microsoft\Outlook" 
	$folderpath = test-path -Path $folder
	$ostname = Split-Path $folder -leaf

	if($folderpath)
	{

	Get-ChildItem $folder -filter *.ost | remove-item
	Write-Output "Deleted OST $ostname for $user"
	}

	else{

	Write-Output "OST file doesn't exist or meet criteria for $user"

	}

}
Start-Transcript -Path C:\Temp\NoOutlookcache.log
sleep 1
start outlook.exe

DO
{
if((get-process "outlook" -ea SilentlyContinue) -eq $Null){ 
        "Not Running" 
        start outlook.exe
        Start-Sleep -s 5
        #Start-Process C:\"Program Files"\Microsoft Office\Office16\OUTLOOK.EXE -NoNewWindow -Wait
}

else{ 
    "Outlook is Running"
    Start-Sleep -s 5
 }
 }
 While ((get-process "outlook" -ea SilentlyContinue) -eq $Null)

 Start-Sleep -s 30
 Stop-Process -Name outlook -Force  
 Wait-Process -Name outlook -Timeout 5
 
Sleep 3
NoCache
Sleep 3
NoOstfile
sleep 1
Stop-transcript