#!/bin/bash
#vos 2009_2.0
mysqldump vosdb > vosdb.sql
/etc/init.d/ivrd stop
/etc/init.d/mbx2009d stop
/etc/init.d/vos2009dall stop
mysql
drop database vosdb;
create database vosdb;
use vosdb;
source vosdb.sql;
/etc/init.d/vos2009dall restart
/etc/init.d/mbx2009d restart
/etc/init.d/ivrd restart
