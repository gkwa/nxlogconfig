cd "C:\Program Files (x86)\nxlog"

taskkill /F /IM nxlog.exe 2>NUL
del data\configcache.dat
del data\test.log
nxlog.exe -f nxlog.conf