--2. Write a Query to display the results from the above two tables:CartId,  ProductName, Quantity, UnitPrice

SELECT CartId,  ProductName, Quantity, UnitPrice FROM CART  INNER JOIN PRODUCTS  ON  CART.PRODUCTID=PRODUCTS.ProductId


SELECT * FROM CART
SELECT * FROM PRODUCTS
INSERT INTO PRODUCTS (ProductId, ProductName, Quantity, UnitPrice, Category)
VALUES 
(18, 'Laptop', 10, 800, 'Electronics')
SELECT CartId,  ProductName, Quantity, UnitPrice FROM CART FULL OUTER JOIN PRODUCTS  ON  CART.PRODUCTID=PRODUCTS.ProductId
SELECT CartId,  ProductName, Quantity, UnitPrice FROM CART  CROSS JOIN PRODUCTS  --ON  CART.PRODUCTID=PRODUCTS.ProductId
SELECT CartId,  ProductName, Quantity, UnitPrice FROM CART RIGHT OUTER JOIN PRODUCTS  ON  CART.PRODUCTID=PRODUCTS.ProductId

--CREATE STUDENT TABLE--
CREATE TABLE Student (
    StudentId INT NOT NULL,
    StudentName VARCHAR(50),
    CourseName VARCHAR(60),
    CityName VARCHAR(50),
    CONSTRAINT PK_Student_StudentId PRIMARY KEY(StudentId)
)
INSERT INTO Student VALUES
(1, 'Ravi', 'Computer Science', 'Hyderabad'),
(2, 'Sita', 'Mechanical Engineering', 'Warangal'),
(3, 'Rajesh', 'Electrical Engineering', 'Nizamabad'),
(4, 'Lakshmi', 'Civil Engineering', 'Karimnagar'),
(5, 'Venkatesh', 'Information Technology', 'Khammam'),
(6, 'Anjali', 'Biotechnology', 'Mahbubnagar'),
(7, 'Praveen', 'Chemical Engineering', 'Nalgonda'),
(8, 'Kiran', 'Electronics and Communication', 'Adilabad'),
(9, 'Swapna', 'Pharmacy', 'Siddipet'),
(10, 'Manoj', 'Business Administration', 'Ramagundam');

INSERT INTO Student (StudentId, StudentName, CourseName, CityName) VALUES
(11, 'Mahalaxmi', 'Angular', 'Hyderabad'),
(12, 'Vaishali', 'Angular', 'Warangal')
--QUERIES ON STUDENT TABLE--
SELECT * FROM STUDENT WHERE CourseName='ANGULAR'
SELECT * FROM STUDENT WHERE CityName='HYDERABAD'

SELECT CITYNAME AS CITY, COUNT(*) FROM STUDENT GROUP BY CityName

SELECT COURSENAME AS COURSE, COUNT(*) FROM STUDENT GROUP BY CourseName
SELECT COURSENAME AS COURSE,CITYNAME AS CITY, COUNT(*) AS COUNT FROM STUDENT GROUP BY CourseName,CityName ORDER BY CourseName

SELECT * FROM PRODUCTS P WHERE EXISTS(SELECT * FROM CART C WHERE C.PRODUCTID=P.ProductId)

--2.3.  Prepare the sql queries for the following requirements (use subqueries):	
			--a.   Display the products if any items exists in the cart table
			--b.   Display the cart items whoe product price greater than 5000 
SELECT CARTID,CARTQUANTITY,PRODUCTNAME FROM CART C,PRODUCTS P WHERE 
C.PRODUCTID=P.ProductId AND C.PRODUCTID IN(SELECT PRODUCTID FROM PRODUCTS WHERE UnitPrice>500)
