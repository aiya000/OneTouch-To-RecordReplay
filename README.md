# :diamond_shape_with_a_dot_inside: Record-Replay :diamond_shape_with_a_dot_inside:
## What is this?

An easy way to record replay of games via 'Xbox Game Bar'.

## Setup

(ja)

1. Press `Win+g` (default) to open Xbox Game Bar
2. Click '設定' > 'ショートカット'
3. Set '直前の1分を録画する' to `Ctrl+Shift+Alt+p` (or choose keys your like, and edit "^+%p" of below code)
    - This saves the record to `%HOME%\Videos\Captures`

Now you can record replay by executing this script.

## Take it in OpenVR (SteamVR)

You can use this script without leaving VR.

1. Change `$title` to the process name of your target game
2. Install OpenVR-AdvanceSettings
3. Configure controller mapping of 'keyboardOne'
    - Please see [OpenVR-AdvancedSettings/keyboard_input_guide.md](https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings/blob/master/docs/keyboard_input_guide.md)
4. Configure `Ctrl+Shift+m` to execute this script by some software
    - e.g. AutoHotKey can
      ```
      EnvGet, Home, HOME
      ^+m::Run powershell.exe %Home%\Desktop\bin\Record-Replay.ps1`
      ```

Now you can use this by putting controller mapping you choose.

## Special Thanks

The original idea of this is here.

- [Record VRC With GeForce Experience - x.maho laboratory - BOOTH](https://booth.pm/ja/items/2026998)

Thanks フォルノ!
