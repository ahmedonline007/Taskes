-- create DB --
create DataBase HRDB


--create table --
use [HRDB]
Go
create table Employee(
EMPLOYEE_ID int primary key,
FIRST_NAME nvarchar(150),
LAST_NAME  nvarchar(150),
HIRE_DATE date,
JOB_ID nvarchar(100),
SALARY float,
MANAGER_ID int ,
DEPARTMENT_ID int 
)

create table Payment_Slip(
PAYMENT_ID int primary key,
EMPLOYEE_ID int,
PAYMENT_DATE date,
SALARY float,
 constraint Employee_Payment_FK  Foreign key
(EMPLOYEE_ID) references Employee(EMPLOYEE_ID) 
) 

--insert Employee
insert into Employee (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE ,JOB_ID , SALARY ,MANAGER_ID, DEPARTMENT_ID)
                values (100,'Steven','King','2003-06-17','AD_PRES' ,24000 ,0,90 )

insert into Employee (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE ,JOB_ID , SALARY ,MANAGER_ID, DEPARTMENT_ID)
values (101,'Neena','Kochhar','2005-09-21' ,'AD_VP',8000,100,90 )

insert into Employee (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE ,JOB_ID , SALARY ,MANAGER_ID, DEPARTMENT_ID)
values (102,'Lex','De Haan','2001-01-13','AD_VP'  ,5000 ,100,90 )

--insert Payment 
insert into Payment_Slip (PAYMENT_ID,EMPLOYEE_ID,PAYMENT_DATE ,SALARY)
values ( 1,100,'2019-10-17' ,24000)

insert into Payment_Slip (PAYMENT_ID,EMPLOYEE_ID,PAYMENT_DATE ,SALARY)
values (  2 ,101,'2019-10-21' ,8000)
 
 insert into Payment_Slip (PAYMENT_ID,EMPLOYEE_ID,PAYMENT_DATE ,SALARY)
values ( 3,102,'2019-10-13',5000)
 
 insert into Payment_Slip (PAYMENT_ID,EMPLOYEE_ID,PAYMENT_DATE ,SALARY)
values ( 4,100,'2019-11-13' ,24000)
 
 insert into Payment_Slip (PAYMENT_ID,EMPLOYEE_ID,PAYMENT_DATE ,SALARY)
values ( 5,101 ,'2019-11-13' ,8000)
 
 insert into Payment_Slip (PAYMENT_ID,EMPLOYEE_ID,PAYMENT_DATE ,SALARY)
values ( 6,102 ,'2019-11-13' ,5000)
 
 insert into Payment_Slip (PAYMENT_ID,EMPLOYEE_ID,PAYMENT_DATE ,SALARY)
values ( 7,100 ,'2019-12-13',24000)
 
 insert into Payment_Slip (PAYMENT_ID,EMPLOYEE_ID,PAYMENT_DATE ,SALARY)
values ( 8 ,101 ,'2019-12-13' ,8000)
 
 insert into Payment_Slip (PAYMENT_ID,EMPLOYEE_ID,PAYMENT_DATE ,SALARY)
values ( 9,102 ,'2019-12-13' ,5000)


---  Sql Query  ---
use [HRDB]
GO
select PAYMENT_ID ,(Emp.FIRST_NAME + Emp.LAST_NAME) as 'FULL NAME' ,
Payment.PAYMENT_DATE ,Payment.SALARY
from Payment_Slip Payment  
join Employee Emp on Payment.EMPLOYEE_ID = Emp.EMPLOYEE_ID
where Payment.PAYMENT_DATE = (Select MAX(PAYMENT_DATE) from Payment_Slip)


 