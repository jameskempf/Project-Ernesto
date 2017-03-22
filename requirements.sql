-- sql statements corresponding to each requirement

-- View a list of all employees by position
select last, first, pos_name
    from worker join works
        on worker.gid = works.gid
    order by works.pos_name;

LAST                 FIRST                POS_NAME
-------------------- -------------------- --------------------
Pond                 Amy                  Closer
Pines                Mabel                Closer
Purr                 Kitty                Dispatcher
Mossimo              Harold               Dispatcher
Oakenshield          Thorin               Dispatcher
Freeman              Martin               Dispatcher
Baggins              Bilbo                Dispatcher
Tolstoy              Leo                  Dispatcher
Holmes               Sherlock             Head Dispatcher
Cipher               Bill                 Opener
Cooper               Sheldon              Opener
Song                 River                PEA
Jones                Jessica              Parker
Flower               Gideon               Parker
Adipose              Trixie               Parker
Livingstone          Svetlana             Parker
Hepburn              Audrey               Senior Dispatcher
Ulta                 Dextra               Senior Dispatcher

  18 record(s) selected.

-- View a list of a specific position
select *
    from shift join shift_type
        on shift.sid = shift_type.sid
    where shift_type.pos_name = 'Dispatcher'
    order by day, start_time;

SID              DAY        START_TIME  END_TIME    TERM            IS_ROTATION GID         SID              POS_NAME
---------------- ---------- ----------- ----------- --------------- ----------- ----------- ---------------- --------------------
DISP17MD06001400 Monday             600        1400 Spring          F              12345678 DISP17MD06001400 Dispatcher
DISP17SU08001200 Sunday             800        1200 Spring          T                     - DISP17SU08001200 Dispatcher
DISP17TU14002200 Tuesday           1400        2200 Spring          F              55667788 DISP17TU14002200 Dispatcher

  3 record(s) selected.

-- View a list of empty shifts of a specific position
select *
    from shift join shift_type
        on shift.sid = shift_type.sid
    where shift_type.pos_name = 'Dispatcher'
        and shift.is_rotation = 'F'
        and gid is null
    order by day, start_time;

SID              DAY        START_TIME  END_TIME    TERM            IS_ROTATION GID         SID              POS_NAME
---------------- ---------- ----------- ----------- --------------- ----------- ----------- ---------------- --------------------
DISP17TH01300230 Thursday           130         230 Spring          F                     - DISP17TH01300230 Dispatcher

  1 record(s) selected.

-- Assign an employee to an empty shift
insert into shift values('DISP17SA06001400', 'Saturday', '0100', '0200', 'Spring', 'F', null);
update shift
    set gid = '11223344'
    where sid = 'DISP17SA06001400';

SID              DAY        START_TIME  END_TIME    TERM            IS_ROTATION GID
---------------- ---------- ----------- ----------- --------------- ----------- -----------
DISP17MD06001400 Monday             600        1400 Spring          F              12345678
DISP17TU14002200 Tuesday           1400        2200 Spring          F              55667788
OPSP17WE06001400 Wednesday          600        1400 Spring          F              11335577
PASP17TH06001400 Thursday           600        1400 Spring          F              22446688
DISP17SU08001200 Sunday             800        1200 Spring          T                     -
DISP17TH01300230 Thursday           130         230 Spring          F                     -
DISP17SA06001400 Saturday           100         200 Spring          F              11223344

  7 record(s) selected.

-- Record coverages
insert into coverage values('DISP17SA06001400', '2017-12-20', NULL, 'F');
update coverage
    set gid = '55667788'
    where sid = 'DISP17SA06001400';

SID              C_DATE     GID         MANDATORY
---------------- ---------- ----------- ---------
DISP17MD06001400 04/03/2017           - F
DISP17TU14002200 04/04/2017    12345678 T
OPSP17WE06001400 04/05/2017           - F
PASP17TH06001400 04/06/2017           - F
DISP17SU08001200 04/07/2017           - F
DISP17SA06001400 12/20/2017    55667788 F

  6 record(s) selected.

-- Mark shift as open
update shift
    set gid = null
    where sid = 'DISP17SA06001400';

SID              DAY        START_TIME  END_TIME    TERM            IS_ROTATION GID
---------------- ---------- ----------- ----------- --------------- ----------- -----------
DISP17MD06001400 Monday             600        1400 Spring          F              12345678
DISP17TU14002200 Tuesday           1400        2200 Spring          F              55667788
OPSP17WE06001400 Wednesday          600        1400 Spring          F              11335577
PASP17TH06001400 Thursday           600        1400 Spring          F              22446688
DISP17SU08001200 Sunday             800        1200 Spring          T                     -
DISP17TH01300230 Thursday           130         230 Spring          F                     -
DISP17SA06001400 Saturday           100         200 Spring          F                     -

  7 record(s) selected.

-- View a list of open coverages for a specific position
select coverage.sid, coverage.gid, c_date, mandatory, pos_name
    from coverage join (select shift.sid, pos_name
            from shift join shift_type on shift.sid = shift_type.sid) as shift_info
        on coverage.sid = shift_info.sid
    where coverage.gid is null
        and shift_info.pos_name = 'Dispatcher';

SID              GID         C_DATE     MANDATORY POS_NAME
---------------- ----------- ---------- --------- --------------------
DISP17MD06001400           - 04/03/2017 F         Dispatcher
DISP17SU08001200           - 04/07/2017 F         Dispatcher

  2 record(s) selected.

-- View a list of shifts for a specific person
select *
    from shift
    where gid = '12345678';

SID              DAY        START_TIME  END_TIME    TERM            IS_ROTATION GID
---------------- ---------- ----------- ----------- --------------- ----------- -----------
DISP17MD06001400 Monday             600        1400 Spring          F              12345678

  1 record(s) selected.

-- View a list of shifts that a specific person is covering
select *
    from coverage
    where gid = '12345678';

SID              C_DATE     GID         MANDATORY
---------------- ---------- ----------- ---------
DISP17TU14002200 04/04/2017    12345678 T

  1 record(s) selected.

-- View a list of all rotation shifts
select *
    from shift
    where is_rotation = 'T';

SID              DAY        START_TIME  END_TIME    TERM            IS_ROTATION GID
---------------- ---------- ----------- ----------- --------------- ----------- -----------
DISP17SU08001200 Sunday             800        1200 Spring          T                     -

  1 record(s) selected.

-- view a list of all parkers assigned
select *
    from parker_assigned;

P_DATE     START_TIME  END_TIME    GID
---------- ----------- ----------- -----------
03/27/2017        1200        1400    91234567
04/03/2017         800        1200    22446688
04/10/2017        1200        1600    44444444
04/17/2017        1600        2000    22446688
04/24/2017         800        1200    89123456

  5 record(s) selected.
