--  testing with duplicate primary key in Shift table
insert into shift values('DISP17MD00000100', 'Monday', '0000', '0100', 'Spring', 'F', '00000000');
--  testing with foreign key does not exist in Shift table
insert into shift values('DISP17TU01000200', 'Tuesday', '0100', '0200', 'Fall', 'F', '99999999');
--  testing with improper day name in Shift table
insert into shift values('DISP17TU01000200', 'not a dat', '0100', '0200', 'Fall', 'F', '00000000');
--  testing with improper term name in Shift table
insert into shift values('DISP17TU01000200', 'Tuesday', '0100', '0200', 'not a term', 'F', '00000000');
--  testing with improper boolean value in Shift table
insert into shift values('DISP17TU01000200', 'Tuesday', '0100', '0200', 'Fall', 'N', '00000000');
