create database dbQuiz1_Rahul7
go 
use dbQuiz1_Rahul7
Create TABLE tblDepartment (DeptID nchar(10) primary key, Dname NVARCHAR(15), Dlocation nvarchar(15))
GO
Create Table tblEmployee (EmployeeID nchar(10) primary key, Fname nvarchar(15), Lname nvarchar(15), 
                        DeptID nchar(10)FOREIGN KEY REFERENCES tblDepartment(DeptID)) 
go

use [dbQuiz1_Rahul7]
GO
CREATE PROCEDURE spInsertEmployee @EmpId NCHAR(10), @Finame NVARCHAR(15), @Laname NVARCHAR(15), @DepiD nchar(10)
as 
begin 
INSERT INTO tblEmployee ([EmployeeID]
           ,[Fname]
           ,[Lname]
           ,[DeptID])
     VALUES
           (@EmpId
           ,@Finame
           ,@Laname
           ,@DepiD
           )
 END          
GO

use dbQuiz1_Rahul7
GO
CREATE PROCEDURE spInsertDepartment @DepttID NCHAR(10), @DName NVARCHAR(10), @DLLocation NVARCHAR(10)
as 
BEGIN
INSERT into tblDepartment ([DeptID]
                            ,[Dname]
                            ,[Dlocation])
                            VALUES
                            (@DepttID
                            ,@DName
                            ,@DLLocation)
END
GO
use dbQuiz1_Rahul7
GO
exec spInsertDepartment @DepttID = '10', @DName = 'Production', @DLLocation ='Seattle'
go
exec spInsertDepartment @DepttID = '20', @DName = 'Sales', @DLLocation ='Boston'
go
exec spInsertDepartment @DepttID = '30', @DName = 'Research', @DLLocation ='Seattle'
go
exec spInsertDepartment @DepttID = '40', @DName = 'Accounting', @DLLocation ='Boston'
go


use dbquiz1_Rahul7
GO
exec spInsertEmployee @EmpID = 'S10000', @Finame = 'John', @Laname = 'Smith', @DepiD = '10'
go
exec spInsertEmployee @EmpID = 'D10000', @Finame = 'Jerry', @Laname = 'Smith', @DepiD = '20'
go
exec spInsertEmployee @EmpID = 'F100', @Finame = 'Sam', @Laname = 'Diaz', @DepiD = '30'
go
exec spInsertEmployee @EmpID = 'G200', @Finame = 'Pete', @Laname = 'Johnson', @DepiD = '40'
go
exec spInsertEmployee @EmpID = 'F300', @Finame = 'Pretty', @Laname = 'Girl', @DepiD = '10'
go
exec spInsertEmployee @EmpID = 'A444', @Finame = 'Sweet', @Laname = 'Friend', @DepiD = '10'
go
exec spInsertEmployee @EmpID = 'G5555', @Finame = 'Nice', @Laname = 'Day', @DepiD = '40'
go

GO

use dbQuiz1_Rahul7
GO
create PROCEDURE spGetbyDlocation @Dlocation NVARCHAR(15)
AS
BEGIN
SELECT Fname from tblEmployee inner join tblDepartment on tblEmployee.DeptID = tblDepartment.DeptID where @Dlocation = 'Seattle' 

END
GO


use dbQuiz1_Rahul7
GO
exec spInsertEmployee 
@EmpID = 'A10111', @Finame = 'Serena', @Laname = 'Williams', @DepiD = '50'
go

