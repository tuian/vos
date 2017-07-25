
备份vos2009的数据
中断当前通话
登录SSH，终止vos服务
etcinit.dmbx2009d stop
etcinit.dvos2009dall stop
etcinit.dmysql stop
cd varlibmysql
cp -dprf vosdb rootvosdbdate（数据备份到了root目录下，在vosdb里面） 
etcinit.dmysql start
etcinit.dvos2009dall start
etcinit.dmbx2009d start
etcinit.dmysql start
cd root
tar -jcvf vosdb.bz2 vosdbdate 压缩vosdbdate文件 压缩后移动到自己的机器上。 

备份vos3000的数据
etcinit.dmbx3000d stop
etcinit.dvos3000dall stop
etcinit.dmysql stop
cd varlibmysql
du -h vosdb
cp -dprf vos3000db rootvos3000dbdate（数据备份到了root目录下，在vos3000dbdate里面） 
etcinit.dmysql start
etcinit.dvos3000dall start
etcinit.dmbx3000d start
etcinit.dmysql start
cd root
tar -jcvf vosdb.bz2 vos3000dbdate 压缩vosdbdate文件 压缩后移动到自己的机器上。

恢复vos2009数据
进入放有备份数据的目录(举例为root目录下)
tar -jxvf vosdb.bz2
cd rootvosdb
etcinit.dvos2009dall stop
etcinit.dmysql stop
cd varlibmysqlvosdb
mv e_phonecard rootvosdb
rm -rf 
cd rootvosdb
mv  varlibmysqlvosdb
etcinit.dmysql start
etcinit.dvos2009dall start

恢复vos3000数据（可以根据vos2009数据恢复操作）