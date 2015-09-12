cd "C:\Program Files (x86)\nxlog"

rem create timestamp to rename old nxlog.log
for /F "Tokens=1-7 Delims=/:. " %%d In ("%Date%%Time%") Do Set Now=%%e%%f%%g%%h%%i%%j

taskkill /F /IM nxlog.exe 2>NUL
move data\nxlog.log data\nxlog-%now%.log
rem del data\configcache.dat
del data\test.log
nxlog.exe -f nxlog.conf