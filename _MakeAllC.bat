@echo off
cd %~dp0/source
dir *.c /b > c.txt
for /f "tokens=*" %%m in (c.txt) do (
	make %%~nm.lyn.event
	make %%~nm.s
)
del c.txt
pause
