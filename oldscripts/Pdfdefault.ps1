#Daniel Neff 6/3/2021 
#Sets users pdf default to adobe acrobat
Start-Transcript -Path C:\Temp\Pdfdefault.log
Clear
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

$user = $env:UserName
$folder = "C:\users\" + $user +"\Desktop" 
$pdfile = New-Item -Path $folder -Name "testfilezr1000.pdf" -ItemType "file"
$pdfpath = $folder + "\testfilezr1000.pdf"

$o = new-object -com Shell.Application
$folder2 = $o.NameSpace("$folder")
$file = $folder2.ParseName("testfilezr1000.pdf")
$file.Verbs() | %{ if($_.Name -eq 'P&roperties') { $_.DoIt() } }

Sleep 5
[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}")
Sleep 2
[System.Windows.Forms.SendKeys]::SendWait("{TAB}{DOWN}{ENTER}")
Sleep 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}{TAB}{ENTER}")
Sleep 1
Remove-Item $pdfile
Clear #END
Stop-Transcript