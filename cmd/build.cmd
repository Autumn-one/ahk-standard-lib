@echo off

ahk2exe /in ahklib.ahk /out ahklib.exe /compress 0

winrar a -sfx -zconfig.txt ahklib��װ����.exe 7z.dll 7z.exe ahklib.exe everything.exe Everything64.dll

del ahklib.exe /F /S /Q
