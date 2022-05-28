Param([String]$title = "VRChat")

# Configurations
$keysToRecord = "^+%p"
$intervalToLoadApp = 1000 # NOTE: This may depend your machine performance. Please adjust this.

Write-Output 'Start'

#
# Record replay
#
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName Microsoft.VisualBasic

$process = Get-Process -Name $title
[Microsoft.VisualBasic.Interaction]::AppActivate($process.ID)
# (New-Object -ComObject WScript.Shell).AppActivate($process.MainWindowTitle)
Start-Sleep -m $intervalToLoadApp
[System.Windows.Forms.SendKeys]::SendWait($keysToRecord)

Write-Output 'Done!'
