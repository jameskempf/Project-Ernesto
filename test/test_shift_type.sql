-- duplicate primary key
insert into shift_type values('DISP17MD00000100', 'Dispatcher');
-- first foreign key does not exist
insert into shift_type values('AAAAAAAAAAAAAAAA', 'Dispatcher');
-- second foreign key does not exist
insert into shift_type values('DISP17MD00000100', 'not a pos_name');
