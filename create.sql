# Create Tables
create table position(
  pos_name char(20) not null primary key,
  pay_rate decimal(4,2) not null,
  check (pos_name in ('Dispatcher', 'Senior Dispatcher', 'Head Dispatcher', 'Parking Enforcement Assistant', 
         'Parking Attendant', 'Opener', 'Closer')));
         
create table worker(
  gid integer not null primary key,
  first char(20) not null,
  last char(20) not null);
  
create table works(
  pos_name char(20) not null references position,
  gid integer not null references worker,
  primary key(pos_name, gid));
  
create table shift(
  sid varchar(16) not null primary key,
  week_day char (10) not null,
  start_time integer(4) not null,
  end_time integer(4) not null,
  term, char(15) not null,
  is_rotation boolean not null,
  gid integer references worker,
  check(week_day in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
  check(term in ('Spring', 'Fall', 'Summer', 'Winter Break', 'Spring Break', 'Thanksgiving')));
  
create table shift_type(
  sid varchar(16) not null references shift,
  pos_name char(20) not null references position,
  primary key(sid, pos_name));
  
create table rotation_assigned(
  sid varchar(16) not null references shift,
  s_date date not null,
  gid integer references worker,
  primary key(sid, c_date));
  
create table coverage(
  sid varchar(16) not null references shift,
  c_date date not null,
  gid integer references worker,
  mandatory boolean not null,
  primary key(sid, c_date));
  
create table parker_shift(
  p_date date not null,
  start_time integer(4) not null,
  end_time integer(4) not null,
  num_req integer not null,
  primary key (p_date, start_time, end_time));
  
create table parker_assigned(
  p_date date not null references parker_shift,
  start_time integer(4) not null references parker_shift,
  end_time integer(4) not null references parker_shift,
  gid integer references worker,
  primary key (p_date, start_time, end_time, gid));
