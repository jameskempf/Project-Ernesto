--  testing with duplicate primary key in Shift Type table
insert into shift_type values('DISP17MD00000100', 'Dispatcher');
--  testing with first foreign key does not exist in Shift Type table
insert into shift_type values('AAAAAAAAAAAAAAAA', 'Dispatcher');
--  testing with second foreign key does not exist in Shift Type table
insert into shift_type values('DISP17MD00000100', 'not a pos_name');
