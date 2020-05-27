create database  finalfinal
--Users(username, password, first_name, last_name, password, email)
Create table Users(
username varchar(30), 
password varchar(30),
first_name varchar(30),
last_name varchar(30),
email varchar(70),
constraint upk PRIMARY KEY(username)

)
--User_mobile_numbers(mobile_number, username)
Create table  User_mobile_numbers(
mobile_number varchar(30),
username  varchar(30),
constraint umnpk PRIMARY KEY(username,mobile_number),
constraint umnfk Foreign key(username) references Users ON Update cascade on delete cascade 
)
--User_Addresses(address, username)
Create table User_Addresses(
address varchar(30),
username  varchar(30),
constraint uapk PRIMARY KEY(username,address),
constraint uafk Foreign key(username) references Users ON Update cascade on delete cascade 
)
--Customer(username, points)



Create table Customer(
points INT,
username  varchar(30),
constraint cpk PRIMARY KEY(username),
constraint cfk Foreign key(username) references Users ON Update cascade on delete cascade 
)

--Admins(username)
Create table Admins(
username  varchar(30),
constraint apk PRIMARY KEY(username),
constraint afk Foreign key(username) references Users ON Update cascade on delete cascade 
)
--Vendor(username, activated, company_name, bank_acc_no, admin_username)
 Create table Vendor(
 username  varchar(30),
 activated BIT,
 company_name varchar(30),
 bank_acc_no varchar(50),
 admin_username varchar(30),
 constraint vpk PRIMARY KEY(username),
 constraint vufk Foreign key(username) references Users ON Update cascade on delete cascade ,
 constraint vafk Foreign key(admin_username) references Admins ON Update NO ACTION on delete NO ACTION --I MADE IT NO ACTION BECAUSE IT GAVE AN ERROR
 )
--Delivery_Person(username, is_activated)
CREATE TABLE Delivery_Person(username varchar(30),      --7
is_activated  bit,   --BOOLEAN ??
constraint dppk PRIMARY KEY (username),
constraint dpfk FOREIGN KEY (username) REFERENCES  Users ON Update cascade on delete cascade
)

 CREATE TABLE Credit_Card(  --8
 number VARCHAR(30),           
 expiry_date datetime, 
 cvv_code varchar(20),
 constraint ccpk PRIMARY KEY (number)
 )


CREATE TABLE Delivery(
id INTEGER IDENTITY,    --9
type VARCHAR(30),
time_duration varchar(10), --DATATYPE INT??
fees Decimal,
username varchar(30),
constraint dpk PRIMARY KEY (id),
constraint dfk FOREIGN KEY (username) REFERENCES  Admins ON Update cascade on delete cascade
)
ALTER TABLE Delivery
ALTER COLUMN type VARCHAR(30)

CREATE TABLE Giftcard(

code VARCHAR(20),
expiry_date datetime,
amount INT,
username  VARCHAR(30),
CONSTRAINT giftcard_pk PRIMARY KEY(code),
CONSTRAINT giftcard_fk FOREIGN KEY(username) REFERENCES Admins ON DELETE CASCADE ON UPDATE CASCADE


);


--Orders(order_no, order_date, total_amount, cash_amount, credit_amount, payment_type,
--order_status, remaining_days, time_limit, customer_name, delivery_id, creditCard_number)
CREATE TABLE Orders(
order_no INTEGER IDENTITY,    
order_date datetime,
total_amount REAL,
cash_amount REAL ,
credit_amount REAL,
payment_type  varchar(20),
order_status  varchar(20) ,
remaining_days INTEGER ,
time_limit varchar(20) ,--WHAT DOES THIS ATTRIBUTE REPRESENTS AND WHAT IS ITS NAME
customer_name varchar(30),
delivery_id INTEGER,
creditCard_number VARCHAR(30),
Gift_Card_code_used VARCHAR(20)
constraint opk PRIMARY KEY (order_no),
constraint ofkc FOREIGN KEY (customer_name) REFERENCES   Customer ON Update cascade on delete cascade,
constraint ofkd FOREIGN KEY (delivery_id) REFERENCES   Delivery ON update NO Action  on delete NO Action,--I MADE IT NO ACTION BECAUSE IT GAVE AN ERROR
constraint ofkcc FOREIGN KEY (creditCard_number) REFERENCES  Credit_Card ON Update cascade on delete cascade,
constraint ofkgc FOREIGN KEY (Gift_Card_code_used) REFERENCES Giftcard  ON Update NO ACTION on delete NO ACTION

)

CREATE TABLE Product(  --11
serial_no INT IDENTITY,    
product_name varchar(20),
category varchar(20),
product_description varchar(100),
price DECIMAL(10,2),
final_price DECIMAL(10,2),
color varchar(20),
available BIT,    --BOOLEAN ??
rate  REAL,
customer_order_id INT,--IT IS NOT IN SCHEMA BUT WRITTEN IN REFRENCE SO I ADDED IT 
vendor_username varchar(30),
customer_username varchar(20),
constraint ppk PRIMARY KEY (serial_no),
constraint pfkv FOREIGN KEY (vendor_username) REFERENCES Vendor ON Update cascade on delete cascade,
constraint pfko FOREIGN KEY (customer_order_id) REFERENCES Orders ON Update NO Action  on delete NO Action --NO ACTION AS IT GAVE ME ERROR
)



CREATE TABLE CustomerAddstoCartProduct(  --12
serial_no INT,      
customer_name varchar(30),
constraint ctcpk PRIMARY KEY (serial_no, customer_name),
constraint ctcfkp FOREIGN KEY (serial_no) REFERENCES Product ON Update cascade on delete cascade,
constraint ctcfkc FOREIGN KEY (customer_name) REFERENCES Customer ON Update NO Action on delete NO Action
)

CREATE TABLE Todays_Deals(
deal_id INT IDENTITY,
deal_amount DECIMAL(10,2),
expiry_date datetime,
admin_username VARCHAR(30) ,
CONSTRAINT Todays_Deals_pk PRIMARY KEY(deal_id),
CONSTRAINT Todays_admin_fk FOREIGN KEY(admin_username) REFERENCES Admins(username) ON DELETE CASCADE ON UPDATE CASCADE
);




CREATE TABLE Todays_Deals_Product(
deal_id  INT  ,
serial_no INT ,
CONSTRAINT Todays_Deals_Product_pk PRIMARY KEY(deal_id,serial_no),
CONSTRAINT Todays_Deals_fk FOREIGN KEY(deal_id) REFERENCES Todays_Deals(deal_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT Todays_Product_fk FOREIGN KEY(serial_no) REFERENCES Product(serial_no) ON DELETE NO Action ON UPDATE NO Action  --CASED ERROR SO UPDATED IT NO ACTION
); 


CREATE TABLE offer(
offer_id INT  IDENTITY,
offer_amount DECIMAL(10,2),
expiry_date datetime
CONSTRAINT offer_pk PRIMARY KEY(offer_id)
);


CREATE TABLE Wishlist(
username VARCHAR(30) ,
name VARCHAR(20),
CONSTRAINT Wishlist_pk PRIMARY KEY(username,name),
CONSTRAINT wishlist_customer_fk FOREIGN KEY(username) REFERENCES Customer(username) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Wishlist_Product( 

username VARCHAR(30),
wish_name VARCHAR(20),
serial_no INT,
CONSTRAINT wishlistproduct_pk PRIMARY KEY( username, wish_name,serial_no),
CONSTRAINT wishlistproduct_fkw FOREIGN KEY(username,wish_name) REFERENCES Wishlist ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT wishlistproduct_fkp FOREIGN KEY(serial_no) REFERENCES Product ON DELETE NO Action ON UPDATE NO Action --CASCADE CAUSE ERRORS

);


CREATE TABLE Admin_Customer_Giftcard(
code VARCHAR(20),
customer_name VARCHAR(30),
admin_username VARCHAR(30),
remaining_points INT,
CONSTRAINT admincustomergiftcard_pk PRIMARY KEY(code, customer_name,admin_username),
CONSTRAINT admincustomergiftcard_fkg FOREIGN KEY(code) REFERENCES Giftcard ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT admincustomergiftcard_fkc FOREIGN KEY(customer_name) REFERENCES Customer ON DELETE NO Action ON UPDATE NO Action,--CASCADE CAUSE ERRORS
CONSTRAINT admincustomergiftcard_fka FOREIGN KEY(admin_username) REFERENCES Admins ON DELETE NO Action ON UPDATE NO Action,--cascade caused errors

);


CREATE TABLE Admin_Delivery_Order(
delivery_username VARCHAR(30),
 order_no INT,
 admin_username VARCHAR(30),
 delivery_window  varchar(50)
 CONSTRAINT admindeliveryorder_pk PRIMARY KEY(delivery_username, order_no),
 CONSTRAINT admindeliveryorder_fkd FOREIGN KEY(delivery_username) REFERENCES Delivery_person ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT admindeliveryorder_fko FOREIGN KEY( order_no) REFERENCES  orders ON DELETE NO Action ON UPDATE NO Action, --cascade cause d errors
  CONSTRAINT admindeliveryorder_fka FOREIGN KEY( admin_username) REFERENCES  Admins ON DELETE NO Action ON UPDATE NO Action  --cascade cause d errors
);




CREATE TABLE Customer_CreditCard(
customer_name VARCHAR(30),
cc_number VARCHAR(30) ,
CONSTRAINT customercreditcard_pk PRIMARY KEY(customer_name,cc_number),
CONSTRAINT customercreditcard_fkc FOREIGN KEY(customer_name) REFERENCES  Customer ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT customercreditcard_fkcc FOREIGN KEY(cc_number) REFERENCES  Credit_Card ON DELETE CASCADE ON UPDATE CASCADE


);


CREATE TABLE offersOnProduct(
offer_id INT ,
serial_no INT,
CONSTRAINT offersOnProduct_pk PRIMARY KEY (offer_id,serial_no),
CONSTRAINT offersOnProduct_fk FOREIGN KEY(offer_id) REFERENCES offer(offer_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT offers_product_fk FOREIGN KEY(serial_no) REFERENCES Product(serial_no) ON DELETE CASCADE ON UPDATE CASCADE

);








CREATE TABLE Customer_Question_Product(
serial_no INT ,
customer_name VARCHAR(30) ,
question VARCHAR(500),
answer VARCHAR(500),
CONSTRAINT Customer_Question_Product_pk PRIMARY KEY(serial_no,customer_name),
CONSTRAINT question_product_fk FOREIGN KEY(serial_no) REFERENCES Product(serial_no)ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT question_customer_fk FOREIGN KEY(customer_name) REFERENCES Customer(username)ON DELETE NO ACTION ON UPDATE NO ACTION
);
-------------------------------------------------------------INSERTIONS
Insert into Users 
VALUES ('hana.aly','hana','aly','pass1','hana.aly@guc.edu.eg');

INSERT INTO Users (username, first_name, last_name, password, email)
VALUES('ammar.yasser','ammar','yasser','pass4','ammar.yasser@guc.edu.eg')

INSERT INTO Users (username, first_name, last_name, password, email)
VALUES('nada.sharaf','nada','sharaf','pass7','nada.sharaf@guc.edu.eg')

INSERT INTO Users (username, first_name, last_name, password, email)
VALUES( 'hadeel.adel','hadeel','adel' ,'pass13', 'hadeel.adel@guc.edu.eg')

---INSERT INTO Users (username, first_name, last_name, password, email)
--VALUES( 'mohamed.tamer', 'mohamed' ,'tamer' ,'pass16' ,'mohamed.tamer@guc.edu.eg')

INSERT INTO Admins
VALUES('hana.aly')

INSERT INTO Admins
VALUES('nada.sharaf')

--INSERT INTO Admins
--VALUES('sama.walid')

INSERT INTO Customer(username,points)
VALUES ('ammar.yasser',15)

INSERT INTO Vendor
VALUES( 'hadeel.adel','1' ,'Dello','47449349234','hana.aly')






SET IDENTITY_INSERT Product ON
INSERT INTO Product(serial_no,product_name,category,product_description,price,final_price,color,available,rate,vendor_username,customer_username,customer_order_id)
VALUES(1 ,'Bag' ,'Fashion', 'backbag' ,100, 100 ,'yellow' ,1 ,0 ,'hadeel.adel',NULL,NULL)
SET IDENTITY_INSERT Product OFF
SET IDENTITY_INSERT Product ON
INSERT INTO Product(serial_no,product_name,category,product_description,price,final_price,color,available,rate,vendor_username,customer_username,customer_order_id)
VALUES(2 ,'Blue pen' ,'stationary', 'useful pen' ,10 ,10, 'Blue' ,1, 0 ,'hadeel.adel',NULL,NULL)
SET IDENTITY_INSERT Product OFF
SET IDENTITY_INSERT Product ON
INSERT INTO Product(serial_no,product_name,category,product_description,price,final_price,color,available,rate,vendor_username,customer_username,customer_order_id)
VALUES(3 ,'Blue pen' ,'stationary' ,'useful pen' ,10 ,10 ,'Blue' ,0 ,0 ,'hadeel.adel',NULL,NULL)
SET IDENTITY_INSERT Product OFF



INSERT INTO CustomerAddstoCartProduct    ----LESSSSSAAAAAA 
VALUES(1 ,'ammar.yasser')



--INSERT INTO Delivery_Person(is_activated,username)
--VALUES(1, 'mohamed.tamer')

INSERT INTO User_Addresses
VALUES ('New Cairo' ,'hana.aly')

INSERT INTO User_Addresses
VALUES('Heliopolis', 'hana.aly')

INSERT INTO User_mobile_numbers
VALUES('01111111111' ,'hana.aly')

INSERT INTO User_mobile_numbers
VALUES('1211555411' ,'hana.aly')

INSERT INTO Credit_Card             --WE RUNNED THISS INSERTION
VALUES( '4444-5555-6666-8888', '10/19/2028', 232)

INSERT INTO Delivery(type,time_duration,fees)
VALUES('pick-up',7,10)

INSERT INTO Delivery(type,time_duration,fees)
VALUES('regular',14,30)

INSERT INTO Delivery(type,time_duration,fees)
VALUES('speedy',1,50)


SET IDENTITY_INSERT Todays_Deals ON
INSERT INTO Todays_Deals(deal_id,deal_amount,admin_username,expiry_date)
VALUES (1, 30, 'hana.aly', '11/30/2019')
SET IDENTITY_INSERT Todays_Deals OFF
SET IDENTITY_INSERT Todays_Deals ON
INSERT INTO Todays_Deals(deal_id,deal_amount,admin_username,expiry_date)
VALUES(2, 40 ,'hana.aly' ,'11/18/2019')
SET IDENTITY_INSERT Todays_Deals OFF
SET IDENTITY_INSERT Todays_Deals ON

INSERT INTO Todays_Deals(deal_id,deal_amount,admin_username,expiry_date)
VALUES (3 ,50 ,'hana.aly' ,'12/12/2019')
SET IDENTITY_INSERT Todays_Deals OFF

--INSERT INTO Todays_Deals(deal_id,deal_amount,admin_username,expiry_date)     SAMA WALID MSH FE TABLE EL USERS WALA ADMIN W HYA FOREIGN KEY FA SH HAYENFA3 TED5OL KEDA
--VALUES(4 ,10 ,'sama.walid' ,12/11/2019)

SET IDENTITY_INSERT offer ON;
INSERT INTO offer(offer_id,offer_amount,expiry_date)
VALUES(1 ,50 ,'11/30/2019');
SET IDENTITY_INSERT offer OFF;


INSERT INTO Wishlist
VALUES( 'ammar.yasser' ,'fashion')

--INSERT INTO Wishlist_Product  -- WON'T WORK REFERNECS NULL BEC NO SERIAL NO 2
--VALUES('ammar.yasser', 'fashion', 2)

 
--INSERT INTO Wishlist_Product   --insertion in [roduct kan fyha 1,3,4 as serial no bas 3'yrnaha 3ashanfyel testcase in product metl3ha 1,2,3 w hena fy serial no 4 referncing nothing yet??
--VALUES('ammar.yasser' ,'fashion', 4)

INSERT INTO Giftcard(code, expiry_date, amount)
VALUES('G101' ,'11/18/2019' ,100)

INSERT INTO Customer_CreditCard
VALUES( 'ammar.yasser' ,'4444-5555-6666-8888')



-----------------------------------PROC STARTS HERE----------------------------

go
CREATE PROC  customerRegister
@username VARCHAR(20),
@first_name VARCHAR(20),
@last_name VARCHAR(20),
@password  VARCHAR(20),
@email VARCHAR(50),
@success int output
AS
IF @username IS NULL or @first_name IS NULL or @last_name IS NULL or
@password IS NULL or @email IS NULL
print 'One of the inputs is null'
Else
BEGIN
  declare @count INT
   select @success=count(*)
   from Users
   where username=@username
  IF @success=1
  print 'User already exists'
  ELSE
  BeGIN
INSERT INTO Users(username, password, first_name, last_name, email)
VALUES(@username, @password, @first_name, @last_name, @email)
INSERT INTO Customer
VALUES (0,@username)
END
End
EXEC customerRegister'ahmed.ashraf','ahmed','ashraf','pass123','ahmed@yahoo.com'



go
CREATE PROC vendorRegister  
@username VARCHAR(20),
@first_name VARCHAR(20),
@last_name VARCHAR(20),
@password  VARCHAR(20),
@email VARCHAR(50),
@company_name VARCHAR(20),
@bank_acc_no  VARCHAR(20),
@success int output
AS
IF @username IS NULL or @first_name IS NULL or @last_name IS NULL or
@password IS NULL or @email IS NULL or @company_name IS NULL or @bank_acc_no IS NULL 
print 'One of the inputs is null'
Else
BEGIN
  declare @count INT
   select @success=count(*)
   from Users
   where username=@username

  if @success=0
  begin

INSERT INTO Users(username, password, first_name, last_name, email)
VALUES(@username, @password, @first_name, @last_name, @email)
INSERT INTO Vendor (username,activated,company_name,bank_acc_no,admin_username)
values(@username,0,@company_name,@bank_acc_no,null)
End
END

EXEC vendorRegister 'eslam.mahmod','eslam' , 'mahmod', 'pass1234','hopa@gmail.com','Market','132132513'

---------------------------------------UNREGESTERED CUSTOMER------------------------------------------


----------------------------------------REGESTERED CUSTOMER------------------------------------------
GO
CREATE PROC  userLogin
@username VARCHAR(20),
@password VARCHAR(20),
@Success INT OUTPUT,
@type INT OUTPUT,
@checkV bit output
AS
IF @username IS NULL or @password IS NULL  
print 'One of the inputs is null'
Else
BEGIN
  declare @count INT
   select @count=count(*)
   from Users
   where username=@username

   declare @pass VARCHAR(20)
   select @pass=password
   from Users
   where username=@username

   Declare @cust INT
   select @cust=count(*)
   from Customer
   where username=@username

   Declare @vend INT
   select @vend=count(*)
   from Vendor
   where username=@username
    
	Declare @admin INT
   select @admin=count(*)
   from Admins
   where username=@username
   --PRINT @admin

   Declare @delper INT
   select @delper=count(*)
   from Delivery_Person
   where username=@username



  IF @count=1  AND @pass=@password and @cust=1
  BEGIN
     SET @Success=1
	 SET @type=0
   END
  IF @count=1  AND @pass=@password and @vend=1
   BEGIN
   select @checkV=activated
   from Vendor
   where username=@username
     SET @Success=1
	 SET @type=1
	END
  IF @count=1  AND @pass=@password and @admin=1
  BEGIN
     SET @Success=1
	 SET @type=2
   END
  IF @count=1  AND @pass=@password and @delper=1
   BEGIN
     SET @Success=1
	 SET @type=3
	END
  IF ((@count=1  AND @pass!=@password)or @count=0 ) --IF USER WERE NOT FOUNT WHAT SHOULD I SET TYPE TO 
    BEGIN
     SET @Success=0
	 --SET @type=-1  
	END
	END

DECLARE @success int,@type INT 
EXEC userLogin 'rokaya','1234',@success OUTPUT,@type OUTPUT
PRINT @success
Print @type
go
CREATE PROC  addMobile    --should i consider the case that username is not in my databasse
@username varchar(20),   --zabatyy to check that it is in my data base
@mobile_number varchar(20),
@success int OUTPUT
AS
select @success=count(*)
from User_mobile_numbers
where username=@username and @mobile_number=mobile_number

IF @username IS NULL or @mobile_number IS NULL  
print 'One of the inputs is null'
ELSE
begin
If @success=0

insert into User_mobile_numbers
values(@mobile_number,@username)
end

EXEC addMobile 'ahmed.ashraf','01111211122'
EXEC addMobile 'ahmed.ashraf', '0124262652'
go 
CREATE PROC addAddress    --should i consider the case that username is not in my database
@username varchar(20),    --zabatyyy to check that it is in my data base
@address varchar(20)
AS
IF @username IS NULL or @address IS NULL  
print 'One of the inputs is null'
ELSE
begin
insert into User_Addresses
values(@address,@username)
end

EXEC addAddress  'ahmed.ashraf', 'nasr city'

----------------------------------------REGESTERED CUSTOMER------------------------------------------


----------------------------------------CUSTOMER------------------------------------------
go
CREATE PROC showProducts
AS
SELECT DISTINCT product_name,product_description,price,color        ---I ADDED EL ATTRIBUTES EL BAYNA FEL TESTS BAS (FINAL PRICE W PRICE DECIMALLLL NEED TO CHANGE)
FROM Product

EXEC showProducts

go 
CREATE PROC  ShowProductsbyPrice
AS 
SELECT DISTINCT product_name,product_description,price,color,final_price
FROM Product
ORDER BY price   --final price or price???         --ANA 5ALETHA PRICE 3ASHAN MAFEESH FINAL ASLUN

EXEC ShowProductsbyPrice 
go

CREATE PROC  searchbyname         --EL PRODUCT NAME BIEB2A BLUE PEN WEHNA 3AYZEN N SEARC B BLUE AW AY KELMA
@text VARCHAR(20)
AS

SELECT DISTINCT product_name,product_description,price,final_price,color
FROM Product
WHERE product_name LIKE '%'+ @text+' %'

EXEC searchbyname 'blue'

go
CREATE PROC AddQuestion
@serial int, 
@customer varchar(20), 
@Question varchar(50)
AS
INSERT INTO Customer_Question_Product
VALUES  (@serial,@customer,@Question,null);

EXEC AddQuestion 1,'ahmed.ashraf','size?'


GO
CREATE PROC ChooseCreditCard
--@creditcard varchar(20),
--@orderid int
--AS
--select order_no=@orderid
--FROM Orders
--WHERE creditCard_number= @creditcard

--EXEC ChooseCreditCard

@creditcard varchar(20),
@orderid int

AS
UPDATE ORDERS
SET creditCard_number=@creditcard
where order_no=@orderid

go
CREATE PROC  addToCart
@customername varchar(20),
@serial int,
@success int Output,
@prodexist int output,
@check int Output
AS
select @prodexist=count(*)
from Product
where @serial=serial_no

select @success=count(*)
from CustomerAddstoCartProduct
where customer_name=@customername and @serial=serial_no


SELECT @check=available
from Product 
where serial_no=@serial

if(@check=1 and @success=0 and @prodexist=1)
begin
INSERT INTO CustomerAddstoCartProduct  --do i have too change something that refrences it tooo??
VALUES(@serial,@customername)
end

EXEC addToCart 'ahmed.ashraf',1      --FEEH AMMAR KAN INSERTED MSH TALE3 FEL TESTS MEDAYE2 ROKAYA :(
EXEC addToCart 'ahmed.ashraf',2



go
CREATE PROC   removefromCart
@customername varchar(20),
@serial int,
@success int output
AS
select @success=count(*)
from CustomerAddstoCartProduct
where customer_name=@customername and @serial=serial_no

if @success=1
DELETE FROM CustomerAddstoCartProduct
WHERE serial_no=@serial and customer_name=@customername

EXEC removefromCart 'ahmed.ashraf',2
go
CREATE PROC  createWishlist
 @customername varchar(20),
 @name varchar(20),
 @success int Output
 AS
 select @success=count(*)
from Wishlist
where @customername=username and @name=name
 
 if @success=0
 INSERT INTO Wishlist
 Values (@customername,@name)

EXEC createWishlist  'ahmed.ashraf','fashion'

 go
go
CREATE PROC AddtoWishlist
@customername varchar(20),
@name varchar(20),
@serial int,
@success int Output,
@prodexist int output,
@check int Output
AS
select @prodexist=count(*)
from Product
where @serial=serial_no

select @success=count(*)
from Wishlist_Product
where username=@customername and @serial=serial_no


SELECT @check=available
from Product 
where serial_no=@serial

if(@check=1 and @success=0 and @prodexist=1)
begin
INSERT INTO Wishlist_Product(username,wish_name,serial_no)
VALUES(@customername,@name,@serial)
end

declare @a int 
declare @b int
declare @c int
EXEC AddtoWishlist 'rokaya','rokaya',1,@a output,@b  output,@c output
EXEC AddtoWishlist 'ahmed.ashraf','fashion',2



go
CREATE PROC removefromWishlist
@customername varchar(20),
@wishlistname varchar(20),
@serial int,
@success int output
AS
select @success=count(*)
from Wishlist_Product
where @customername=username and @wishlistname=wish_name and @serial=serial_no

if(@success=1)
DELETE FROM Wishlist_Product
WHERE username=@customername AND wish_name=@wishlistname AND serial_no=@serial

EXEC removefromWishlist 'ahmed.ashraf','fashion', 1

go
CREATE PROC showWishlistProduct
@customername varchar(20),
@name varchar(20),
@success int output
AS
select @success=count(*)
from Wishlist
where @customername=username and @name=name
if @success=1
begin
select P.product_name,P.product_description,P.price,P.final_price,P.color -- MESH HATFR2 HA SELECT EH
FROM Wishlist_Product WP 
INNER JOIN Product P on P.serial_no=WP.serial_no
WHERE WP.username=@customername AND WP.wish_name=@name
end
declare @success int
EXEC showWishlistProduct 'rokaya','rokaya',@success Output
print @success



go
CREATE PROC viewMyCart
@customer varchar(20)
AS
select P.product_name,P.product_description,P.price,P.final_price,P.color 
FROM CustomerAddstoCartProduct CACP
INNER JOIN Product P on P.serial_no= CACP.serial_no
WHERE CACP.customer_name=@customer

EXEC viewMyCart  'ahmed.ashraf'

go
CREATE PROC calculatepriceOrder

@customername varchar(20),

@sum DECIMAL(10,2) OUTPUT
AS
SELECT @sum = SUM(P.final_price)
FROM CustomerAddstoCartProduct CACP
INNER JOIN Product P on P.serial_no= CACP.serial_no
WHERE CACP.customer_name=@customername

GO
DECLARE @sum DECIMAL(10,2)
EXEC calculatepriceOrder 'ahmed.ashraf',@sum OUTPUT
print @sum
GO

go
CREATE PROC productsinorder   
@customername varchar(20),
@orderID int
AS
SELECT P.*
FROM CustomerAddstoCartProduct CACP 
INNER JOIN Product P on P.serial_no = CACP.serial_no
WHERE CACP.customer_name=@customername

UPDATE  Product 
SET available='0',customer_username=@customername,customer_order_id=@orderID
FROM CustomerAddstoCartProduct CACP2
INNER JOIN Product P1 on P1.serial_no =CACP2.serial_no
WHERE CACP2.customer_name=@customername

--IF(EXISTS( SELECT CACP.serial_no
--FROM CustomerAddstoCartProduct CACP 
--INNER JOIN Product P on P.serial_no = CACP.serial_no
--WHERE CACP.customer_name<>@customername AND CACP.serial_no IN (SELECT CACP.serial_no
--                      FROM CustomerAddstoCartProduct CACP 
--                      INNER JOIN Product P on P.serial_no = CACP.serial_no
--                       WHERE CACP.customer_name=@customername )
--)) --<> WALA !=

DELETE FROM CustomerAddstoCartProduct 
WHERE serial_no in(SELECT CACP.serial_no
                     FROM CustomerAddstoCartProduct CACP 
                     INNER JOIN Product P on P.serial_no = CACP.serial_no
                     WHERE CACP.customer_name=@customername)


EXEC PROproductsinorder 'ahmed.ashraf' ,2


go
CREATE PROC emptyCart
@customername varchar(20)
AS
DELETE FROM CustomerAddstoCartProduct  WHERE customer_name=@customername

go
drop proc makeOrder
go
CREATE PROC makeOrder
@customername varchar(20),
@sum decimal(10,2) output,
@ID int output,
@check int output
AS

DECLARE @count int
SELECT @count=COUNT(*)
from CustomerAddstoCartProduct
where customer_name=@customername

if (@count>0)
set @check='1'
else set @check='0'

if (@count>0)
begin
--DECLARE @sum DECIMAL(10,2)
EXEC calculatepriceOrder @customername,@sum OUTPUT

INSERT INTO Orders(total_amount,order_status,customer_name, order_date)
VALUES(@sum,'not processed',@customername,current_timestamp)  -- order date won;t be like test case how to get it?

--DECLARE @ID INT
SELECT @ID=MAX(order_no)
FROM Orders 
where customer_name=@customername


--print @ID
EXEC productsinorder  @customername, @ID
EXEC emptyCart @customername

end
drop proc makeOrder
EXEC makeOrder 'ahmed.ashraf'

go
CREATE PROC cancelOrder
@orderid int,
@customername varchar(20),
@check int output,

@status varchar(20) output,
@points int output
AS
--set @check='-1';
--set @status='not present';


IF(EXISTS(
SELECT *
FROM Orders O
WHERE O.order_no=@orderid and O.customer_name=@customername AND(O.order_status='in process' OR O.order_status='not processed')
))
BEGIN
set @check='1'

UPDATE Product  
SET available='1'
FROM Product  
WHERE customer_order_id=@orderid


--DECLARE @customername Varchar(30)
--SELECT @customername=O.customer_name
--FROM Orders O
--WHERE O.order_no=@orderid

UPDATE PRODUCT
SET customer_username=NULL, customer_order_id=NULL,rate=NULL
WHERE available='1'



DECLARE @amount DECIMAL(10,2),@cash DECIMAL(10,2),@credit DECIMAL(10,2)
DECLARE @expiry DATETIME
SELECT @amount =O.total_amount,@expiry=GF.expiry_date,@cash=O.cash_amount,@credit=O.credit_amount
FROM Orders O
INNER JOIN Giftcard GF ON GF.code=O.Gift_Card_code_used
WHERE O.order_no=@orderid


if @cash is null
set @cash=0
if @credit is null set @credit=0



IF(@expiry is not null and @expiry>CURRENT_TIMESTAMP)
BEGIN
update Orders
set cash_amount=0
where cash_amount is null

update orders
set credit_amount=0
where credit_amount is null
update customer
set points=0
where points is null

UPDATE Admin_Customer_Giftcard
Set remaining_points=remaining_points+ @amount-@cash-@credit
from Admin_Customer_Giftcard a inner join Orders o on o.Gift_Card_code_used=a.code
where a.customer_name=@customername and o.order_no=@orderid and  a.code=o.Gift_Card_code_used 
UPDATE Customer
SET points=points + @amount-@cash-@credit
where username=@customername
END
DELETE FROM Orders WHERE order_no=@orderid

END

else
begin

declare @count int
select @count= count (*)
                FROM Orders 
               WHERE order_no=@orderid and customer_name=@customername
if @count=0
set @check=0
else
begin

select @status=order_status
from Orders
where order_no=@orderid
end

end

update customer
set points=0
where points is null
select @points=points
from customer
where username=@customername

drop proc cancelOrder

EXEC addToCart 'ahmed.ashraf',1
EXEC makeOrder 'ahmed.ashraf'
exec cancelOrder 1


-------
-----------------RETURN PRODUCT GOES HERE-----------------------------------------------
GO
CREATE PROC returnProduct
@serialno int,
@orderid int
AS
BEGIN

UPDATE Product  
SET available='1'
FROM Product  
WHERE serial_no=@serialno

UPDATE PRODUCT
SET customer_username=NULL, customer_order_id=NULL,rate=NULL
WHERE available='1'



--DECLARE @expiry DATETIME
--SELECT @expiry=GF.expiry_date
--FROM Orders O
--INNER JOIN Giftcard GF ON GF.code=O.Gift_Card_code_used
--WHERE O.order_no=@orderid

DECLARE @customername Varchar(30)
SELECT @customername=O.customer_name
FROM Orders O
WHERE O.order_no=@orderid

DECLARE @amount DECIMAL(10,2),@cash DECIMAL(10,2),@credit DECIMAL(10,2)
DECLARE @expiry DATETIME
SELECT @amount =GF.amount,@expiry=GF.expiry_date,@cash=O.cash_amount,@credit=O.credit_amount
FROM Orders O
INNER JOIN Giftcard GF ON GF.code=O.Gift_Card_code_used
WHERE O.order_no=@orderid

UPDATE Orders
set total_amount=0
where order_no=@orderid

--DECLARE @credit DECIMAL(10,2)       --NE5ALEHOM DECIMAL?????????????
--DECLARE @cash DECIMAL(10,2)
--SELECT @credit=credit_amount,@cash=cash_amount
--FROM orders
--where order_no=@orderid

IF @credit IS NULL
BEGIN
SET @credit=0
UPDATE  orders
set credit_amount=0
where order_no=@orderid
END
if @cash is null
BEGIN
SET @cash=0
UPDATE  orders
set cash_amount=0
where order_no=@orderid
END

DECLARE @amount2 DECIMAL(10,2)
SET @amount2=@amount-@credit-@cash


IF(@expiry>CURRENT_TIMESTAMP)
BEGIN
UPDATE Customer
SET points=points + @amount-@cash-@credit
where username=@customername
UPDATE Admin_Customer_Giftcard
Set remaining_points=remaining_points+@amount-@cash-@credit
where customer_name=@customername

END
END



EXEC addToCart 'ahmed.ashraf',1
EXEC makeOrder 'ahmed.ashraf'
EXEC returnProduct4 1,11

GO

-----------------RETURN PRODUCT GOES HERE-----------------------------------------------
go
CREATE PROC ShowproductsIbought
@customername varchar(20)
AS
SELECT serial_no,product_name,category,product_description,price,final_price,color         
FROM Product 
WHERE customer_username=@customername
go

EXEC 


oCart 'ahmed.ashraf',1
EXEC makeOrder 'ahmed.ashraf'
EXEC cancelOrder  4
EXEC ShowproductsIbought 'ahmed.ashraf'
go
CREATE PROC rate
@serialno int,
@rate int ,
@customername varchar(20)

AS
UPDATE Product
SET rate=@rate
FROM Product p
where p.customer_username=@customername and p.serial_no=@serialno
go
EXEC rate 2,3,'ahmed.ashraf'
GO

CREATE PROC SpecifyAmount
@customername varchar(20),
@orderID int,
@cash decimal(10,2),
@credit decimal(10,2),
@remaining int output
AS
DECLARE @sum DECIMAL(10,2)
SELECT @sum=total_amount
from Orders
where order_no=@orderID

Update customer
SET points=0
from customer where points is null

IF(@cash is not NULL AND @cash<>0)
BEGIN
UPDATE Customer
set points=points-(@sum-@cash)
where username=@customername

UPDATE Admin_Customer_Giftcard
SET remaining_points=remaining_points-(@sum-@cash)
from Admin_Customer_Giftcard a inner join Orders o on o.Gift_Card_code_used=a.code
where a.customer_name=@customername and o.order_no=@orderID

UPDATE orders
set cash_amount=@cash,payment_type='cash'
where order_no=@orderID

END

IF(@credit is not NULL AND @credit<>0)
BEGIN
PRINT @sum
UPDATE Customer
set points=points-(@sum-@credit)
where username=@customername

UPDATE orders
set credit_amount=@credit,payment_type='credit'
where order_no=@orderID

UPDATE Admin_Customer_Giftcard
SET remaining_points=remaining_points-(@sum-@credit)
where customer_name=@customername
END

Select @remaining=points
from customer
where  username=@customername
go
drop proc SpecifyAmount
EXEC addToCart 'ahmed.ashraf',2
EXEC makeOrder 'ahmed.ashraf'
EXEC specifyAmount 'ahmed.ashraf',5,Null,10






go
CREATE PROC  AddCreditCard         --FE CUSTOMER NAME INPUT BAS MAFEESH FEL TEST F DO WE JUST INSERT F TABLE CREDIT CARD W DONT INSERT F CREDIT CARD CUSTOMER?//
@creditcardnumber varchar(20),
@expirydate date,
@cvv varchar(4),
@customername varchar(20),
@success int Output
AS
select @success=count(*)
from Credit_Card
where @creditcardnumber=number
if @success=0
begin
INSERT INTO Credit_Card(number,expiry_date,cvv_code)VALUES(@creditcardnumber,@expirydate,@cvv)
INSERT INTO Customer_CreditCard(customer_name,cc_number)VALUES(@customername,@creditcardnumber)
end

go


EXEC AddCreditCard '4444-5555-6666-8888','10-19-2028','232','ahmed.ashraf'
GO
CREATE PROC ChooseCreditCard
--@creditcard varchar(20),
--@orderid int
--AS
--select order_no=@orderid
--FROM Orders
--WHERE creditCard_number= @creditcard

--EXEC ChooseCreditCard

@creditcard varchar(20),
@orderid int

AS
UPDATE ORDERS
SET creditCard_number=@creditcard
where order_no=@orderid

exec ChooseCreditCard '4444-5555-6666-8888',3
GO

CREATE PROC viewDeliveryTypes
AS
select type,time_duration,fees
FROM Delivery

EXEC viewDeliveryTypes
go

CREATE PROC specifydeliverytype
@orderID int,
@deliveryID int
AS


DECLARE @days int
select @days=time_duration
from Delivery
where id=@deliveryID

UPDATE orders
SET delivery_id=@deliveryID,remaining_days=@days
WHERE order_no=@orderID

EXEC specifydeliverytype 5,1

go

CREATE PROC trackRemainingDays
 @orderid int,
 @customername varchar(20),
 @day INT OUTPUT
AS

declare @orderdate datetime
select  @orderdate=order_date
from Orders
where order_no=@orderid 

DECLARE @diff INT
set @diff=DATEDIFF(day,@orderdate, CURRENT_TIMESTAMP)  

DECLARE @timeforordertoarrive int
select @timeforordertoarrive=d.time_duration
from Delivery d inner join Orders o on o.delivery_id=d.id
where o.order_no=@orderid

set @day=@timeforordertoarrive-@diff
 UPDATE Orders
 SET remaining_days=@day
 WHERE order_no=@orderid and customer_name=@customername

 insert into Orders (order_date,customer_name,delivery_id)
 values('11/10/2019','ammar.yasser',2)

 declare @day int
 EXEC trackRemainingDays  6,'ammar.yasser',@day output
 print @day
 -------------------------RECOMMENT GOES HERE---------------------------------
 go
 CREATE proc Recommend1
 @customername varchar(20)
 as

SELECT top(3)p1.serial_no
from Wishlist_Product w inner join Product p1 on w.serial_no=p1.serial_no
where p1.category in(
                  SELECT top(3)p.category
                   from Product p inner join CustomerAddstoCartProduct c on p.serial_no=c.serial_no
                   where c.customer_name=@customername
                   GROUP by category
                   order by count(*) desc)
group by p1.serial_no
order by count(p1.serial_no) desc
 exec recommend1 'rokaya'
go
create proc recommend2
 @customername varchar(20)

----------------------------------------PART 2 CORECT-------
as

SELECT top(3)p1.serial_no
from Wishlist_Product w inner join Product p1 on w.serial_no=p1.serial_no
where w.username in(
SELECT top(3)c.customer_name
          from CustomerAddstoCartProduct c inner join CustomerAddstoCartProduct c2
           on c.serial_no=c2.serial_no
           where c.customer_name<>c2.customer_name and c2.customer_name=@customername
		   GROUP BY(C.customer_name)
		   ORDER BY COUNT(*) DESC

		   ) 
 group by p1.serial_no
order by count(*) desc
 exec recommend2 'rokaya'

go
 CREATE PROC recommend
 
 @customername varchar(20)
 AS
 DECLARE @TABLE1 Table (serial_no int ) 
 INSERT @TABLE1 EXEC RECOMMEND1 @customername
 DECLARE @TABLE2 Table (serial_no int ) 
 INSERT @TABLE2 EXEC recommend2 @customername

 SELECT P.*
 FROM(

   (SELECT * FROM @TABLE1
      UNION 
     SELECT* FROM @TABLE2 ) as temp

	  INNER JOIN Product p on p.serial_no=temp.serial_no)
	 
	 exec recommend 'rokaya'

 -------------------------RECOMMEND GOES HERE---------------------------------

 ----------------------------------------CUSTOMER------------------------------------------


 ----------------------------------------VENDOR------------------------------------------
 go
 CREATE PROC postProduct --SEIAL NO OF RODUCT IS NOT GIVEN SHOULD I MAKE IT IDENTITY?????--SHOULD I ALWAYS CHECK THAT INPUTS ARE NOT NULL
 @vendorUsername varchar(20),
 @product_name varchar(20),
 @category varchar(20),
 @product_description text,
 @price decimal(10,2),
 @color varchar(20)
 AS
 INSERT INTO Product (vendor_username,product_name,category,product_description,price,final_price,color,available)
 VALUES(@vendorUsername,@product_name,@category,@product_description,@price,@price,@color,1)

 EXEC postProduct 'eslam.mahmod',  'pencil','stationary', 'HB0.7', 10, 'red'
go 
CREATE PROC  vendorviewProducts
@vendorname varchar(20),
@check int output
AS
SELECT *
FROM Product
WHERE vendor_username=@vendorname

select @check= count(*)
from Product
WHERE vendor_username=@vendorname

EXEC  vendorviewProducts  'eslam.mahmod'

go
CREATE PROC EditProduct
@vendorname varchar(20)=NULL,
@serialnumber INT,
@product_name varchar(20)=NULL ,
@category varchar(20) = NULL,
@product_description VARCHAR(100)=NULL ,
@price decimal(10,2)=NULL,
@color varchar(20)=NULL
AS
DECLARE @VN varchar(20)
DECLARE @AV1 BIT
DECLARE @PN1 VARCHAR(20)
DECLARE @CAT1 VARCHAR(20)
DECLARE @PD1 VARCHAR(100)
DECLARE @PR1 decimal(10,2)
DECLARE @COL1 varchar(20)
SELECT @VN=P.vendor_username,@AV1=P.available,@PN1=P.product_name,@CAT1=P.category,@PD1=P.product_description,@PR1=P.price,@COL1=P.color
FROM PRODUCT P
WHERE P.serial_no=@serialnumber
IF( @vendorname IS NOT NULL)
BEGIN
 SET @VN=@vendorname
 END
IF( @product_name IS NOT NULL)
BEGIN
 SET @PN1=@product_name
  END
IF( @category IS NOT NULL)
BEGIN
 SET @CAT1=@category
  END
IF( @product_description IS NOT NULL)
BEGIN
 SET @PD1 =@product_description
  END
IF(@price  IS NOT NULL)
BEGIN
 SET @PR1 =@price  
  END
IF(@color IS NOT  NULL)
BEGIN
 SET  @COL1 =@color
 END
 DELETE FROM Product
WHERE serial_no=@serialnumber

SET IDENTITY_INSERT  Product ON ;
INSERT INTO Product (vendor_username,serial_no,product_name,category,product_description,final_price,price,color,available)
VALUES  (@VN,@serialnumber,@PN1,@CAT1,@PD1,@PR1,@PR1,@COL1,@AV1)
SET IDENTITY_INSERT  Product OFF ;


EXEC EditProduct @vendorname = 'eslam.mahmod',@serialnumber= 4,@color='blue'

go
CREATE PROC deleteProduct
@vendorname varchar(20),
@serialnumber int
AS
DELETE FROM Product WHERE vendor_username=@vendorname AND serial_no=@serialnumber
 
EXEC  deleteProduct 'eslam.mahmod' ,4

go

CREATE PROC viewQuestions
@vendorname varchar(20)
AS
SELECT q.*
FROM Product p inner join Customer_Question_Product q on p.serial_no=q.serial_no
WHERE p.vendor_username=@vendorname

EXEC viewQuestions 'hadeel.adel'






go



CREATE PROC answerQuestions
@vendorname varchar(20),
@serialno int,
@customername varchar(20),
@answer text

AS
UPDATE Customer_Question_Product 
SET answer=@answer

FROM Customer_Question_Product q  
inner join Product p on q.serial_no=p.serial_no
where p.vendor_username=@vendorname AND p.serial_no=@serialno AND q.customer_name=@customername
go
exec answerQuestions 'hadeel.adel',1,'ahmed.ashraf','50'
go
CREATE PROC addOffer
@offeramount int,
@expiry_date datetime

AS
INSERT INTO offer(offer_amount, expiry_date)
VALUES( @offeramount,@expiry_date)

EXEC addOffer 20,'1/1/2020'
Exec addOffer 30,'11/20/2019'

INSERT INTO offersOnProduct
VALUES(4,1)
go
CREATE PROC checkOfferonProduct
@serial int,
@activeoffer bit OUTPUT
AS
IF (exists(SELECT * FROM offersOnProduct WHERE serial_no=@serial))
SET @activeoffer='1'
else
SET @activeoffer='0'
go
DECLARE @av BIT 
EXec checkOfferonProduct 9 ,@av OUTPUT
PRINT @av

insert into offer values (100,'11/1/1999')
insert into offersOnProduct values(3,1)
GO
CREATE PROC checkandremoveExpiredoffer
@offerid int,
@output int output,
@count int output
AS
declare @date datetime
DECLARE @amount DECIMAL(10,2)
select @amount=offer_amount
from offer
where offer_id=@offerid
update Product
set final_price=final_price+@amount
where serial_no in(select op.serial_no
                    FROM offersOnProduct op
                    WHERE op.offer_id in(select o.offer_id
                                      FROM offer o
                                      WHERE o.offer_id=@offerid and expiry_date<CURRENT_TIMESTAMP))


DELETE
FROM offersOnProduct
WHERE offer_id in(select offer_id
                  FROM offer
                  WHERE offer_id=@offerid AND expiry_date<CURRENT_TIMESTAMP)

DELETE
FROM offer
WHERE offer_id=@offerid AND expiry_date<CURRENT_TIMESTAMP

 select @date=expiry_date
    from offer o
where o.offer_id=@offerid

if(@date > CURRENT_TIMESTAMP)
 set  @output=0 


 select @count =count(*)
 from offer
 where @offerid=offer_id
			GO						 
insert into Product values('Bag','Fashion','backbag',100,100,'yellow','True',0,NULL,'hadeel.adel',NULL)
insert into offersOnProduct values(1,6)
EXEC checkandremoveExpiredoffer 4
go

CREATE PROC applyOffer
@vendorname varchar(20),  
@offerid int,
@serial int,
@output bit output     -------- mariam added an output
AS
declare @cnt INT
SET @cnt=0
declare @cntmax Int
select @cntmax=MAX(o.offer_id)
from offer o


WHILE @cnt < @cntmax
BEGIN
   EXEC checkandremoveExpiredoffer @cnt
   SET @cnt = @cnt + 1;
END;


DECLARE @check BIT

EXEC checkOfferonProduct @serial,@check OUTPUT


if @check='0'

INSERT INTO offersOnProduct
VALUES(@offerid,@serial)

if @check='0'
DECLARE @discount INT
SELECT @discount=o.offer_amount
FROM offer o  inner join offersOnProduct op on o.offer_id=op.offer_id
where o.offer_id=@offerid and op.serial_no=@serial

if @check='0'
UPDATE Product
SET final_price=price-@discount
where Product.vendor_username=@vendorname and Product.serial_no=@serial

set @output=@check

EXEC applyOffer  'hadeel.adel',4,8







----------------------------------------VENDOR------------------------------------------

----------------------------------------ADMIN------------------------------------------
go
CREATE PROC activateVendors
@admin_username varchar(20),
@vendor_username varchar(20),
@check int OUTPUT,
@checkactivated int output
AS
set @check=0
select @check=count(*)
from Vendor
where username=@vendor_username

select @checkactivated=count(*)
from Vendor
where username=@vendor_username AND activated='1'

if(@check=1)
UPDATE Vendor
SET activated='1',admin_username=@admin_username
FROM Vendor v
WHERE v.username=@vendor_username


EXEC activateVendors  'hana.aly', 'eslam.mahmod'

go

CREATE PROC inviteDeliveryPerson
@delivery_username varchar(20),
@delivery_email varchar(50)
AS

INSERT INTO Users (username,email)
VALUES(@delivery_username,@delivery_email)

INSERT INTO Delivery_Person(username,is_activated)   
VALUES (@delivery_username,'0')


go
--EXEC inviteDeliveryPerson  ​'mohamed.tamer' , '​moha@gmail' 

go
CREATE PROC reviewOrders   
AS
SELECT *
FROM Orders

EXEC reviewOrders


GO
CREATE PROC updateOrderStatusInProcess
@order_no int,
@checkorder INT output,
@checkupdated Int output
AS
select @checkorder=count(*)
From Orders O
where O.order_no=@order_no

select @checkupdated=count(*)
From Orders O
where O.order_no=@order_no AND O.order_status='in process'

UPDATE Orders
SET order_status='in process'
WHERE order_no=@order_no

EXEC updateOrderStatusInProcess 3
go

 CREATE PROC addDelivery
@delivery_type varchar(20), --the id is MADE IN THE TABLE IDENTIY SO AUTOMATICALLY GENERATED IN EACH ROW
@time_duration int,
@fees decimal(5,3),
@admin_username varchar(20)
AS
INSERT INTO Delivery(type,time_duration,fees,username) VALUES(@delivery_type,@time_duration,@fees,@admin_username)
EXEC addDelivery 'pick-up' ,  7 , 10 , 'hana.aly'

go

CREATE PROC assignOrdertoDelivery 
@delivery_username varchar(20),
@order_no int,
@admin_username varchar(20)
AS
INSERT INTO Admin_Delivery_Order(delivery_username,order_no,admin_username) Values (@delivery_username,@order_no,@admin_username)

EXEC  assignOrdertoDelivery 'mohamed.tamer',7,'hana.aly'
go
CREATE PROC createTodaysDeal
@deal_amount INT,-- I MADE DEALID N TODAYS'S DEAL IDENTITY
@admin_username varchar(20),
@expiry_date datetime
AS
INSERT INTO Todays_Deals(deal_amount,expiry_date,admin_username)VALUES (@deal_amount,@expiry_date,@admin_username)


EXEC createTodaysDeal 30 ,'hana.aly','11-20-2019'




	go
CREATE PROC checkTodaysDealOnProduct
@serial_no INT,
@activeDeal BIT OUTPUT
AS


IF(Exists(SELECT* FROM Todays_Deals_Product TDP WHERE  TDP.serial_no =@serial_no))

set @activeDeal='1'  --not sure between '' or not
ELSE
set @activeDeal='0'


DECLARE @activeDeal BIT

EXEC checkTodaysDealOnProduct 8, @activeDeal OUTPUT
print @activeDeal


go
go
CREATE PROC addTodaysDealOnProduct   
@deal_id INT,
@serial_no int,
@checkdeal  INT OUTPUT,
@checkifdealfound INT OUTPUT,
@checkserialfound INT OUTPUT
AS
DECLARE @activeDeal BIT
EXEC checkTodaysDealOnProduct @serial_no,@activeDeal OUTPUT
--PRINT @activeDeal
set @checkdeal=@activeDeal
SELECT @checkifdealfound=count(*)
from Todays_Deals
WHERE deal_id=@deal_id

select @checkserialfound=count(*)
From Product p
where p.serial_no=@serial_no

IF @activeDeal='0' AND @checkifdealfound='1' AND @checkserialfound='1'
BEGIN
INSERT INTO Todays_Deals_Product Values(@deal_id,@serial_no) 
UPDATE Product
set final_price=price-(price*d.deal_amount/100)
from Product p inner join Todays_Deals_Product t on p.serial_no=t.serial_no
inner join Todays_Deals d on d.deal_id=@deal_id
END
EXEC addTodaysDealOnProduct   1,2
--CREATE PROC addTodaysDealOnProduct   
--@deal_id INT,
--@serial_no int
--AS
--DECLARE @activeDeal BIT
--EXEC checkTodaysDealOnProduct @serial_no,@activeDeal OUTPUT

--IF @activeDeal='0'
--INSERT INTO Todays_Deals_Product Values(@deal_id,@serial_no) 


--EXEC addTodaysDealOnProduct   5,8

go

CREATE PROC removeExpiredDeal  
@deal_iD int,
@checkexpired int Output,
@checkdate int output
AS
Select @checkexpired=COUNT(*)
From Todays_Deals 
WHERE deal_id=@deal_iD
select @checkdate=count(*)
From Todays_Deals TD
WHERE TD.deal_id=@deal_iD AND TD.expiry_date<CURRENT_TIMESTAMP
DELETE FROM Todays_Deals WHERE  expiry_date<CURRENT_TIMESTAMP  AND deal_id=@deal_iD



--DROP PROC removeExpiredDeal
EXEC removeExpiredDeal 4
go


CREATE PROC createGiftCard
@code varchar(10),
@expiry_date  datetime,
@amount int,
@admin_username varchar(20)

AS 
INSERT INTO Giftcard(code,expiry_date,amount,username)Values(@code,@expiry_date,@amount,@admin_username)

EXEC createGiftCard 'G103' , '11-30-2019' ,100,'hana.aly'
--DROP PROC createGiftCard

go

CREATE PROC removeExpiredGiftCard
@code varchar(10)
AS

Declare @expiry datetime
select @expiry=expiry_date
from Giftcard
where code=@code 

update Customer 
SET points=points-a.remaining_points
from customer c inner join Admin_Customer_Giftcard a on a.customer_name=c.username
inner join Giftcard g on g.code=a.code
where a.code=@code and g.expiry_date<CURRENT_TIMESTAMP


DELETE FROM Admin_Customer_Giftcard
from  Admin_Customer_Giftcard a inner join Giftcard g on g.code=a.code
where a.code=@code and g.expiry_date<CURRENT_TIMESTAMP

if(@expiry<CURRENT_TIMESTAMP)
begin
UPDATE Orders
SET Gift_Card_code_used=NULL
where Gift_Card_code_used=@code
end

DELETE FROM Giftcard
where code=@code and  expiry_date<CURRENT_TIMESTAMP


exec removeExpiredGiftCard 'G102'

--CREATE PROC removeExpiredGiftCard

--@code varchar(10)
--AS



--DECLARE @points int
--SELECT @points=SUM(remaining_points)
--FROM Admin_Customer_Giftcard 
--WHERE code=@code



--DECLARE @customername VARCHAR(30)
--SELECT @customername=ACG.customer_name
--FROM Admin_Customer_Giftcard ACG
--WHERE ACG.code=@code


--UPDATE Customer
--set points=points - @points
--WHERE Customer.username=@customername
--DELETE FROM Giftcard WHERE code=@code AND expiry_date<CURRENT_TIMESTAMP 

--EXEC removeExpiredGiftCard G102





go

CREATE PROC checkGiftCardOnCustomer
@code VARCHAR(10),
@activeGiftCard BIT OUTPUT
AS


IF(Exists(SELECT* FROM Admin_Customer_Giftcard adc WHERE  adc.code=@code))

set @activeGiftCard= '1'
ELSE
set @activeGiftCard= '0'
go

DECLARE @activeGiftCard BIT

EXEC checkGiftCardOnCustomer'G10' , @activeGiftCard OUTPUT
print @activeGiftCard

GO
DECLARE @activeGiftCard BIT
EXEC checkGiftCardOnCustomer'G102' , @activeGiftCard OUTPUT
print @activeGiftCard

declare @x int
Exec checkGiftCardOnCustomer 'G111'  ,@x OUTPUT
print @x
go

go
CREATE proc  giveGiftCardtoCustomer


@code varchar(10),
@customer_name varchar(20),
@admin_username varchar(20)
AS
DECLARE @activeGiftCard BIT
if(exists(select * from Admin_Customer_Giftcard where customer_name=@customer_name))
set @activeGiftCard='1'
else
set @activeGiftCard='0'


IF @activeGiftCard='0'
BEGIN
DECLARE @remainingpoints int
SELECT @remainingpoints=amount
FROM Giftcard gf
WHERE gf.code=@code

INSERT INTO Admin_Customer_Giftcard(code,customer_name,admin_username,remaining_points)
Values (@code,@customer_name,@admin_username,@remainingpoints)

DECLARE @points int
SELECT @points=remaining_points
FROM Admin_Customer_Giftcard 
WHERE customer_name=@customer_name and code=@code

Update Customer
seT points=0
from Customer
where username=@customer_name and points is null




UPDATE Customer
set points=points+@points
WHERE username=@customer_name
end


EXEC giveGiftCardtoCustomer 'G101','ammar.yasser','hana.aly'


EXEC giveGiftCardtoCustomer 'G102','ahmed.ashraf','hana.aly'



----------------------------------------ADMIN------------------------------------------
----------------------------------------DELEVERYY PERSON------------------------------------------
GO
CREATE PROC acceptAdminInvitation 
@delivery_username varchar(20)
AS
 
 UPDATE Delivery_Person
SET is_activated = 1

FROM Delivery_Person D
WHERE D.username = @delivery_username




EXEC acceptAdminInvitation  'mohamed.tamer'

GO
CREATE PROC deliveryPersonUpdateInfo
@username varchar(20),
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50)
AS
UPDATE Users 
SET first_name=@first_name, last_name=@last_name, password=@password, email=@email
WHERE  Users.username =@username

EXEC deliveryPersonUpdateInfo 'mohamed.tamer', 'mohamed' ,'tamer', 'pass16',
'mohamed.tamer@guc.edu.eg'


GO
CREATE PROC viewmyorders
@deliveryperson varchar(20)
--@order_no int

AS 


SELECT O.*
FROM Orders O
INNER JOIN Admin_Delivery_Order ADO ON ADO.order_no=O.order_no
WHERE ADO.delivery_username=@deliveryperson

EXEC viewmyorders 'mohamed.tamer'









GO
CREATE PROC specifyDeliveryWindow
@delivery_username varchar(20),
@order_no int,
@delivery_window varchar(50)

AS
UPDATE Admin_Delivery_Order

SET delivery_window=@delivery_window

FROM Admin_Delivery_Order ADO
WHERE ADO.delivery_username=@delivery_username  AND ADO.order_no=@order_no


EXEC specifyDeliveryWindow 'mohamed.tamer',5 ,'Today between 10 am and 3 pm'

GO
CREATE PROC updateOrderStatusOutforDelivery

@order_no int
AS
UPDATE Orders
SET order_status = 'out for delivery'
where order_no=@order_no
EXEC updateOrderStatusOutforDelivery 2
GO
 CREATE PROC updateOrderStatusDelivered
 @order_no int
AS
UPDATE Orders
SET order_status = 'delivered'
where order_no=@order_no
EXEC updateOrderStatusDelivered 2



INSERT INTO Delivery_Person VALUES('nada.sharaf',0)

set identity_insert product on
insert into Product(serial_no,category)
values(14,'D')
set identity_insert product off

insert into CustomerAddstoCartProduct
values(3,'sandy')

insert into Wishlist values('sandy','s1')


insert into Wishlist_Product values ('sandy','s1',3)

go



insert into Product (product_name,product_description,price,final_price,color,available)
values('chips','bad','10','5','red',1)

exec addToCart 'ahmed.ashraf',1
exec addToCart 'ahmed.ashraf',2

exec viewMyCart 'hana.aly'


truncate table Product
truncate table Delivery

exec AddtoWishlist 'ahmed.ashraf' ,'fashion',2

exec showWishlistProduct 'ahmed.ashraf','fashion'

insert into users (username,password)
values('moh','samy')

insert into admins 
values ('moh')

truncate table customer

