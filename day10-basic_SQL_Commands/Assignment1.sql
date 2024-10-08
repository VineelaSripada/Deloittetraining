CREATE DATABASE ShoppingCartDb;
USE ShoppingCartDb;
--Creating Users Table
CREATE TABLE USERS(
 USERID  INT NOT NULL ,
 USERNAME VARCHAR(80),
 USERPASSWORD VARCHAR(60),
 CONTACTNUMBER VARCHAR(30) ,
 CITY VARCHAR(40),
 CONSTRAINT PK_USERS_USERID PRIMARY KEY(USERID)
 )
 --DROP TABLE USERS
 --inserting values
 INSERT INTO USERS VALUES (1, 'Anjali ', 'anjaliPass987', 9123456701, 'hyderabad');
 INSERT INTO USERS VALUES (2, 'Priya ', 'securePass456', 9123456780, 'Delhi');
 INSERT INTO USERS VALUES (4, 'Sneha ', 'snehaPass321', 9871234567, 'Ahmedabad');
 INSERT INTO USERS VALUES
(8, 'Amit Sharma', 'password123', 9876543210, 'Mumbai'),
(3, 'Rahul Verma', 'myPassword789', 9988776655, 'Bangalore'),
(5, 'Vikram Rao', 'vikramPwd654', 9765432109, 'Hyderabad');

SELECT * FROM USERS;



--CREATE PRODUCTS TABLE

CREATE TABLE PRODUCTS(
ProductId INT NOT NULL,
ProductName VARCHAR(50),
Quantity INT NOT NULL,
UnitPrice INT NOT NULL,
Category VARCHAR(50),
CONSTRAINT PK_PRODUCTS_PRODUCTID PRIMARY KEY(PRODUCTID),
CONSTRAINT CHK_PRODUCTS_QUANTITY CHECK(QUANTITY>0),
CONSTRAINT CHK_PRODUCTS_UNITPRICE CHECK(UNITPRICE>0),
)

SELECT * FROM PRODUCTS;
--inserting values
INSERT INTO PRODUCTS (ProductId, ProductName, Quantity, UnitPrice, Category)
VALUES (1, 'Laptop', 10, 800, 'Electronics');
INSERT INTO PRODUCTS (ProductId, ProductName, Quantity, UnitPrice, Category)
VALUES (2, 'Smartphone', 25, 600, 'Electronics');
INSERT INTO PRODUCTS (ProductId, ProductName, Quantity, UnitPrice, Category)
VALUES (4, 'Notebook', 50, 5, 'Stationery');
INSERT INTO PRODUCTS (ProductId, ProductName, Quantity, UnitPrice, Category)
VALUES (5, 'Water Bottle', 30, 15, 'Accessories');
INSERT INTO PRODUCTS (ProductId, ProductName, Quantity, UnitPrice, Category)
VALUES (6, NULL, 40, 15, 'Accessories');

INSERT INTO PRODUCTS (ProductId, ProductName, Quantity, UnitPrice, Category)
VALUES (7, 'Water Bottle', NULL, 15, 'Accessories');--GIVES [COLUMN DOES NOT ALLOW NULLS] ERROR
INSERT INTO PRODUCTS VALUES (8, 'HairPins', 30, 0, 'Accessories');--CHECK CONSTRAINT CONFLICTED ERROR
INSERT INTO PRODUCTS VALUES (3, 'Compass', 30, 1800, 'Accessories')
INSERT INTO PRODUCTS VALUES (9, 'Ipad', 60, 8000, 'Electronics')

--CREATE CART TABLE
CREATE TABLE CART(
 ID  INT NOT NULL ,
 CARTID INT NOT NULL,
 PRODUCTID INT,
 CARTQUANTITY INT,
 
 CONSTRAINT PK_CART_ID PRIMARY KEY(ID),
 CONSTRAINT FK_CART_PRODUCTID FOREIGN KEY(PRODUCTID)
 REFERENCES PRODUCTS(PRODUCTID)
 )
--INSERTING VALUES
 INSERT INTO CART (ID, CARTID, PRODUCTID, CARTQUANTITY) VALUES
(1, 101, 1, 2),  -- Laptop
(2, 102, 2, 1),  -- Smartphone
(3, 103, 4, 4),  -- Desk Chair
(4, 104, 4, 10), -- Notebook
(5, 105, 5, 3);  -- Water Bottle
INSERT INTO CART VALUES (6, 101, 5, 3),(7, 103, 4, 4)
--------------------------------------------------------------------
--PRODUCTS TABLE QUERIES---

SELECT * FROM PRODUCTS

SELECT * FROM PRODUCTS WHERE CATEGORY='ELECTRONICS'

SELECT * FROM PRODUCTS WHERE QUANTITY=0

SELECT * FROM PRODUCTS WHERE UnitPrice BETWEEN 1000 AND 10000

SELECT * FROM PRODUCTS WHERE ProductId=9

--CART TABLE QUERIES--

SELECT * FROM CART WHERE CARTID=101

SELECT CARTID,PRODUCTNAME FROM CART C,PRODUCTS P WHERE C.PRODUCTID=P.PRODUCTID 

--USERS TABLE QUERIES--

SELECT * FROM USERS

SELECT * FROM USERS WHERE CONTACTNUMBER='9876543210'

SELECT * FROM USERS WHERE USERID=2




