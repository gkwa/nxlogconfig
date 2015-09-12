data/test.log: data/error.2015.09.08.log
data/test.log: data/access.2015.09.07.log
	cygstart --minimize nxlog.bat
	sleep 2
	du -sh data/test.log
	tail -10 data/nxlog.log
	-find . -iname configcache.dat
	-find . -iname '*.dat'

show: data/test.log
	jq -M . <<< $$(grep apache_error data/test.log | head)

data/error.2015.09.08.log:
	7z x -odata error.2015.09.08.log.7z

data/access.2015.09.07.log:
	7z x -odata access.2015.09.07.log.7z

size:
	du -sh data/test.log
