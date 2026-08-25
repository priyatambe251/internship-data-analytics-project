use practical;
SELECT * FROM CLIENT_MASTER;
SELECT * FROM PRODUCT_MASTER;
SELECT * FROM SMAN_MAST;

#Q1.Find out the names of all clients
SELECT NAME 
FROM CLIENT_MASTER;

#Q2.Retrive the entire contents of client_master table
SELECT * FROM 
PRACTICAL.CLIENT_MASTER;

#Q3.Retrive the list of names ,city and the state of all clients
SELECT NAME,CITY,STATE 
FROM CLIENT_MASTER;

#Q4.list the variois roduct available from the product_master table
SELECT DESCRIPTION
 FROM PRODUCT_MASTER;
 
#Q5.list the clients located in mumbai
SELECT * 
FROM CLIENT_MASTER
 WHERE CITY="MUMBAI";
 
#Q6.Find the names of salesman who have salary equal to Rs 3000
SELECT SALESMANNAME
 FROM SALESMAN_MASTER
 WHERE SALAMT=3000;
 
#Q7.Change the city of client_no "C00005" TO "Banglore"
UPDATE CLIENT_MASTER 
SET CITY="BANGLORE"
 WHERE CLIENTNO="C00005";
 
#8.Change the cost price of "Trousers" to RS 950.00
UPDATE PRODUCT_MASTER
 SET COSTPRICE = 950.00
 WHERE DESCRIPTION='USB Hub';
 
#Q9.Change the city of the salesman to Pune.
UPDATE SALESMAN_MASTER 
SET CITY= "PUNE";

#Q10.Delete all salesmen from the Salesman_Master whose salaries are equal to Rs. 3500
DELETE FROM SALESMAN_MASTER
 WHERE SALAMT=3500;
 
#Q11.Delete all products from the Product_master where the quantity on hand is equal to 100.
DELETE FROM PRODUCT_MASTER
 WHERE QTYONHAND = 100;
 
#Q12.Delete all products from the Product_master where the quantity on hand is equal to 100.
DELETE FROM CLIENT_MASTER 
WHERE CITY="TAMclient_masterILNADU";

#Q13.Add a column called Telephone of datatype number and size 10 to Client_master table
ALTER TABLE CLIENT_MASTER 
ADD COLUMN TELEPHONE bigint ;

#Q14.Change the size of sell price column in Product_master table to (10,2)
ALTER TABLE PRODUCT_MASTER 
MODIFY COLUMN SELLPRICE DECIMAL(10,2);

#Q15.Change the name of Saleman_master table to sman_mast
ALTER TABLE SALESMAN_MASTER 
RENAME SMAN_MAST;

#Q16.Destroy the table Client_Master along with its data
DROP TABLE CLIENT_MASTER;

#_practical 2
CREATE TABLE SALES_ORDER(
ORDERNO VARCHAR(6) PRIMARY KEY,
CHECK (ORDERNO LIKE 'O%'),
CLIENTNO VARCHAR(6),
FOREIGN KEY (CLIENTNO) REFERENCES CLIENT_MASTER(CLIENTNO),
ORDERDATE DATE NOT NULL,
DELYADDR VARCHAR(25),
SALESMANNO VARCHAR(6),
foreign key (SALESMANNO) REFERENCES SMAN_MAST(SALESMANNO),
DELYTYPE CHAR(1) DEFAULT 'F',
CHECK (DELYTYPE IN ('P','F')),
BILLYN CHAR(1),
DELYDATE DATE ,
CHECK (DELYDATE > ORDERDATE),
ORDERSTATUS VARCHAR(10) ,
CHECK (ORDERSTATUS IN ('In Process', 'Fulfilled',
'BackOrder','Cancelled'))
);

INSERT INTO Sales_Order
  (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES
  ('O00001', 'C00001', '2026-01-10', '12 MG Road, Mumbai',       'S00002', 'F', 'Y', '2026-01-15', 'Fulfilled'),
  ('O00002', 'C00002', '2026-01-12', '45 Park Street, Kolkata',   'S00002', 'P', 'N', '2026-01-20', 'In Process'),
  ('O00003', 'C00003', '2026-02-05', '7 Brigade Road, Bangalore', 'S00003', 'F', 'Y', '2026-02-10', 'Fulfilled'),
  ('O00004', 'C00004', '2026-02-18', '22 Anna Salai, Chennai',    'S00004', 'P', 'N', '2026-02-25', 'BackOrder'),
  ('O00005', 'C00005', '2026-03-01', '9 Connaught Place, Delhi',  'S00005', 'F', 'Y', '2026-03-08', 'Cancelled');
  
INSERT INTO Sales_Order_Details
  (OrderNo, ProductNo, QtyOrdered, QtyDisp, ProductRate)
VALUES
  ('O00001', 'P00001', 10, 10, 450.00),
  ('O00001', 'P00002', 5,  5,  850.00),
  ('O00002', 'P00003', 20, 15, 320.00),
  ('O00003', 'P00004', 3,  3,  12500.00),
  ('O00003', 'P00005', 8,  6,  1800.00),
  ('O00004', 'P00001', 15, 10, 450.00),
  ('O00005', 'P00002', 7,  0,  850.00);
  
CREATE TABLE SALES_ORDER_DETAILS (
ORDERNO VARCHAR(6),
foreign key (ORDERNO) references SALES_ORDER(ORDERNO),
PRODUCTNO VARCHAR(6),
foreign key (PRODUCTNO) references PRODUCT_MASTER (PRODUCTNO),
QTYORDERED BIGINT,
QTYDISP BIGINT,
PRODUCTRATE DECIMAL(10,2));

#Q1.List the names of all clients having ‘a’ as the second letter in their names
SELECT NAME FROM CLIENT_MASTER
WHERE NAME LIKE '_a%';

#Q2.List the clients who stay in a city whose First Letter is ‘M’
select * from client_master
where city like 'M%';

#Q3.List all clients who stay in ‘Bangalore’ or ‘Mangalore’
SELECT * FROM CLIENT_MASTER 
WHERE CITY ='Bangalore' OR CITY='Mangalore';

#Q4.List all clients whose BalDue is greater than value 10000
SELECT * FROM CLIENT_MASTER
WHERE BALDUE > 10000;

#Q5.List all information from the Sales_Order table for orders placed in the month of June
SELECT * FROM sales_order
WHERE MONTH(ORDERDATE) =6;

#Q6.List the order information for ClientNo ‘C000001’ and ‘C00002’
SELECT * FROM CLIENT_MASTER
WHERE CLIENTNO='C00001' OR CLIENTNO='C00002';

#Q7.List products whose selling price is greater than 500 and less than or equal to 750
SELECT DESCRIPTION FROM PRODUCT_MASTER
WHERE 500 < SELLPRICE <=750;

#Q8.List products whose selling price is greater than 500.
#Calculate a new selling price as, original selling price * 15. Rename the new column in the column in the output of the above query as new_price.
SELECT DESCRIPTION, (SELLPRICE * 15) AS NEW_PRICE FROM PRODUCT_MASTER
WHERE SELLPRICE > 500 ;

#Q9.List the names, city and state of clients who are not in the state of ‘Maharashtra’
SELECT NAME,CITY,STATE FROM CLIENT_MASTER
WHERE STATE != 'MAHARASTRA';

#Q10.Count the total number of orders
SELECT COUNT(*) FROM SALES_ORDER;

#Q12.Calculate the average price of all the products
SELECT AVG(SELLPRICE) FROM PRODUCT_MASTER;

#Q13.Determine the maximum and minimum product prices. Rename the output as max_price and min_price respectively
SELECT MAX(SELLPRICE) AS MAX_PRICE ,MIN(SELLPRICE) AS MIN_PRICE
FROM PRODUCT_MASTER;

#Q14.Count the number of products having price less than or equal to 500
SELECT COUNT(*) FROM PRODUCT_MASTER
WHERE SELLPRICE<=500;

#Q15.List all the products whose QtyOnHand is less than reorder level
SELECT DESCRIPTION FROM PRODUCT_MASTER
WHERE QTYONHAND < REORDERLVL;

#Data Manipulation Operation

#Q1.List the order number and day on which clients placed their order
SELECT ORDERNO,DAYNAME(ORDERDATE) FROM SALES_ORDER;

#Q2.List the month (in alphabets) and date when the orders must be delivered
SELECT MONTHNAME(ORDERDATE),DELYDATE FROM SALES_ORDER;

#Q3.List the OrderDate in the format ‘DD-Month-YY’ . e.g. 12-February-02.
SELECT DATE_FORMAT(ORDERDATE,'%d-%M-%y') from sales_order;

#Q4.List the date, 15 days after today’s date.
SELECT DATE_ADD(CURDATE(), INTERVAL 15 DAY) AS FUTURE_DATE;

