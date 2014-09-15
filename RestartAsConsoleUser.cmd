@ECHO off 
FOR /F "tokens=2" %%G IN ('qwinsta ^| find "console"') DO SET _consoleUser=%%G 
ECHO ConsoleUser: %_consoleUser%
   
FOR /F "delims='\' tokens=2" %%G IN ('whoami') DO SET _currentUser=%%G
ECHO CurrentUser: %_currentUser%

:: If NOT running as current console session user, restart self and exit, 
IF /I NOT %_currentUser%==%_consoleUser% (GOTO Restart_as_console)

:: Code to execute
ECHO Already running as console user, executing code
WHOAMI
PAUSE

GOTO :EOF

:: Restart as current console session user
:Restart_as_console
ECHO Restarting as console user
SCHTASKS /Create /RU %_consoleUser% /TR "%~dpnx0" /IT /F /ST 00:00 /SC ONCE /TN RunBatchSelf 
SCHTASKS /Run /TN RunBatchSelf
SCHTASKS /Delete /TN RunBatchSelf /F
