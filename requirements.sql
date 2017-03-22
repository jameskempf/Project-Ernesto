-- sql statements corresponding to each requirement

-- View a list of all employees by position
select last, first, pos_name
    from worker join works
        on worker.gid = works.gid
    order by works.pos_name;

-- View a list of a specific position
select *
    from shift join shift_type
        on shift.sid = shift_type.sid
    where shift_type.pos_name = 'Dispatcher'
    order by day, start_time;

-- View a list of empty shifts of a specific position
select *
    from shift join shift_type
        on shift.sid = shift_type.sid
    where shift_type.pos_name = 'Dispatcher'
        and shift.is_rotation = 'F'
        and gid is null
    order by day, start_time;

-- Assign an employee to an empty shift
insert into shift values('DISP17SA06001400', 'Saturday', '0100', '0200', 'Spring', 'F', null);
update shift
    set gid = '11223344'
    where sid = 'DISP17SA06001400';

-- Record coverages
insert into coverage values('DISP17SA06001400', '2017-12-20', NULL, 'F');
update coverage
    set gid = '55667788'
    where sid = 'DISP17SA06001400';

-- Mark shift as open
update shift
    set gid = null
    where sid = 'DISP17SA06001400';

-- View a list of open coverages for a specific position
select coverage.sid, c_date, mandatory, pos_name
    from coverage join (select shift.sid, pos_name
            from shift join shift_type on shift.sid = shift_type.sid) as shift_info
        on coverage.sid = shift_info.sid
    where coverage.gid is null
        and shift_info.pos_name = 'Dispatcher';

-- View a list of shifts for a specific person
select *
    from shift
    where gid = '12345678';

-- View a list of shifts that a specific person is covering
select *
    from coverage
    where gid = '12345678';

-- View a list of all rotation shifts
select *
    from shift
    where is_rotation = 'T';

-- view a list of all parkers assigned
select *
    from parker_assigned;
