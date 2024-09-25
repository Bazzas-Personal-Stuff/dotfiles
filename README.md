## Environment setup: Windows


### Remove all symlinks or existing files

```bash
cmd /c rmdir /S /Q %APPDATA%\alacritty
cmd /c rmdir /S /Q %APPDATA%\helix

cmd /c rmdir /S /Q %LOCALAPPDATA%\nvim

cmd /c del %USERPROFILE%\.ideavim
cmd /c del %USERPROFILE%\.ideavimrc
```

### Create symlinks

```bash
# AppData/Roaming // Nushell must be done in one command because the directory is auto created upon cmd exit
cmd /c rmdir /S /Q %APPDATA%\nushell & mklink /J %APPDATA%\nushell nushell
cmd /c mklink /J %APPDATA%\alacritty alacritty
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

