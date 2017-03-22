--  testing with duplicate primary key in Shift Type table
insert into shift_type values('DISP17MD00000100', 'Dispatcher');
--  testing with first foreign key does not exist in Shift Type table
insert into shift_type values('AAAAAAAAAAAAAAAA', 'Dispatcher');
--  testing with second foreign key does not exist in Shift Type table
insert into shift_type values('DISP17MD00000100', 'not a pos_name');
-- testing the deleting cascade in Shift Type table (sid)
select * from shift_type;
delete * from shift where sid = 'AAAAAAAAAAAAAAAA';
select * from shift_type;
-- testing the deleting cascade in Shift Type table (pos_name)
select * from shift_type;
delete * from position where pos_name = 'Senior Dispatcher';
select * from shift_type;
