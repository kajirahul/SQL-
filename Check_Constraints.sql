use OnlineShopping
go

/*
	brand name should only be aplhabets, no numbers and special characters allowed
*/
ALTER TABLE Brand
ADD CONSTRAINT Special_Characters_check
       CHECK (brand_name NOT LIKE '%[^A-Z%]')
go


/*
	phone number should only be numbers and of length exactly 10 
*/
alter table [user] add constraint check_number check (phone not like '%[^0-9]%' AND DataLength(phone) = 10)
go

/*
	user first name should only be aplhabets
*/
ALTER TABLE [user]
ADD CONSTRAINT Special_Characters_check
       CHECK (firstName NOT LIKE '%[^A-Z%]')
go

/*
	user last name should only be aplhabets
*/
ALTER TABLE [user]
ADD CONSTRAINT Special_Characters_check
       CHECK (lastName NOT LIKE '%[^A-Z%]')
go

/*
	Price cannot be negative or zero 
*/
alter table product add constraint check_price check (item_price > 0)
go 


/*
	Cart Id can be aplphabets, numbers or their combination 
*/
alter table wishlist add constraint check_cartID check ( cart_id NOT LIKE '%[^A-Z0-9%]')
go

