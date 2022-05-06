#Daniel Neff 6/7/21
#Script to unpin/pi items to quick access
Start-Transcript -Path C:\Temp\QuickAccessTransfer.log
Clear
$ErrorActionPreference= 'silentlycontinue'
$user = $env:UserName
$Unpin = New-Object -ComObject shell.application 
$Rmvls = "Desktop","Documents","Downloads","Music","Pictures","Videos"

Foreach ($i in $Rmvls)
{
($Unpin.Namespace("shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}").Items() | where {$_.Path -eq 'C:\Users\'+ $user +'\' + $i}).InvokeVerb("unpinfromhome")
}
#Pin to quick acces
$Pin = new-object -com shell.application
$Pin.Namespace('I:\').Self.InvokeVerb("pintohome")
Clear #END
Stop-Transcript