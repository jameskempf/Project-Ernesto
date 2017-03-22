--  testing with duplicate primary key in Works table
insert into works values('test', '00000000');
--  testing with first foreign key does not exist in Works table
insert into works values('test1', '00000000');
--  testing with second foreign key does not exist in Works table
insert into works values('test', '00000009');
-- testing the deleting cascade in Parker Assigned table (pos_name)
select * from works;
delete * from position where pos_name = 'Parker';
select * from works;
-- testing the deleting cascade in Parker Assigned table (gid)
select * from works;
delete * from worker where gid = '44444444';
select * from works;
