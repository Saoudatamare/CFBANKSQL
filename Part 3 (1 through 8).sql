
 /*Retrieve the customers first and last name and their full address and loan
number and balance show the balance in ascending order*/

 select Cust_First_Name ,Cust_Last_Name , concat( Address , ' ' , City, ' ', State, ' ',ZipCode) 
 as Full_Address , loan_Number, concat('$', format( Amount ,2)) as Balance
 from customer join loan on customer.customerID = loan.customerID
 order by Amount asc;

/*Retrieve all our customers identification number, first and last name
including there balance, but I only need who’s Loan amount exceed $15000
but under $100000*/

select customer.customerID, Cust_First_Name ,Cust_Last_Name ,concat('$', ' ',Amount) as Amount
from customer join loan on customer.customerID = loan.customerID
where Amount <100000 and Amount > 15000; 

select * from customer;


/*Retrieve a list of all our customers first and last name, account number and
category. We only want the customers who has a checking account and has
a balance with our bank.*/

select Cust_First_Name ,Cust_Last_Name , Account_Number, category, Balance 
from customer inner join accounts  on customer.customerID = accounts.customerID
where category = 'checking' and Balance >0;


/*Retrieve a list of all our customers full name, account number and
category. We only want the customers who has a savings balance is from $1
to $1000 You must concatenate the customers name*/

select concat(Cust_First_Name , ' ', Cust_Last_Name) as Full_Name,  Account_Number, category, 
concat('$', format( Balance ,2)) as Balance
from customer inner join accounts  on customer.customerID = accounts.customerID
where category = 'saving' and Balance > 1 and Balance < 1000;

/*Retrieve all our customers identification number, first and last name,
address, including there loan amount. You must calculate and include a
15% interest to the balance and obtain a new balance*/

select customer.customerID, Cust_First_Name , Cust_Last_Name, 
concat( Address , ' ' , City, ' ', State, ' ',ZipCode) 
 as Full_Address ,concat('$', ' ',Amount) as Amount, Amount * (round( 0.1500, 2)) + Amount as newAmount
 from customer join loan on customer.customerID = loan.customerID;
 
 
show databases;
use cfbank;

/*Retrieve all the bankers first and last name, email address and the branch
address they work for. Sort it by branch identification number.
*/

select First_Name, Last_Name, Email_Address, Branch.BranchID, concat(City, ' ', state, ' ',zipcode) as FullAddress
from branch join Banker on Branch.BranchID = banker.BranchID;

select * from banker;
select * from branch;

/*Retrieve the branch identification and the amount of the loans a particular
branch gave. It need to be sorted in by the branch identification number
and amount both in ascending order.
*/

select Branch.BranchID, Amount from branch join loan on branch.BranchID = loan.BranchID
order by BranchID, Amount asc;

/*Retrieve the customer identification number, fist and last name, customers
loan number and amount and how much they paid. I also want to know
how much there balance is after they made a payment to there account. It
must be sorted by the customer id*/

SELECT customer.customerID,
    Cust_First_Name,
    Cust_Last_Name,
    (Amount - payment_amount) AS newBalance
FROM
    customer
        JOIN
    loan ON customer.customerID = loan.customerID
    join loanpayment on loan.loan_Number = loanpayment.loan_Number order by customer.customerID;
    
    
    