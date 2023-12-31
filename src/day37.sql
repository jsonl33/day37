--JOIN
create table dept05(
deptno number(38) primary key,
dname varchar2(100) not null
);

insert into dept05 values(10,'관리부');
insert into dept05 values(20,'영업부');
insert into dept05 values(30,'연구부');

select * from dept05 order by deptno asc;

create table emp05(
empno int primary key,
ename varchar(20),
job varchar2(50),
sal int,
comm int,
deptno number(38)
);

insert into emp05 values(11,'홍길동','관리사원',1500,0,10);
insert into emp05(empno,ename,job,sal,comm,deptno) values (12,'이순신','영업사원',1200,120,20);
insert into emp05 values(13,'강감찬','영업사원',1300,130,20);
insert into emp05 values(14,'신사임당','연구원',3000,300,30);

select * from emp05 order by empno asc;

select * from dept05, emp05;

create table room(
roomno number(38) primary key,
roomname varchar2(50) not null
);

insert into room values(404,'홍길동 샘');
insert into room values(405,'이순신 샘');

select * from room order by roomno asc;

commit;

create table st03(
stno number(38) primary key,
stname varchar2(20),
roomno number(38)
);

insert into st03 values(101,'유관순 학생',404);
insert into st03 values(102,'을지문덕 학생',405);
insert into st03 values(103,'신사임당 학생',405);
commit;

select * from st03 order by stno;

select * from room,st03 where room.roomno = st03.roomno;

select stno,stname,room.roomno,roomname from room,st03
where room.roomno = st03.roomno
and stname='신사임당 학생';

select * from st03,room where room.roomno = st03.roomno
and stname like '%덕%';

select stno,stname,r.roomno,roomname from room r,st03 s where r.roomno = s.roomno and stname like '%신%';

create table salgrade(
grade number(38) primary key,
LOSAL number(38) not null,
HISAL number(38) not null
);

insert into salgrade values(1,700,1200);
insert into salgrade values(2,1201,1400);
insert into salgrade values(3,1401,3000);
commit;

select * from salgrade order by grade;
select * from emp05 order by empno;

select ename,sal,grade from emp05, salgrade where sal between LOSAL and HISAL;
select e.ename, e.sal, s.grade from emp05 e, salgrade s where e.sal >= s.LOSAL and e.sal <= HISAL;

select d.deptno, d.dname, e.ename, e.sal, s.grade from dept05 d, emp05 e, salgrade s 
where d.deptno = e.deptno and e.sal between s.LOSAL and s.HISAL;