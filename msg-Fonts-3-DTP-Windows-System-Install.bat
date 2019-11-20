@echo off
rem ##
rem ##  msg-Fonts-3-DTP-Windows-System-Install.bat (shell wrapper)
rem ##

powershell -command "Set-ExecutionPolicy Unrestricted"
powershell .\msg-Fonts-3-DTP-Windows-Util.ps1 -forSystem -doInstall

