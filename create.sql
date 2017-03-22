-- Create Tables
create table position(
    pos_name varchar(20) not null primary key,
    pay_rate decimal(4,2) not null);

create table worker(
    gid integer not null primary key,
    first varchar(20) not null,
    last varchar(20) not null);

create table works(
    pos_name varchar(20) not null references position(pos_name) on delete cascade,
    gid integer not null references worker(gid) on delete cascade,
    primary key(pos_name, gid));

create table shift(
    sid varchar(16) not null primary key,
    day char (10) not null,
    start_time integer not null,
    end_time integer not null,
    term varchar(15) not null,
    is_rotation varchar(1) not null,
    gid integer references worker(gid),
    check(day in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday',
        'Saturday', 'Sunday')),
    check(term in ('Spring', 'Fall', 'Summer', 'Winter Break', 'Spring Break',
        'Thanksgiving')),
    check(is_rotation in ('T', 'F')),
    check(start_time between '0000' and '2400'),
    check(end_time between '0000' and '2400'));

create table shift_type(
    sid varchar(16) not null references shift(sid) on delete cascade,
    pos_name char(20) not null references position(pos_name) on delete cascade,
    primary key(sid, pos_name));

create table rotation_assigned(
    sid varchar(16) not null references shift(sid) on delete cascade,
    a_date date not null,
    gid integer references worker(gid) on delete cascade,
    primary key(sid, a_date));

create table coverage(
    sid varchar(16) not null references shift(sid) on delete cascade,
    c_date date not null,
    gid integer references worker(gid),
    mandatory char(1) not null,
    primary key(sid, c_date),
    check(mandatory in('T', 'F')));

create table parker_shift(
    p_date date not null,
    start_time integer not null,
    end_time integer not null,
    num_req integer not null,
    primary key (p_date, start_time, end_time),
    check(start_time between '0000' and '2400'),
    check(end_time between '0000' and '2400'));

create table parker_assigned(
    p_date date not null,
    start_time integer not null,
    end_time integer not null,
    gid integer not null references worker(gid) on delete cascade,
    primary key (p_date, start_time, end_time, gid),
    foreign key (p_date, start_time, end_time) references parker_shift
            on delete cascade);



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
