drop TRIGGER if exists trigger_query_privileges_apply;
CREATE TRIGGER trigger_query_privileges_apply AFTER update ON query_privileges_apply FOR EACH ROW BEGIN
			declare uid int;
			declare gid int;
			declare hv int;
   if new.status=1 then
			set uid = (SELECT id FROM sql_users where username=old.user_name);
			set hv =(select count(0) from resource_group_user where resource_group_id=old.group_id  and  user_id=uid);
			if hv<1 then
				INSERT INTO resource_group_user (create_time,resource_group_id,user_id) VALUES(now(),old.group_id,uid);
			end if;
	end if;
end;

