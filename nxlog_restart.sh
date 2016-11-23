nxlog_conf="$1"

rsync --no-g --no-o --no-p \
	  $nxlog_conf \
	  tl1':''"/c/Program Files (x86)/nxlog/conf/nxlog.conf"'

ssh -T tl1<<EOF
	taskkill /F /IM nxlog.exe 2>/dev/null
	taskkill /F /IM nxlog.exe 2>/dev/null
	taskkill /F /IM nxlog.exe 2>/dev/null
	taskkill /F /IM nxlog.exe 2>/dev/null
	nxlog/nxlog -v
	nxlog/nxlog -f
EOF