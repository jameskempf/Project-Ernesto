--  testing with duplicate primary key in Works table
insert into works values('test', '00000000');
--  testing with first foreign key does not exist in Works table
insert into works values('test1', '00000000');
--  testing with second foreign key does not exist in Works table
insert into works values('test', '00000009');
-- testing the deleting cascade in Parker Assigned table (pos_name)
insert into worker values('00000001', 'test', 'person');
insert into position values('test_pos', '10.00');
insert into works values('test_pos', '00000001');
select * from works;
delete from position where pos_name = 'Parker';
select * from works;
-- testing the deleting cascade in Parker Assigned table (gid)
insert into position values('test_pos', '10.00');
insert into works values('test_pos', '00000001');
select * from works;
delete from worker where gid = '00000001';
select * from works;
