-- duplicate primary key
insert into shift values('DISP17MD00000100', 'Monday', '0000', '0100', 'Spring', 'F', '00000000');
-- foreign key does not exist
insert into shift values('DISP17TU01000200', 'Tuesday', '0100', '0200', 'Fall', 'F', '99999999');
-- improper day name
insert into shift values('DISP17TU01000200', 'not a dat', '0100', '0200', 'Fall', 'F', '00000000');
-- improper term name
insert into shift values('DISP17TU01000200', 'Tuesday', '0100', '0200', 'not a term', 'F', '00000000');
-- improper boolean value
insert into shift values('DISP17TU01000200', 'Tuesday', '0100', '0200', 'Fall', 'N', '00000000');
