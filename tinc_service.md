## Tinc systemd service onboot workaround

Due to the tinc original systemd service can't execute onboot as expected,
please use the following systemd service config instead.

```shell
$ cat /lib/systemd/system/tinc@.service
[Unit]
Description=Tinc net %i
After=network.target

[Service]
Type=simple
WorkingDirectory=/etc/tinc/%i
ExecStart=/usr/sbin/tincd -n %i -D -d 2
ExecReload=/usr/sbin/tincd -n %i -kHUP
TimeoutStopSec=5
Restart=always
RestartSec=60

[Install]
WantedBy=multi-user.target
```

You may need to use `find / | grep tinc@.service` to find where it is.
And also remove `tinc.service`.
