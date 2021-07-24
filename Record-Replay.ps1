Param([String]$title = "VRChat")

<# Description, Setup, and License {{{

# Record-Replay-VRChat
## What is this?

An easy way to record replay of games via 'Xbox Game Bar'.

## Setup

(ja)

1. **Put C:\Users\Desktop\bin\shot.wav you like**
2. Press Win+g (default) to open Xbox Game Bar
3. Click '設定' > 'ショートカット'
4. Set '直前の1分を録画する' to Ctrl+Shift+Alt+p (or choose keys your like, and edit "^+%p" of below code)

Now you can record replay by executing this script.

## Take it in OpenVR (SteamVR)

You can use this script without leaving VR.

1. Change $title to the process name of your target game
2. Install OpenVR-AdvanceSettings
3. Configure controller mapping of 'keyboardOne'
    - Please see [here](https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings/blob/master/docs/keyboard_input_guide.md)
4. Configure Ctrl+Shift+m to execute this script by some software
    - e.g. AutoHotKey can
      ```
      EnvGet, Home, HOME
      ^+m::Run powershell.exe %Home%\Desktop\bin\Record-Replay.ps1`
      ```

Now you can use this by putting controller mapping you choose.

## License

The MIT License (MIT) {{{

Copyright (c) 2021 aiya000

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

}}}

## Special Thanks

The original idea of this is here.

- [Record VRC With GeForce Experience - x.maho laboratory - BOOTH](https://booth.pm/ja/items/2026998)

Thanks フォルノ!

}}} #>

# Configurations
$keysToRecord = "^+%p"
$shotSound = $Home + '\Desktop\bin\shot.wav'

# Record replay
Add-Type -AssemblyName System.Windows.Forms
$process = Get-Process -Name $title
(New-Object -ComObject WScript.Shell).AppActivate($process.MainWindowTitle)
# NOTE: This may depend your machine performance. Please adjust this.
Start-Sleep -m 200
[System.Windows.Forms.SendKeys]::SendWait($keysToRecord)

# Notify success by the sound
$player = New-Object Media.SoundPlayer($shotSound)
$player.PlaySync()
