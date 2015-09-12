t2:
	cygstart --hide nxlog.bat
	sleep 2
	du -sh data/test.log
	tail -10 data/nxlog.log
