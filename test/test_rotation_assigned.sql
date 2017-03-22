--  testing with duplicate primary key in Rotation Assigned table
insert into rotation_assigned values('DISP17MD00000100', '2017-04-07', '00000000');
--  testing with first foreign key does not exist in Rotation Assigned table
insert into rotation_assigned values('AAAAAAAAAAAAAAAA', '2017-04-07', '00000000');
--  testing with second foreign key does not exist in Rotation Assigned table
insert into rotation_assigned values('DISP17TU00000100', '2017-04-07', '99999999');
-- testing the deleting cascade in Rotation Assigned table (sid)
select * from rotation_assigned;
delete * from shift where sid = 'AAAAAAAAAAAAAAAA';
select * from rotation_assigned;
-- testing the deleting cascade in Rotation Assigned table (gid)
select * from rotation_assigned;
delete * from worker where gid = '12345678';
select * from rotation_assigned;
