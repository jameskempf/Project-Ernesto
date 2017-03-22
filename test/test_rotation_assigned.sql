--  testing with duplicate primary key in Rotation Assigned table
insert into rotation_assigned values('DISP17MD00000100', '2017-04-07', '00000000');
--  testing with first foreign key does not exist in Rotation Assigned table
insert into rotation_assigned values('AAAAAAAAAAAAAAAA', '2017-04-07', '00000000');
--  testing with second foreign key does not exist in Rotation Assigned table
insert into rotation_assigned values('DISP17TU00000100', '2017-04-07', '99999999');
-- testing the deleting cascade in Rotation Assigned table (sid)
insert into worker values('00000001', 'test', 'person');
insert into shift values('DISP17FR00000100', 'Friday', '0000', '0100', 'Spring', 'T', null);
insert into rotation_assigned values('DISP17FR00000100', '2017-04-07', '00000001');
select * from rotation_assigned;
delete from shift where sid = 'DISP17FR00000100';
select * from rotation_assigned;
-- testing the deleting cascade in Rotation Assigned table (gid)
insert into shift values('DISP17FR00000100', 'Friday', '0000', '0100', 'Spring', 'T', null);
insert into rotation_assigned values('DISP17FR00000100', '2017-04-07', '00000001');
select * from rotation_assigned;
delete from worker where gid = '00000001';
select * from rotation_assigned;
