# CatIO Network tinc manual

Thanks to http://zfox49.farbox.com/post/2017-01-13-2

### Create

```shell
tinc -n catio init <name>
tinc -n catio add Mode Switch
tinc -n catio add Interface catio
tinc -n catio add Cipher aes-256-cbc
nano /etc/tinc/catio/tinc-up
```

### Start tinc

```shell
systemctl start tinc@catio
# or
tinc -n catio start
```

### Set on-boot

```shell
systemctl enable tinc@catio
```

### Add node

#### At central node

```shell
tinc -n catio invite <node_name>
```

#### At client

```shell
tinc join <string>
nano /etc/tinc/catio/tinc-up
```
