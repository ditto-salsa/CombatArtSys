@echo off
cd %~dp0/source
dir *.c /b > c.txt
for /f "tokens=*" %%m in (c.txt) do (
	cd %~dp0
	make source/%%~nm.lyn.event
	make source/%%~nm.s
	cd %~dp0/source
)
del c.txt
pause
