-- Create Tables

-- Table keeps the pay rates for each position (pos_name = Position Name)
create table position(
    pos_name varchar(20) not null primary key,
    pay_rate decimal(4,2) not null);

-- Table keeps a list of all employees (gid = Gordon ID)
create table worker(
    gid integer not null primary key,
    first varchar(20) not null,
    last varchar(20) not null);

-- Table keeps the relationship between workers and the position(s) they hold.
--    each worker may hold more than one position.
create table works(
    pos_name varchar(20) not null references position(pos_name) on delete cascade,
    gid integer not null references worker(gid) on delete cascade,
    primary key(pos_name, gid));

--Table keeps a record of all shifts to all positions.  The same shift may appear
--      accross multiple terms, years, and days of the week.  These shifts repeat
--      each week in a term and are not date bound (unlike coverage and rotation)
--      a shift may be assigned as rotation and the gid left null to assigned
--      workers by date instead of on a weekly basis.
create table shift(
    sid varchar(16) not null primary key,
    day char (10) not null,
    start_time integer not null,
    end_time integer not null,
    term varchar(15) not null,
    is_rotation varchar(1) not null,
    gid integer references worker(gid),
    --List of offical days of the week
    check(day in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday',
        'Saturday', 'Sunday')),
    --List of official terms
    check(term in ('Spring', 'Fall', 'Summer', 'Winter Break', 'Spring Break',
        'Thanksgiving')),
    --Rotation is simply true or false.
    check(is_rotation in ('T', 'F')),
    --Start and end times for shifts must be in appropriate military time.
    check(start_time between '0000' and '2400'),
    check(end_time between '0000' and '2400'));

--Table is a relation between a shift and the positions which can work them.
--  shifts can be of multiple types (for instance a dispatcher, senior dispatcher
--  and head dispatcher can all work the same type of shifts (dispatch shifts)
--  but each position is paid differently and may have their own unique shifts.
create table shift_type(
    sid varchar(16) not null references shift(sid) on delete cascade,
    pos_name char(20) not null references position(pos_name) on delete cascade,
    primary key(sid, pos_name));

--Table keeps a list of each date of a rotation shift and who it is assigned to.
create table rotation_assigned(
    sid varchar(16) not null references shift(sid) on delete cascade,
    a_date date not null,
    gid integer references worker(gid) on delete cascade,
    primary key(sid, a_date));

--Table keeps a list of coverage requests related to a particular shift.
--  If the shift is approved absences, is marked as mandatory and considered an
--  open shift for that date.  If someone covers the shift, their gid is added
--  as a relationship to the request. Swaps are simply listed twice.
create table coverage(
    sid varchar(16) not null references shift(sid) on delete cascade,
    c_date date not null,
    gid integer references worker(gid),
    mandatory char(1) not null,
    primary key(sid, c_date),
    check(mandatory in('T', 'F')));

--Table keeps a list of parking event dates/times and the number of parkers
--  required for each event.
create table parker_shift(
    p_date date not null,
    start_time integer not null,
    end_time integer not null,
    num_req integer not null,
    primary key (p_date, start_time, end_time),
-- Start and end times must be in appropriate military time format.
    check(start_time between '0000' and '2400'),
    check(end_time between '0000' and '2400'));

--Table maintains a list of parkers assigned to a parking event.
create table parker_assigned(
    p_date date not null,
    start_time integer not null,
    end_time integer not null,
    gid integer not null references worker(gid) on delete cascade,
    primary key (p_date, start_time, end_time, gid),
    foreign key (p_date, start_time, end_time) references parker_shift
            on delete cascade);


--Grant all permissions to the three schema authors
grant all on position to user james;
grant all on position to user anna;
grant all on position to user bjork;
grant all on worker to user james;
grant all on worker to user anna;
grant all on worker to user bjork;
grant all on works to user james;
grant all on works to user anna;
grant all on works to user bjork;
grant all on shift to user james;
grant all on shift to user anna;
grant all on shift to user bjork;
grant all on shift_type to user james;
grant all on shift_type to user anna;
grant all on shift_type to user bjork;
grant all on rotation_assigned to user james;
grant all on rotation_assigned to user anna;
grant all on rotation_assigned to user bjork;
grant all on coverage to user james;
grant all on coverage to user anna;
grant all on coverage to user bjork;
grant all on parker_shift to user james;
grant all on parker_shift to user anna;
grant all on parker_shift to user bjork;
grant all on parker_assigned to user james;
grant all on parker_assigned to user anna;
grant all on parker_assigned to user bjork;
