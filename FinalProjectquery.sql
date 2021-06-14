create database OnlineShopping
go

use OnlineShopping
go 

CREATE TABLE cart ( 
					cart_ID int NOT NULL,
					[user_ID] NVARCHAR(50) NOT NULL, 
					item_ID int NOT NULL )
go 

create table product (
					   item_ID int NOT NULL, 
					   item_name varchar(200) NOT NULL, 
					   item_price float NOT NULL, 
					   item_image varchar(200) NOT NULL, 
					   item_register datetime DEFAULT NULL
					   )
go

create table ProductBrand ( 
                            brand_num int NOT NULL,
							brand_id int NOT NULL,
							item_ID int NOT NULL)
go


create table Brand (
						brand_id int NOT NULL,
						brand_name nvarchar(200) NOT NULL)

go 


create table [user] (
					customer_ID NVARCHAR(50) not null,
					firstName varchar(255) DEFAULT NULL,
					lastName varchar(255) DEFAULT NULL,
					phone int DEFAULT NULL,
                    databasePrincipalID int,
					password varchar(50) DEFAULT NULL)
go

create table wishlist (
						cart_id int NOT NULL,
						[user_id] int NOT NULL,
						item_id int NOT NULL)
go 

create PROCEDURE Insert_Product @i_ID int, @i_name VARCHAR(200), @i_price FLOAT, @i_image VARCHAR(200), @i_register DATETIME
as 
begin 
Insert into product ([item_ID],[item_name],[item_price],[item_image],[item_register])
VALUES (@i_ID,@i_name,@i_price,@i_image,@i_register)
END
go 

EXEC Insert_Product @i_ID='1',@i_name='Galaxy J7',@i_price='255.50',@i_image='image1',@i_register='2021-03-26 21:12:43'
go

EXEC Insert_Product @i_ID='2',@i_name='Galaxy note',@i_price='505.50',@i_image='image2',@i_register='2021-03-26 21:12:43'
go
EXEC Insert_Product @i_ID='3',@i_name='Iphone 12',@i_price='955.50',@i_image='image3',@i_register='2021-03-26 21:12:43'
go
EXEC Insert_Product @i_ID='4',@i_name='Ipad pro',@i_price='555.50',@i_image='image4',@i_register='2021-03-26 21:12:43'
go
EXEC Insert_Product @i_ID='5',@i_name='Sony slim',@i_price='205.50',@i_image='image5',@i_register='2021-03-26 21:12:43'
go
EXEC Insert_Product @i_ID='6',@i_name='Sony rehexa',@i_price='655.50',@i_image='image6',@i_register='2021-03-26 21:12:43'
go
EXEC Insert_Product @i_ID='7',@i_name='OnePlus',@i_price='405.50',@i_image='image7',@i_register='2021-03-26 21:12:43'
go
EXEC Insert_Product @i_ID='8',@i_name='Motorola',@i_price='345.50',@i_image='image8',@i_register='2021-03-26 21:12:43'
go
EXEC Insert_Product @i_ID='9',@i_name='LG wing',@i_price='155.50',@i_image='image9',@i_register='2021-03-26 21:12:43'
go
EXEC Insert_Product @i_ID='10',@i_name='Galaxy J8',@i_price='255.50',@i_image='image10',@i_register='2021-03-26 21:12:43'
go

create PROCEDURE Insert_ProductBrand @b_num int, @b_id int, @i_id int 
AS
begin 
INSERT into ProductBrand ([brand_num],[brand_id],[item_ID])
VALUES (@b_num,@b_id,@i_id)
end 
go 

EXEC Insert_ProductBrand @b_num='111',@b_id = '1',@i_id='1'
go
EXEC Insert_ProductBrand @b_num='112',@b_id = '1',@i_id='2'
go 
EXEC Insert_ProductBrand @b_num='113',@b_id = '2',@i_id='3'
go 
EXEC Insert_ProductBrand @b_num='114',@b_id = '2',@i_id='4'
go 
EXEC Insert_ProductBrand @b_num='115',@b_id = '3',@i_id='5'
go 
EXEC Insert_ProductBrand @b_num='116',@b_id = '3',@i_id='6'
go 
EXEC Insert_ProductBrand @b_num='117',@b_id = '3',@i_id='7'
go 
EXEC Insert_ProductBrand @b_num='118',@b_id = '3',@i_id='8'
go 
EXEC Insert_ProductBrand @b_num='119',@b_id = '3',@i_id='9'
go 
EXEC Insert_ProductBrand @b_num='120',@b_id = '1',@i_id='10'
go 



create PROCEDURE Insert_Brand @b_id int, @b_name NVARCHAR(200)
as 
begin 
Insert into Brand ([brand_id],[brand_name])
VALUES (@b_id,@b_name)
end 
go
EXECUTE Insert_Brand @b_id = '1',@b_name='Samsung'
go 
 
EXECUTE Insert_Brand @b_id = '2',@b_name='Apple'
go 
EXECUTE Insert_Brand @b_id = '3',@b_name='Sony'
go 


create PROCEDURE Insert_user @u_id nvarchar(50), @fname VARCHAR(255), @lname VARCHAR(255), @phone int, @dataID int, @pass VARCHAR(50)
AS
begin 
insert into [user] ([customer_ID],[firstName],[lastName],[phone],[databasePrincipalID],[password])
VALUES (@u_id,@fname,@lname,@phone,@dataID,@pass)
end 
go 



create PROCEDURE Insert_cart @c_id int, @u_id nvarchar(55), @i_id INT
as 
begin 
insert into cart ([cart_ID],[user_ID],[item_ID])
VALUES (@c_id,@u_id,@i_id)
end 
go 
 


alter table product add primary key (item_ID)
go 
alter table ProductBrand add primary key (brand_num) 
go 
alter table Brand add primary key (brand_id)
go
alter table [user] add primary key (customer_ID)
go
alter table cart add primary key (cart_ID)
go
alter table cart add Foreign key ([user_ID]) references [user] ([customer_ID]), foreign key (item_ID) references product(item_ID)
go
alter table ProductBrand add Foreign key (item_ID) references product (item_ID), Foreign key (brand_id) references Brand (brand_id)
go

alter table [user] add CONSTRAINT checkID CHECK (Datalength(customer_ID) > 5) 
go 

alter table [user] drop CONSTRAINT checkID 
go

alter table [user] add CONSTRAINT checkIDLength CHECK (Datalength(customer_ID) > 7) 
go 
EXECUTE Insert_user @u_id='1bc',@fname='rahul',@lname='Thapa',@phone='123',@dataID='1',@pass='abc'
go 

alter table [product] add CONSTRAINT checkProduct CHECK (item_register='2021-03-26 21:12:43')
go
EXEC Insert_Product @i_ID='11',@i_name='Sony series',@i_price='800.25',@i_image='image11',@i_register='2021-04-26 21:12:43'
go

create ROLE [Manager]
create ROLE [User]
go

grant SELECT, UPDATE on [product] to [Manager] 
grant SELECT on [product] to [User] 
go

create USER [user1] without login 
alter role [User] add member [user1]
insert into [user] VALUES (1000,'User1','User1',222333, DATABASE_PRINCIPAL_ID('user1'),'aabb');
go 

create USER [user2] without login 
alter role [User] add member [user2]
insert into [user] VALUES (1001,'User2','User2',222222, DATABASE_PRINCIPAL_ID('user2'),'aabbcc');
go 

create user [manager1] without LOGIN
alter role [Manager] add member [manager1]
insert into [user] values (10003,'manager1','manager1',333333,DATABASE_PRINCIPAL_ID('manager1'),'password');
GO

EXECUTE Insert_cart @c_id="10000",@u_id='1000',@i_id='1'
go 
EXECUTE Insert_cart @c_id="100001",@u_id='1001',@i_id='2'
go 
EXECUTE Insert_cart @c_id="10001",@u_id='10003',@i_id='4'
go 

create schema securityaa
go 

create function securityaa.accessPredicate (@c_id int, @u_id nvarchar(50), @p_id int)
returns TABLE
with SCHEMABINDING
as 
  return ( SELECT 1 as accessPredicate FROM
  dbo.cart c inner join dbo.[user] u on (c.user_ID=u.customer_ID)
  WHERE(
       IS_MEMBER('User') =1
       and u.databasePrincipalID = DATABASE_PRINCIPAL_ID()
       and @c_id = c.cart_ID
  )
  or 
  (
      IS_MEMBER('Manager') = 1
  )
  )
GO

create SECURITY POLICY securityaa.ProductSecurity
add filter PREDICATE securityaa.accessPredicate(cart_ID,[user_ID],item_ID) on dbo.cart,
add block PREDICATE securityaa.accessPredicate(cart_ID,[user_ID],item_ID) on dbo.cart after UPDATE
with (STATE = ON)
GO

grant SELECT on [cart] to [User] 
go
grant SELECT, UPDATE on [cart] to [Manager] 
go
EXECUTE ('Select * from cart') as USER = 'user1'
go
EXECUTE ('Select * from cart') as USER = 'user2'
go
EXECUTE ('Select * from cart') as USER = 'manager1'
go

EXECUTE ('UPDATE product SET item_price = 934.45 WHERE item_ID = 1;') AS USER = 'user1' -- Blocked
go

grant SELECT,UPDATE on [cart] to [User] 
go
EXECUTE ('UPDATE cart SET cart_ID = 456 WHERE [user_ID] = 1001;') AS USER = 'user1' -- filtered, 0 rows affected
go