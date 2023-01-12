@echo off

whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
    @powershell start-process "%~0" -verb runas
    exit

)

rem IP_Reset
netsh int ip reset

rem WinSock_Reset
netsh winsock reset

rem Flush_DNS
ipconfig /flushdns

rem RSS_Disabled
netsh int tcp set global rss=disabled

rem Netdma=Disabled
netsh int tcp set global netdma=disabled

rem AutoTuningLevel=Highlyrestricted
netsh interface tcp set global autotuninglevel=highlyrestricted