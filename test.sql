-- test queries for each dependency

-- POSITION
insert into position values('test', '10.00');
-- duplicate primary key
insert into position values('test', '10.00');

-- WORKER
insert into worker values('00000000', 'test', 'person');
-- duplicate primary key
insert into worker values('00000000', 'test', 'person');

-- WORKS
insert into works values('test', '00000000');
-- duplicate primary key
insert into works values('test', '00000000');
-- first foreign key does not exist
insert into works values('test1', '00000000');
-- second foreign key does not exist
insert into works values('test', '00000009');

-- SHIFT
insert into shift values('DISP17MD00000100', 'Monday', '0000', '0100', 'Spring', 'F', '00000000');
insert into shift values('DISP17TU00000100', 'Tuesday', '0000', '0100', 'Spring', 'F', '00000000');
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

-- SHIFT_TYPE
insert into shift_type values('DISP17MD00000100', 'Dispatcher');
-- duplicate primary key
insert into shift_type values('DISP17MD00000100', 'Dispatcher');
-- first foreign key does not exist
insert into shift_type values('AAAAAAAAAAAAAAAA', 'Dispatcher');
-- second foreign key does not exist
insert into shift_type values('DISP17MD00000100', 'not a pos_name');

-- ROTATION_ASSIGNED
insert into rotation_assigned values('DISP17MD00000100', '2017-04-07', '00000000');
-- duplicate primary key
insert into rotation_assigned values('DISP17MD00000100', '2017-04-07', '00000000');
-- first foreign key does not exist
insert into rotation_assigned values('AAAAAAAAAAAAAAAA', '2017-04-07', '00000000');
-- second foreign key does not exist
insert into rotation_assigned values('DISP17MD00000100', '2017-04-07', '99999999');

-- COVERAGE
insert into coverage values('DISP17MD00000100', '2017-04-03', '00000000', 'F');
-- duplicate primary key
insert into coverage values('DISP17MD00000100', '2017-04-03', '00000000', 'F');
-- first foreign key does not exist
insert into coverage values('AAAAAAAAAAAAAAAA', '2017-04-03', '00000000', 'F');
-- second foreign key does not exist
insert into coverage values('DISP17MD00000100', '2017-04-03', '99999999', 'F');
-- improper boolean value
insert into coverage values('DISP17TU00000100', '2017-04-03', '00000000', 'N');

-- PARKER_SHIFT
insert into parker_shift values('2017-04-03', '0000', '0100', '05');
-- duplicate primary key
insert into parker_shift values('2017-04-03', '0000', '0100', '05');

-- PARKER_ASSIGNED
insert into parker_assigned values('2017-04-03', '0000', '0100', '00000000');
-- duplicate primary key
insert into parker_assigned values('2017-04-03', '0000', '0100', '00000000');
-- first primary key does not exist
insert into parker_assigned values('2000-01-01', '2300', '2400', '00000000');
-- second primary key does not exist
insert into parker_assigned values('2017-04-03', '0000', '0100', '99999999');
