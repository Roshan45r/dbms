create database banking;
use banking;

create table branch(
	branch_name varchar(40),
    branch_city varchar(40),
    assets double,
    primary key(branch_name)
    );
    
create table accounts(
	accno int,
    branch_name varchar(40),
    balance double,
    primary key(accno),
    foreign key(branch_name) references branch(branch_name)
    );
    
create table customer(
	customername varchar(40),
    customerstreet varchar(40),
    city varchar(40),
    primary key(customername)
    );
    
create table depositor(
	customername varchar(20),
    accno int,
    primary key(customername,accno),
    foreign key(customername) references customer(customername),
    foreign key(accno) references accounts(accno)
    );
    
create table loan(
	loannumber int,
    branch_name varchar(40),
    ammount int,
    primary key(loannumber),
    foreign key(branch_name) references branch(branch_name)
);

create table borrower(
	customername varchar(40),
    loannumber int,
    primary key(customername,loannumber),
    foreign key(customername) references customer(customername),
    foreign key(loannumber) references loan(loannumber)
    );
    
insert into branch values('bavangudi','bangalore',123693);
insert into branch values('hanumanthnagar','delhi',1265693.26);
insert into branch values('nr colony','bangalore',963693.83);
select * from branch;

insert into accounts values(1001,'bavangudi',1000);
insert into accounts values(1002,'nr colony',2000);
insert into accounts values(1003,'nr colony',2500);
select * from accounts;

insert into customer values('sanju','mg road','bangalore');
insert into customer values('roshan','nr colony','hubli');
insert into customer values('sai','nr colony','mysore');
select * from customer;

insert into depositor values('sanju',1001);
insert into depositor values('roshan',1002);
insert into depositor values('sai',1003);
select * from depositor;

insert into loan values(100,'bavangudi',100000);
insert into loan values(101,'bavangudi',20000);
insert into loan values(102,'hanumanthnagar',56916);
select * from loan;

insert into borrower values('sanju',100);
insert into borrower values('roshan',101);
insert into borrower values('roshan',102);
select * from borrower;

commit;




