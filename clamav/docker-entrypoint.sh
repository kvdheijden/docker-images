#!/bin/sh
set -e

if [[ ! -d /var/log/supervisor ]]
then
	mkdir -p /var/log/supervisor/
	touch /var/log/supervisor/clamd.log
	touch /var/log/supervisor/freshclam.log
	touch /var/log/supervisor/clamav_milter.log
	chmod -R 0777 /var/log/supervisor/
fi

if [[ ! -f /var/lib/clamav/daily.cvd ]] || [[ ! -f /var/lib/clamav/main.cvd ]] || [[ ! -f /var/lib/clamav/bytecode.cvd ]]
then
	/usr/bin/freshclam --config-file=/etc/clamav/freshclam.conf
fi

exec "$@"
