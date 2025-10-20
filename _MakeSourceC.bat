@echo off
cd %~dp0/source
dir *.c /b > c.txt
for /f "tokens=*" %%m in (c.txt) do (
	cd %~dp0
	make source/%%~nm.lyn.event
	@rem make the .s file for debugging if needed
	@rem make source/%%~nm.s
	cd %~dp0/source
)
del c.txt
pause
