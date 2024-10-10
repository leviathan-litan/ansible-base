alter profile default limit password_life_time unlimited;
alter profile default limit failed_login_attempts unlimited;

alter system set audit_trail=none scope=spfile;
alter system set audit_sys_operations=false scope=spfile;
alter system set recyclebin=off scope=spfile;
alter system set processes=2000 scope=spfile;
alter system set db_files=2000 scope=spfile;
alter system set deferred_segment_creation=false scope=spfile;
alter system set parallel_force_local=true scope=spfile;
alter system set max_dump_file_size='100M' scope=spfile;
alter system set enable_ddl_logging=true scope=spfile;
alter system set optimizer_adaptive_plans=false scope=spfile;
alter system set heat_map=off scope=spfile;

alter system set "_serial_direct_read"=false scope=spfile;
alter system set "_use_adaptive_log_file_sync"=false scope=spfile;
alter system set "_undo_autotune"=false scope=spfile;
alter system set "_rollback_segment_count"=2000 scope=spfile; 
alter system set "_partition_large_extents"=false scope=spfile;
alter system set "_index_partition_large_extents"=false scope=spfile;
alter system set "_cursor_obsolete_threshold"=100 scope=spfile;
alter system set "_ash_size"=100M scope=spfile;
alter system set "_optim_peek_user_binds"=false scope=spfile;
alter system set "_optimizer_adaptive_cursor_sharing"=false scope=spfile;
alter system set "_optimizer_extended_cursor_sharing"=none scope=spfile;
alter system set "_optimizer_extended_cursor_sharing_rel"=none scope=spfile;
alter system set "_optimizer_use_feedback"=false scope=spfile;
alter system set "_gc_policy_time"=0 scope=spfile;
alter system set "_gc_undo_affinity"=false scope=spfile;
alter system set "_lm_drm_disable"=7 scope=spfile;
alter system set "_use_single_log_writer"=true scope=spfile;
alter system set "_sys_logon_delay"=0 scope=spfile;
alter system set "_drop_stat_segment"=1 scope=spfile;
alter system set "_max_spacebg_slaves"=10;

exec dbms_space_admin.heat_map_segment_drop;

exec dbms_scheduler.disable('oracle_ocm.mgmt_config_job');
exec dbms_scheduler.disable('oracle_ocm.mgmt_stats_config_job');
exec dbms_auto_task_admin.disable(client_name => 'sql tuning advisor',operation => null,window_name => null);
exec dbms_auto_task_admin.disable(client_name => 'auto space advisor',operation => null,window_name => null);
--exec dbms_auto_task_admin.disable(client_name => 'auto optimizer stats collection',operation => null,window_name => null);
--exec dbms_auto_task_admin.enable(client_name => 'auto optimizer stats collection',operation => null,window_name => null);

begin
dbms_scheduler.set_attribute(name => 'SATURDAY_WINDOW', attribute => 'repeat_interval', value => 'freq=daily;byday=SAT;byhour=22;byminute=0;bysecond=0');
dbms_scheduler.set_attribute(name => 'SATURDAY_WINDOW', attribute => 'duration',value => numtodsinterval(240,'minute'));
end;
/

begin
dbms_scheduler.set_attribute(name => 'SUNDAY_WINDOW', attribute => 'repeat_interval', value => 'freq=daily;byday=SUN;byhour=22;byminute=0;bysecond=0');
dbms_scheduler.set_attribute(name => 'SUNDAY_WINDOW', attribute => 'duration',value => numtodsinterval(240,'minute'));
end; 
/

exec dbms_advisor.set_task_parameter(task_name=> 'AUTO_STATS_ADVISOR_TASK', parameter=> 'EXECUTION_DAYS_TO_EXPIRE', value => 3);
exec dbms_sqltune.set_tuning_task_parameter(task_name => 'AUTO_STATS_ADVISOR_TASK', parameter => 'EXECUTION_DAYS_TO_EXPIRE', value => 3);

exec prvt_advisor.delete_expired_tasks;

exit;
