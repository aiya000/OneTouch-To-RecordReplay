Param([String]$title = "VRChat")

# Configurations
$keysToRecord = "^+%p"
$shotSound = $Home + '\Desktop\bin\shot.wav'
$intervalToLoadApp = 400  # NOTE: This may depend your machine performance. Please adjust this.

# Record replay
Add-Type -AssemblyName System.Windows.Forms
$process = Get-Process -Name $title
(New-Object -ComObject WScript.Shell).AppActivate($process.MainWindowTitle)
Start-Sleep -m $intervalToLoadApp
[System.Windows.Forms.SendKeys]::SendWait($keysToRecord)

# Notify success by the sound
$player = New-Object Media.SoundPlayer($shotSound)
$player.PlaySync()
