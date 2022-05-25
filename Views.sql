
/* crea a view that show the first and last
name their identification number of the customer, The banker(s) first and
last name that work for a particular that location branch. It must be sorted
by the branch identification number*/
create view Bankers_customer as
select customer.customerID, Cust_First_Name,Cust_Last_Name, First_Name, Last_Name, banker.BranchID,
 concat(branch.Address, ',', branch.City, ',' , branch.state, ',', branch.zipcode) as BranchfullAddress 
from customer join banker on  customer.customerID = banker.customerID
join branch  on branch.BranchID = banker.BranchID 
order by BranchID asc;

select * from banker;

select * from branch;

/* create a view for the CFBank Corporate Managers. The view must
show their customers first and last name for the customer, loan account
number, their current balance and show the identification of the branch
that opened the account*/

create view Branch_Open_loan as 
select Cust_First_Name,Cust_Last_Name, loan.loan_Number, Amount, branch.BranchID
from customer join loan on customer.customerID = loan.customerID join branch on customer.customerID
= branch.BranchID
order by Amount asc;

/*view must contain
the customers first and last name, their category and saving account
number and balance, you need to calculate the balance with interest the
accrued on the account and show there new balance*/


CREATE VIEW Customer_one_saving as  
select  Cust_First_Name,Cust_Last_Name,
 accounts.category, accounts.Account_Number, accounts.Balance, Balance + (Balance * interest_rate) as newBalance
 from customer 
 join accounts on customer.customerID = accounts.customerID
 join savings on accounts.Account_Number = savings.Account_Number;
  


 
 
 
 
 