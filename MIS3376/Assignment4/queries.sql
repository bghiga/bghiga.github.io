--drop tables in case you have created the following two tables
DROP TABLE CONSULTANT;
DROP TABLE MONTHLY_SALES;


create table consultant (ID varchar2(10), name varchar2(20), gender varchar2(1), title varchar2(20), DID varchar2 (5),
salary number(6),hiredate DATE, repts_to varchar2(5));

insert into consultant values ('GK01', 'Kuncheria, Ginu', 'M', 'Developer','FAE','80000','28-FEB-09','JR01');
insert into consultant values ('JR01', 'Ryan, James R.', 'M', 'Manager','FAE','135000','24-NOV-08','AZ02');
insert into consultant values ('DH01', 'Hoffpauir, Deb', 'F', 'Programmer','FAE','80000','09-DEC-09','JR01');
insert into consultant values ('JC01', 'Chan, Jackie', 'M', 'Sr. Analyst','IAFC','80000','','MP01');
insert into consultant values ('AZ01', 'Zhang, Anthony', 'M', 'Analyst','IAFC','65000','25-NOV-09','MS01');
insert into consultant values ('AZ02', 'Zhou, Alicia', 'F', 'Director','','225000','03-SEP-08','');
insert into consultant values ('MS01', 'Smith, Maranda', 'F', 'Sr. Analyst','IAFC','72500','15-MAY-12','MP01');
insert into consultant values ('RM01', 'Mayfield, Ron', 'M', 'Manager','RC','120000','11-NOV-08','AZ02');
insert into consultant values ('MR01', 'Ryan, Michael', 'M', 'Sr. Analyst','FAE','','14-FEB-13','JR01');
insert into consultant values ('MP01', 'Parke, Michael', 'M', 'Manager','IAFC','140000','09-DEC-08','AZ02');
insert into consultant values ('JD01', 'David, Jason', 'M', 'Programmer','RC','72500','24-NOV-11','RM01');
insert into consultant values ('NN01', 'Nguyen, Nicole', 'F', 'Analyst','IAFC','42000','22-MAR-12','JC01');
insert into consultant values ('LM01', 'Mai, Ly H.', 'F', 'Developer','RC','72000','17-MAR-09','RM01');
insert into consultant values ('ZL01', 'Li, ZP', 'F', 'Sr. Analyst','FAE','100000','31-MAY-11','JR01');

--creat a table called monthly_sales
create table monthly_sales (product number(5), year number (5), mnum number(5), units_sold number(5));

insert into monthly_sales values ('1', '2013','1', '91');
insert into monthly_sales values ('1', '2013','2', '61');
insert into monthly_sales values ('1','2013', '3', '53');
insert into monthly_sales values ('1','2013', '4', '98');
insert into monthly_sales values ('1','2013', '5', '91');
insert into monthly_sales values ('1','2013', '6', '63');
insert into monthly_sales values ('1','2013', '7', '88');
insert into monthly_sales values ('1','2013', '8', '74');
insert into monthly_sales values ('1', '2013','9', '59');
insert into monthly_sales values ('1', '2013','10', '58');
insert into monthly_sales values ('1','2013', '11', '86');
insert into monthly_sales values ('1','2013', '12', '81');
insert into monthly_sales values ('2', '2013','1', '52');
insert into monthly_sales values ('2','2013', '2', '98');
insert into monthly_sales values ('2','2013', '3', '85');
insert into monthly_sales values ('2','2013', '4', '93');
insert into monthly_sales values ('2','2013', '5', '51');
insert into monthly_sales values ('2', '2013','6', '55');
insert into monthly_sales values ('2','2013', '7', '57');
insert into monthly_sales values ('2', '2013','8', '61');
insert into monthly_sales values ('2', '2013','9', '69');
insert into monthly_sales values ('2', '2013','10', '66');
insert into monthly_sales values ('2', '2013','11', '56');
insert into monthly_sales values ('2', '2013','12', '67');
insert into monthly_sales values ('3','2013', '1', '77');
insert into monthly_sales values ('3','2013', '2', '96');
insert into monthly_sales values ('3','2013', '3', '54');
insert into monthly_sales values ('3','2013', '4', '59');
insert into monthly_sales values ('3','2013', '5', '81');
insert into monthly_sales values ('3', '2013','6', '81');
insert into monthly_sales values ('3', '2013','7', '73');
insert into monthly_sales values ('3', '2013','8', '97');
insert into monthly_sales values ('3','2013', '9', '79');
insert into monthly_sales values ('3','2013', '10', '95');
insert into monthly_sales values ('3','2013', '11', '96');
insert into monthly_sales values ('3','2013', '12', '58');
insert into monthly_sales values ('4','2013', '1', '65');
insert into monthly_sales values ('4', '2013','2', '76');
insert into monthly_sales values ('4','2013', '3', '90');
insert into monthly_sales values ('4','2013', '4', '62');
insert into monthly_sales values ('4','2013', '5', '53');
insert into monthly_sales values ('4','2013', '6', '83');
insert into monthly_sales values ('4','2013', '7', '53');
insert into monthly_sales values ('4', '2013','8', '93');
insert into monthly_sales values ('4','2013', '9', '65');
insert into monthly_sales values ('4','2013', '10', '59');
insert into monthly_sales values ('4', '2013','11', '96');
insert into monthly_sales values ('4','2013', '12', '83');
insert into monthly_sales values ('5','2013', '1', '86');
insert into monthly_sales values ('5','2013', '2', '83');
insert into monthly_sales values ('5','2013', '3', '68');
insert into monthly_sales values ('5','2013', '4', '84');
insert into monthly_sales values ('5','2013', '5', '58');
insert into monthly_sales values ('5','2013', '6', '62');
insert into monthly_sales values ('5','2013', '7', '69');
insert into monthly_sales values ('5', '2013','8', '71');
insert into monthly_sales values ('5','2013', '9', '52');
insert into monthly_sales values ('5','2013', '10', '78');
insert into monthly_sales values ('5', '2013','11', '93');
insert into monthly_sales values ('5','2013', '12', '74');

--1
select * from consultant
start with id = 'JR01'
connect by prior id = REPTS_TO;

--2
select * from consultant
start with id = 'JR01'
connect by id = prior REPTS_TO;

--3
SELECT LEVEL, LPAD(' ', 2*(LEVEL-1))||NAME as "Consultant Name"
from consultant
start with id = 'JR01'
connect by id = prior REPTS_TO;

--4
select * from consultant
START WITH ID IN (SELECT ID FROM consultant WHERE TITLE = 'Sr. Analyst' 
AND NAME NOT LIKE '%Smith%') 
CONNECT BY PRIOR ID =  REPTS_TO;

--5
select product as "Product Number", sum(units_sold)
from monthly_sales
group by rollup(product);
--6
select DECODE(GROUPING (product), 1, 'All Groups Total', product) as "product_name", sum(units_sold)
from monthly_sales
group by rollup(product);

--7
select product as "PRODUCT", sum(units_sold)
from monthly_sales
group by grouping sets(product)
order by sum(units_sold)desc;
