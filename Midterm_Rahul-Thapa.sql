create database dbMidterm_RahulThapa 
GO

use dbMidterm_RahulThapa
GO

create table Employee (SSN nvarchar(10) not null,  Employee_Name nvarchar(30), Date_of_Birth nvarchar(10))
go
create table EmpAdrees (AddressID nvarchar(10) not null, SSN nvarchar(10) not null)
go
create table Employee_Address_Location (AddressID nvarchar(10) not null, AddressName nvarchar(30))
go
create table Department (Dpt_ID nvarchar(10) not null, Department_Name nvarchar(30))
go
create table Department_Headquarter (Headquarter_ID nvarchar(10) not null, Dpt_ID nvarchar(10) not null,Headquater_Name nvarchar(30))
go

create table Emp_WorksOn_Dpt (Dpt_ID nvarchar(10) not null, SSN nvarchar(10) not null)
go
create table Project (Project_Num nvarchar(10) not null, Project_Name nvarchar(30))
GO
create table Project_Location (Location_ID nvarchar(10) not null,Project_Num nvarchar(10) not null,Location_Name nvarchar(30))
GO

create table Project_Department (Project_Num nvarchar(10) not null, Dpt_ID nvarchar(10) not null)
GO
create table Emp_WorksOn_Project (SSN nvarchar(10) not null, Project_Num nvarchar(10) not null)
go

create PROCEDURE Emp_Insert @SSN NVARCHAR(10),@E_Name NVARCHAR(30), @dob NVARCHAR(10)
as 
BEGIN
INSERT into Employee ([SSN],[Employee_Name],[Date_of_Birth])
VALUES (@SSN,@E_Name,@dob)
END
go
EXECUTE Emp_Insert @SSN='1s',@E_name='John',@dob='02/11/1999'
go
EXECUTE Emp_Insert @SSN='2s',@E_name='Joseph',@dob='10/11/1992'
go
EXECUTE Emp_Insert @SSN='3s',@E_name='Jack',@dob='02/03/1976'
go

create PROCEDURE Dpt_Insert @D_id NVARCHAR(10), @D_name NVARCHAR(30)
as 
BEGIN
insert into Department ([Dpt_ID],[Department_Name])
VALUES (@D_id,@D_name)
end 
go
EXECUTE Dpt_Insert @D_id='1d',@D_name='Core Marketing Department'
go
EXECUTE Dpt_Insert @D_id='2d',@D_name='Marketing Research Department'
go
EXECUTE Dpt_Insert @D_id='3d',@D_name='Human Resources'
go


create PROCEDURE Dptheadq_Insert @h_id NVARCHAR(10),@D_id NVARCHAR(10), @H_name NVARCHAR(30)
as 
BEGIN
insert into Department_Headquarter ([Headquarter_ID],[Dpt_ID],[Headquater_Name])
VALUES (@h_id,@D_id,@H_name)
end 
go
EXECUTE Dptheadq_Insert @h_id='1h',@D_id='1d',@H_name='NewYork'
go
EXECUTE Dptheadq_Insert  @h_id='1h',@D_id='2d',@H_name='NewYork'
go
EXECUTE Dptheadq_Insert  @h_id='2h',@D_id='3d',@H_name='San Francisco'
go

create PROCEDURE Emp_DptInsert @D_id NVARCHAR(10), @ssn NVARCHAR(10)
as 
BEGIN
INSERT into Emp_WorksOn_Dpt ([Dpt_ID],[SSN])
values (@D_id,@ssn)
END
go
EXECUTE Emp_DptInsert @D_id='1d',@ssn='1s'
go
EXECUTE Emp_DptInsert @D_id='2d',@ssn='1s'
go
EXECUTE Emp_DptInsert @D_id='3d',@ssn='2s'
go
EXECUTE Emp_DptInsert @D_id='1d',@ssn='3s'
go

create PROCEDURE Project_Insert @p_id NVARCHAR(10), @p_name NVARCHAR(30)
as 
BEGIN
INSERT into Project ([Project_Num],[Project_Name])
VALUES (@p_id,@p_name)
END
go
EXECUTE Project_Insert @p_id ='1p',@p_name ='SQL_Customer11'
go
EXECUTE Project_Insert @p_id ='2p',@p_name ='SQL_Customer12'
go
EXECUTE Project_Insert @p_id ='3p',@p_name ='Java_customer11'
go


create PROCEDURE PLocationIDInsert @l_ID NVARCHAR(10), @p_num NVARCHAR(10), @l_name NVARCHAR(30)
as 
BEGIN
insert into Project_Location ([Location_ID],[Project_Num],[Location_Name])
VALUES (@l_ID,@p_num,@l_Name)
END
go
EXECUTE PLocationIDInsert @l_ID='1L',@p_num='1p', @l_Name='Paris'
go
EXECUTE PLocationIDInsert @l_ID='2L', @p_num='1p', @l_Name='New Delhi'
go
EXECUTE PLocationIDInsert @l_ID='3L', @p_num='1p', @l_Name='Kolkata'
go

EXECUTE PLocationIDInsert @l_ID='1L', @p_num='2p', @l_Name='Paris'
go
EXECUTE PLocationIDInsert @l_ID='2L', @p_num='2p', @l_Name='New Delhi'
go

EXECUTE PLocationIDInsert @l_ID='4L', @p_num='2p', @l_Name='Fontainbleau'
go
EXECUTE PLocationIDInsert @l_ID='5L', @p_num='3p', @l_Name='Bejing'
go
EXECUTE PLocationIDInsert @l_ID='6L', @p_num='3p', @l_Name='Sanghai'
go


create PROCEDURE Emp_Project_Insert @SSN nvarchar(10), @P_Num nvarchar(10)
as 
BEGIN
insert into Emp_WorksOn_Project ([SSN],[Project_Num])
VALUES (@SSN,@P_Num)
END
go
EXECUTE Emp_Project_Insert @SSN = '1s', @P_Num = '1p'
go
EXECUTE Emp_Project_Insert @SSN = '1s', @P_Num = '2p'
go
EXECUTE Emp_Project_Insert @SSN = '3s', @P_Num = '3p'
go

alter table Employee add PRIMARY key (SSN) 
go

alter table Department add PRIMARY key (Dpt_ID) 
go
alter table Department_Headquarter add FOREIGN KEY (Dpt_ID) REFERENCES Department (Dpt_ID)
go
alter table Department_Headquarter add PRIMARY KEY (Headquarter_ID,Dpt_ID)
go
alter table Emp_WorksOn_Dpt add FOREIGN KEY(SSN) REFERENCES Employee(SSN)
GO
alter table Emp_WorksOn_Dpt add FOREIGN KEY(Dpt_ID) REFERENCES Department(Dpt_ID)
GO
alter table Emp_WorksOn_Dpt add PRIMARY KEY(Dpt_ID,SSN)
GO
alter table Project add PRIMARY KEY (Project_Num)
go
alter table Project_Location add FOREIGN KEY (Project_Num) REFERENCES Project (Project_Num)
go
alter table Project_Location add PRIMARY KEY (Project_Num, Location_ID)
GO
alter table Emp_WorksOn_Project add FOREIGN key (SSN) REFERENCES Employee(SSN)
GO
alter table Emp_WorksOn_Project add FOREIGN key (Project_Num) REFERENCES Project(Project_Num)
GO
ALTER  TABLE Emp_WorksOn_Project add PRIMARY KEY (SSN, Project_Num)
GO


select distinct p.Location_Name,  a.Employee_Name from Project_Location p inner JOIN 
Emp_WorksOn_Project e on e.Project_Num = p.Project_Num 
RIGHT JOIN Employee a on a.SSN = e.SSN 
order by a.Employee_Name
GO


select distinct dh.Headquater_Name ,  a.Employee_Name from Department_Headquarter dh inner JOIN 
Emp_WorksOn_Dpt ed on ed.Dpt_ID = dh.Dpt_ID
INNER JOIN Employee a on a.SSN = ed.SSN 
order by a.Employee_Name
GO


create table FixedSalary (EmpName nvarchar(10) not null, FixedSalaryE int)
GO
create table ProjectSalary (EmpName nvarchar(10) not null , Project_Num NVARCHAR(10), Hours_Worked int, Project_Rate int, Project_Salary int)
go

CREATE PROCEDURE fixedsalaryInsert @ename NVARCHAR(10), @fs INT
as 
BEGIN
insert into FixedSalary ([EmpName],[FixedSalaryE])
values (@ename,@fs)
end 
go 
EXEC fixedsalaryInsert @ename='John',@fs='5000'
go
EXEC fixedsalaryInsert @ename='Joseph',@fs='5500'
go
EXEC fixedsalaryInsert @ename='Jack',@fs='6000'
go

create PROCEDURE projectSalaryInsert @ename NVARCHAR(10), @pnum NVARCHAR(10), @hrs int, @rate int, @ps int 
as 
BEGIN
insert into ProjectSalary ([EmpName],[Project_Num],[Hours_Worked],[Project_Rate],[Project_Salary])
VALUES (@ename,@pnum,@hrs,@rate,@ps)
END
go 
EXEC projectSalaryInsert @ename='John',@pnum='1p',@hrs='80',@rate='15',@ps='1200'
go 
EXEC projectSalaryInsert @ename='John',@pnum='2p',@hrs='80',@rate='15',@ps='1200'
go 
EXEC projectSalaryInsert @ename='Joseph',@pnum=null,@hrs=null,@rate=null,@ps=null
go 
EXEC projectSalaryInsert @ename='Jack',@pnum=null,@hrs=null,@rate=null,@ps=null
go 



select distinct p.EmpName,COALESCE(sum(Project_Salary),0) as 'Project salary', f.FixedSalaryE , 
f.FixedSalaryE + COALESCE(SUM(Project_Salary),0) as 'Total salary'
from ProjectSalary p inner join FixedSalary f on p.EmpName =f.EmpName
GROUP by f.FixedSalaryE, p.EmpName
go
