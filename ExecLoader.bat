:: 'Installs' console executables to the Binaries folder and compiles an Autorun file
:: Place this in a new folder inside Binaries
:: Run once, then put console exceutables into the Data folder and run again

@echo off

SET DAT=%~dp0%Data
SET BUF=%~dp0%Buffer
mkdir "%DAT%"
mkdir "%BUF%"
cd "%~dp0"
cd ..
SET INS=%cd%
xcopy "%DAT%" "%BUF%" /y
cd %BUF%
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "tokens=*" %%f in ('dir /b *.*') do (
  SET newname=%%~nf
  echo "exec !newname!" >>Autorun
  move "%%f" "!newname!"
)
xcopy "%BUF%" "%INS%" /y
cd %BUF%
del *.* /Q