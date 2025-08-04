@echo off

:: Make sure cwd is the file's directory
for /f "tokens=*" %%a in ("%1") do (set dirpath=%%~dpa)

:: Create a new Alacritty window, run nvim on the current file
start "" alacritty --working-directory "%dirpath%\" -e nvim %1

