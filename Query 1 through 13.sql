/*Retrieve all the customers first and last name and their full address only*/
select Cust_First_Name,Cust_Last_Name, concat( Address, ' ',City , ' ', State , ' ', ZipCode) as FullAddress
 from customer;
 
/* Retrieve all the banker name and their email address*/ 
 select  concat(First_Name, ',', Last_Name) as Full_Name, Email_Address 
 from Banker;
/*Retrieve the amount of customers we have per city*/ 

select  count(customerID) as AmountOfCustomer, City from customer group by city;

/*Retrieve all the Customer first and last name and their full address. We only
want the customers who live in NY or FL*/  
select Cust_First_Name ,Cust_Last_Name , concat( Address , ' ' , City, ' ', State, ' ',ZipCode) as Full_Address from customer 
where  State = 'NY' or  State = 'FL';

/* I need all the account information of all our customers but show the
balance in the order from highest to lowest*/

select * from Accounts order by Balance desc;
 
/*I need the sum of all the loan balances due by all our customers*/

select sum ( Amount) from Loan;

/*Retrieve all the customers identification number, first and last name, whose
last name ends with the letters SON*/

select customerID, Cust_First_Name ,Cust_Last_Name 
from customer
where Cust_Last_Name like  "%son%";

/*Retrieve all the Bankers identification number, first and last name whose
first name begins with the letters A*/

select   BankerID ,First_Name,Last_Name 
 from Banker
where First_Name like "a%";

 select * from Banker; 
 
 /*Retrieve all the customer’s that are not located in the state of NY*/
 
 SELECT 
    *
FROM
    customer
WHERE
    State NOT IN ('NY');
 
 /*Retrieve all loans payment dates are from april 25th to april 29th*/
 
 SELECT 
    loan_Number, payment_date, payment_Number, payment_amount
FROM
    LoanPayment
WHERE
    payment_date BETWEEN ' 2018-04-25' AND '2018-04-29';
 
/*Retrieve the loan with the lowest balance*/
 
 select min(Amount) from loan;
 
 SELECT 
    *
FROM
    LoanPayment;
 
 /*Retrieve the amount of customers we have in CFBank*/
 
 select count( customerID) from customer;
/*Retrieve all the customers that live in santa monica and live in ca*/
 
 SELECT 
    *
FROM
    customer
WHERE
    City = 'Santa monica' AND State = 'CA';