Its this line:
	Exec $filetype = 'apache_error';
that adds the metadata 

```
# nxlog.conf

<Input apache_error>
	Module im_file
	File '%ROOT%\\data\\error.2015.09.08.log'
	SavePos false
	ReadFromLast false
	PollInterval 1
	Exec $Message = $raw_event; $SyslogFacilityValue = 22;
	Exec $filetype = 'apache_error';
</Input>
```

```
make -C '/c/Program Files (x86)/nxlog' show
make: Entering directory '/c/Program Files (x86)/nxlog'
jq -M . <<< $(grep apache_error data/test.log | head)
{
  "EventReceivedTime": "2015-09-12 02:46:06",
  "SourceModuleName": "apache_error",
  "SourceModuleType": "im_file",
  "Message": "[Tue Sep 08 00:00:00.789281 2015] [authz_core:debug] [pid 1596:tid 1084] mod_authz_core.c(799): [client ::1:63634] AH01626: authorization result of Require all granted: granted, referer: http://localhost/ls/slsmap.php",
  "SyslogFacilityValue": 22,
  "filetype": "apache_error",
  "Hostgroup": "DVS"
}
{
  "EventReceivedTime": "2015-09-12 02:46:06",
  "SourceModuleName": "apache_error",
  "SourceModuleType": "im_file",
  "Message": "[Tue Sep 08 00:00:00.789281 2015] [authz_core:debug] [pid 1596:tid 1084] mod_authz_core.c(799): [client ::1:63634] AH01626: authorization result of <RequireAny>: granted, referer: http://localhost/ls/slsmap.php",
  "SyslogFacilityValue": 22,
  "filetype": "apache_error",
  "Hostgroup": "DVS"
}
```
