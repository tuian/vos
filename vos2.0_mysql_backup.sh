1.mysqldump vosdb > vosdb.sql
/etc/init.d/ivrd stop
/etc/init.d/mbx2009d stop
/etc/init.d/vos2009dall stop
2.mysql
3.drop database vosdb;
4.create database vosdb;
5.use vosdb;
6.source vosdb.sql;
/etc/init.d/vos2009dall restart
/etc/init.d/mbx2009d restart
/etc/init.d/ivrd restart