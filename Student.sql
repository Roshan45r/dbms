create database Student;
use Student;

create table STUDENT(
	snum int,
    sname varchar(40),
    major varchar(40),
    level varchar(40),
    age int,
    primary key(snum));

create table FACULTY(
	fid int,
    fname varchar(40),
    deptid int,
    primary key(fid));
    
create table CLASS(
	cname varchar(40),
    meet_at time,
    room varchar(40),
    fid int,
    primary key(cname),
    foreign key (fid) references FACULTY(fid));
    
create table ENROLLED(
	snum int,
    cname varchar(40),
    primary key(snum),
    foreign key (snum) references STUDENT(snum),
    foreign key (cname) references CLASS(cname));
