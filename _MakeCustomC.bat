@echo off
cd %~dp0/Custom
dir *.c /b > c.txt
for /f "tokens=*" %%m in (c.txt) do (
	cd %~dp0
	make Custom/%%~nm.lyn.event
	@rem make the .s file for debugging if needed
	@rem make Custom/%%~nm.s
	cd %~dp0/Custom
)
del c.txt
pause
