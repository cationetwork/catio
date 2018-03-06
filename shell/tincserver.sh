# NMNET project tinc init version 1
# New CatIO network shell version1

# thx http://zfox49.farbox.com/post/2017-01-13-2
# create
tinc -n catio init node1
tinc -n catio add Mode Switch
tinc -n catio add Interface catio
tinc -n catio add Cipher aes-256-cbc
nano /etc/tinc/catio/tinc-up
# server start 
tinc -n catio start
# add node
tinc -n catio invite newnodename
# Client join
tinc join xxxxxxxxxxxxxxxxxxx
nano /etc/tinc/catio/tinc-up
tinc -n catio start
