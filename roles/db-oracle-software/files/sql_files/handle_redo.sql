alter database force logging;

alter database add logfile thread 1 group 11 '+REDO' size 1000m;
alter database add logfile thread 1 group 12 '+REDO' size 1000m;
alter database add logfile thread 1 group 13 '+REDO' size 1000m;
alter database add logfile thread 1 group 14 '+REDO' size 1000m;
alter database add logfile thread 1 group 15 '+REDO' size 1000m;

alter database add logfile thread 2 group 21 '+REDO' size 1000m;
alter database add logfile thread 2 group 22 '+REDO' size 1000m;
alter database add logfile thread 2 group 23 '+REDO' size 1000m;
alter database add logfile thread 2 group 24 '+REDO' size 1000m;
alter database add logfile thread 2 group 25 '+REDO' size 1000m;

alter system archive log current;
alter system archive log current;
alter system archive log current;

alter system checkpoint;

alter database drop logfile group 1;
alter database drop logfile group 2;
alter database drop logfile group 3;
alter database drop logfile group 4;

alter database add supplemental log data;

exit;
