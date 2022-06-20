create database question3;
use question3;

create table suppliers(
	sid int,
    sname varchar(40),
    address varchar(40),
    primary key(sid)
    );
    
create table parts(
	pid int,
    pname varchar(40),
    color varchar(40),
    primary key(pid)
    );
    
create table catalogue(
	sid int,
    pid int,
    cost double precision,
    primary key(pid,sid),
    foreign key(sid) references suppliers(sid) on delete cascade,
    foreign key(pid) references parts(pid) on update cascade
);

insert into suppliers values(10001,'Acne Widget','Bangalore');
insert into suppliers values(10002,'Johns','Kolkata');
insert into suppliers values(10003,'Vimal','Mumbai');
insert into suppliers values(10004,'Reliance','Delhi');

insert into parts values(20001,'Book','Red');
insert into parts values(20002,'Pen','Red');
insert into parts values(20003,'Pencil','Green');
insert into parts values(20004,'Mobile','Green');
insert into parts values(20005,'Charger','Black');

insert into catalogue values(10001,20001,10);
insert into catalogue values(10001,20002,10);
insert into catalogue values(10001,20003,30);
insert into catalogue values(10001,20004,10);
insert into catalogue values(10001,20005,10);
insert into catalogue values(10002,20001,10);
insert into catalogue values(10002,20002,20);
insert into catalogue values(10003,20003,30);
insert into catalogue values(10004,20003,40);

select distinct pname from catalogue c,parts p where c.pid=p.pid;
select c.sid,s.sname from suppliers s,catalogue c,parts p having count(p.pid)=count(c.sid);
select distinct sid from catalogue where pid=any(select p.pid from parts p where p.color="red");
select p.pname from parts p,suppliers s,catalogue c where s.sname='Acne Widget' and s.sid=c.sid and c.pid=p.pid;













