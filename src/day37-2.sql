create table depart11(
dept_code varchar2(20) primary key,
dept_name varchar2(50) not null
);

insert into depart11 values (401,'홍길동쌤');
insert into depart11 values (402,'이순신쌤');

select * from depart11 order by dept_code asc;

create table student11(
st_no number(38) primary key,
st_name varchar2(30) not null,
st_gender varchar2(10),
dept_code varchar2(20)
);

insert into student11 values (11,'신사임당','여','401');
insert into student11 values (12,'홍길순','여','402');
insert into student11 values (13,'강감찬','남','402');

select * from student11;

select * from depart11 cross join student11;

select * from depart11 inner join student11 on depart11.dept_code=student11.dept_code;
commit;

select s.st_no, s.st_name, s.st_gender, d.dept_code, d.dept_name 
from depart11 d inner join student11 s on d.dept_code=s.dept_code
where s.st_name = '강감찬';