set search_path = test;

select * from sal_emp;

drop table if exists service_windows;
-- create table if not exists service_windows (
--     id int,
--     branch_id int,
--     location_id int,
--     service_window text [][]
-- );
create table if not exists service_windows (
    id int,
    service_window json
);

insert into service_windows (id, branch_id, location_id, service_window)
values (1,1,1,
    ARRAY[['M','0600-1200']]
       );
insert into service_windows (id, branch_id, location_id, service_window)
values (2,2,2,
    ARRAY[['M','0500-1200','1700-1800'],['T','0500-1200']]
       );

-- service_window working
drop table if exists service_windows;
create table if not exists service_windows (
    id int, branch_id int, location_id int,
    service_window json
);
insert into service_windows (id, branch_id, location_id, service_window)
values (1,1,1,
'[
{"sd": "M", "sw": ["0600-1200","1400-1500"]},
{"sd": "T", "sw": ["0600-1200","1400-1500"]}
]');
insert into service_windows (id, branch_id, location_id, service_window)
values (2,2,2,
'[
{"sd": "W", "sw": ["0600-1200","1400-1500"]},
{"sd": "H", "sw": ["0600-1200"]}
]');
select * from service_windows;

-- json examples
select '{"a": "able"}'::json;
SELECT '[1, 2, "foo", null]'::json;