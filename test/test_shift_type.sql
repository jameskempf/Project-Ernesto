--  testing with duplicate primary key in Shift Type table
insert into shift_type values('DISP17MD00000100', 'Dispatcher');
--  testing with first foreign key does not exist in Shift Type table
insert into shift_type values('AAAAAAAAAAAAAAAA', 'Dispatcher');
--  testing with second foreign key does not exist in Shift Type table
insert into shift_type values('DISP17MD00000100', 'not a pos_name');
-- testing the deleting cascade in Shift Type table (sid)
insert into shift values('DISP17FR00000100', 'Friday', '0000', '0100', 'Spring', 'T', '00000000');
insert into shift_type values('DISP17FR00000100', 'Dispatcher');
select * from shift_type;
delete from shift where sid = 'DISP17FR00000100';
select * from shift_type;
-- testing the deleting cascade in Shift Type table (pos_name)
insert into shift values('DISP17FR00000100', 'Friday', '0000', '0100', 'Spring', 'T', '00000000');
insert into shift_type values('DISP17FR00000100', 'Senior Dispatcher');
select * from shift_type;
delete from position where pos_name = 'Senior Dispatcher';
select * from shift_type;
insert into position values('Senior Dispatcher', '14.00');
