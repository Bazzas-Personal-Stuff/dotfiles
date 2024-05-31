## Environment setup: Windows


### Remove all symlinks or existing files

```bash
cmd /c rmdir %APPDATA%\alacritty
cmd /c rmdir %APPDATA%\nushell
cmd /c rmdir %APPDATA%\helix

cmd /c rmdir %LOCALAPPDATA%\nvim

cmd /c del %USERPROFILE%\.ideavim
cmd /c del %USERPROFILE%\.ideavimrc
```

### Create symlinks

```bash
# AppData/Roaming
cmd /c mklink /J %APPDATA%\alacritty alacritty
cmd /c mklink /J %APPDATA%\nushell nushell
cmd /c mklink /J %APPDATA%\helix helix

# AppData/Local
cmd /c mklink /J %LOCALAPPDATA%\nvim nvim

# ~
cmd /c mklink /H %USERPROFILE%\.ideavim idea\.ideavim
cmd /c mklink /H %USERPROFILE%\.ideavimrc idea\.ideavimrc

# configured via commands
oh-my-posh init nu --config posh/bazzagibbs.omp.json
```

### Hotkeys

In PowerToys > Keyboard Manager > Remap a shortcut

* `Ctrl + Alt + T`
    * terminal emulator
    * start in `%USERPROFILE%`
    * elevation: normal
    * if running: start another
* `Ctrl + Alt + Shift + T`
    * terminal emulator
    * start in `%USERPROFILE%`
    * elevation: elevated
    * if running: start another

