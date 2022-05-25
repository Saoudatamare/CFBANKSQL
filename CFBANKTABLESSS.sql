create database if not exists cfbank;
use cfbank;
CREATE TABLE Branch (
    BranchID varchar (3) NOT NULL PRIMARY KEY,
    Branch_Name VARCHAR(45) NOT NULL,
    Address VARCHAR(45) NOT NULL,
    City VARCHAR(45) NOT NULL,
    state VARCHAR(2),
    zipcode VARCHAR(12) NOT NULL,
    Office_Number VARCHAR(45) NOT NULL
);

insert into Branch (BranchID,Branch_Name,Address,City,state,zipcode,Office_Number)
values ('CA1',	'CF Bank'	,'10 River',	'Santa Monica'	,'CA'	,'90201'	,'973-258-5866'),
('CO1',	'CF Bank',	'1500 alma Junction'	,'South Park'	,'CO'	,'80040'	,'719-658-0000'),
('MI1'	,'CF Bank',	'10 West Palm beach',	'Miami',	     'FL',	 '33132'	,'305-444-4477'),
('NY1',	'CF Bank',	'30 Broadway',	     'New York',	    'NY',	  ' 10003',	'914-358-4755'),
('NY2'	,'CF Bank'	,'100 River Ave'	,'Yonkers'	,'NY'	,'10701'	,'718-333-5000');

CREATE TABLE customer (
    customerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Cust_First_Name VARCHAR(45) NOT NULL,
    Cust_Last_Name VARCHAR(45) NOT NULL,
    Address VARCHAR(45) NOT NULL,
    City VARCHAR(45) NOT NULL,
    State VARCHAR(2) NOT NULL,
    ZipCode VARCHAR(12) NOT NULL,
    EmailAddress VARCHAR(45),
    Cell_Phone_Number VARCHAR(20) NOT NULL
);
select* from branch;

insert into customer (Cust_First_Name,Cust_Last_Name,Address,City,State,
ZipCode,EmailAddress,Cell_Phone_Number) 
values ('Eric',	'Carrtman'	,'210 East 10th st', 'South Park',	'CO', 80440,'mj@yahoo.com',	'719-362-5886'),
('Kenny',	'McCormick',	'220 East 10th st',	'South Park',	'CO',	80440,	'kcc@gmail.com','719-855-9632'),
('Kyle','Broflosky','230 East 10th st',	'South Park',	'CO',	80440,	'kb@gmail.com',	'719-369-2544'),
('Stan','Marsh', '200 East 10th st'	  , 'South Park'	,'CO'	,80440	,'sm@yahoo.com'	,'719-477-8955'),
('Token', 	'black','175 E spring st',	'South Park',	'CO'	,80440,	'tb@yahoo.com',	'719-655-9877'),
('Wendy',	'Testaburger',	'236 E spring st',	'South Park',	'CO',	80440,	'wt@gmil.com',	'719-125-4566'),
('Peter',	'Griffen',	 '10 River st',	'Yonkers',	'NY',	10701,	'pg@outllook.com',	'914-445-2111'),
('Meg',	'Griffen','10 River st'	,'Yonkers',	'NY'	,10701,	'mg@outlook.com'	,'914-586-3347'),
('Linda',	'Belcher',	      '10 West Palm beach',	'Miami',	'FL',	33132,	'lb@aol.com',	'305-999-0122'),

('Galye',	'Frond', '2550 West Palm beach',	'Miami',	'FL', 33132	, '   ',	'786-789-4561'),
('Bart', 	'Simpson',	    '1500 Broadway',	'Yonkers',	'NY',	10702	, 'bb@gmail.com',	'718-584-6933'),
('Lisa',	'Simpson',	   '1500 Broadway',	    'Yonkers',	'MY',	10702	, 'jazzlife@gamil.com',	'917-684-6003'),
('Tami',	'Larson	',     '1500 halaliva',  'Miami',	'FL',	33132,	'tami1@gmail.com',	'305-184-6933'),
('Dr',	     'Yap',	     '2590 West Palm beach',	'Miami',	'FL',	33132,	'yaptrap@aol.com',	'786-254-6322'),
('Mickey',	'Slammer',	   '1500 long view',	'Miami',	'FL',	33402, 	'robbank@aol.com',	'786-104-9822'),
('Kim', 'possible',	'10 Maple drive'	,'Santa monica',	'CA	', 90211,	'kimp@gmail.com',	'973-744-1022'),
('Ron',	'Ton',	 ' 1470 Maple drive',	'Santa monica',	'CA',	90211	, 'ronton@gmail.com', '973-810-7802'),
('Ron',	'Jeremy	', ' 10 Maple drive',	'Santa monica',	'CA',	90211,	'ronjery@gmail.com', '973-580-3655'),
('Dr',	'Evil',	 ' 10 Maple drive ', 'Santa monica',	'CA',	90211,	'evildr@gmail.com', '973-810-7802');

drop table Banker;
CREATE TABLE Banker (
    BankerID int NOT NULL PRIMARY KEY auto_increment,
    First_Name VARCHAR(45) NOT NULL,
    Last_Name VARCHAR(45) NOT NULL,
    Email_Address VARCHAR(45) NOT NULL,
    customerID INT NOT NULL,
    FOREIGN KEY (customerID)
        REFERENCES customer (customerID),
    BranchID varchar (3) NOT NULL,
    FOREIGN KEY (BranchID)
        REFERENCES Branch (BranchID)
);

insert into Banker (First_Name, Last_Name, Email_Address, customerID, BranchID)
values
('Francine','Smith' ,'fs@cfbank.com',	   9, 'NY1'),
('Stan',	'Smith',	'ss@cfbank.com'	,   1, 'CO1'),
('Avery',	'Bullock',   'av@cfbank.com',	8, 'NY2'),
('Klaus',	'helser',	'kh@cfbank.com',	5, 'NY1'),
('Homer',	'Simpson',	'hs@cfbank.com',	2, 'CO1'),
('Ned', 	'Flanders',	'nf@cfbank.com',	3, 'CO1'),
('Louis',	'Belcher',	'lb@cfbank.com',	7, 'MI1'),
('Andy',	'pesto',	'ap@cfbank.com',	10,'MI1'),
('Timmy',	'tim',	    'tt@cfbank.com',  4	, 'CO1'),
('Crusty',	'Clown'	,'cc@cfbank.com'	,6,    'NY1');


CREATE TABLE Accounts (
    AccountID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Account_Number VARCHAR(25) NOT NULL unique,
    Balance DECIMAL(8 , 2 ) NOT NULL,
    category VARCHAR(45) NOT NULL,
    customerID INT NOT NULL,
    FOREIGN KEY (customerID)
        REFERENCES customer (customerID)
);

insert into Accounts ( Account_Number,Balance,customerID, category) 
values ('9104-3652-1244-3666', 	5000,	1,	'Checking'),
('9104-3652-1244-3670'	,10000,	1	,'Saving'),
('9104-3652-1244-3667',	400,2	,'Checking'),
('9105-0366-9855-6214', 500	,  3,'Checking'),
('9104-3652-1244-3672', 15000	,3	,'Saving'),
('9106-1566-1423-3698'	,300	,4,	'Checking'),
('9110-1234-5678-0909'	,6000,   5,	'Checking'),
('9111-4578-3695-5430'	,12500,	9,	'Saving'),
('9111-4578-3695-5419', 9005,   10,	'Checking'),
('9110-1234-5678-0911'	,250000,	7	,'Checking'),
('9111-4578-3695-5422'	,200, 	8,	'Checking'),
('9111-4578-3695-5418'	,1500	,8	,'Saving'),
('9001-1478-2536-9031'	,450000	,13,	'Checking'),
('9002-5846-2513-5845'	,15	,13,	'Saving'),
('9002-5846-2513-5033',	1535,	10,	'Saving'),
('9111-4578-3695-5417'	,800	,9,	'Checking'),
('9111-4578-3695-5412',	1000	,12	,'Checking'),
('9111-4578-3695-5413'	,250	,11	,'Saving'),
('9111-4578-3695-5414',	8000,	6,	'Checking');

CREATE TABLE checking (
    Account_Number VARCHAR(25) NOT NULL unique,
    over_draft_fee INT(11) NOT NULL,
    AccountID INT, foreign key (AccountID) references Accounts (AccountID) 
    
);

CREATE TABLE Savings (
    Account_Number varchar(25) NOT NULL unique,
    interest_rate DECIMAL(8 , 3 ) NOT NULL,
    AccountID INT NOT NULL, foreign key (AccountID) references Accounts (AccountID) 
    

);

insert into checking (Account_Number,   over_draft_fee,    AccountID)
    
values 
('9104-3652-1244-3666' ,35,1),
('9104-3652-1244-3667',	35,	3),
('9105-0366-9855-6214',	35,	4),
('9106-1566-1423-3698',	35,	6),
('9110-1234-5678-0909',	35,	7),
('9111-4578-3695-5419',	35,	9),
('9110-1234-5678-0911',	35,	10),
('9111-4578-3695-5422',	35,	11),
('9001-1478-2536-9031',	35,	13),
('9111-4578-3695-5417',	35,	16),
('9111-4578-3695-5412',	35,	17),
('9111-4578-3695-5414',	35,	19);

insert into Savings (Account_Number,  interest_rate ,   AccountID)
values 
( '9104-3652-1244-3670',0.035	,2),
('9104-3652-1244-3672',	0.035	,5),
('9111-4578-3695-5413',	0.035	,8),
('9111-4578-3695-5418',	0.045	,12),
('9002-5846-2513-5845',	0.045	,14),
('9002-5846-2513-5033',	0.05  ,15),
('9111-4578-3695-5440',	0.05	,18);

CREATE TABLE loan (
    loan_Number VARCHAR(45) NOT NULL PRIMARY KEY,
    Amount INT(16) NOT NULL,
    customerID INT NOT NULL,
    FOREIGN KEY (customerID)
        REFERENCES customer (customerID),
    BranchID varchar(3) NOT NULL,
    FOREIGN KEY (BranchID)
        REFERENCES Branch (BranchID)
);

insert into loan (loan_Number,  Amount,   customerID,  BranchID )
values 
('191-250-456-331-2100' ,25000,	7,	'MI1'),
('191-250-456-331-4446' ,5000,	7,	'MI1'),
('191-458-459-331-2102'	,100000,9,	'NY2'),
('191-458-459-321-0112'	,1500,	4,  'CO1'),
('191-458-459-321-6899'	,5000,8,     'NY2'),
('191-458-459-621-4569	',1000,	3,	'CO1'),
('191-458-459-721-1000',15000, 2,   'CO1'),
('191-458-459-999-6900'	,5000 ,10	,'NY2'),
('456-191-457-400-5555',45000, 10	,'MI1'),
('456-191-457-401-7777',1000000, 1,	'CO1'); 




CREATE TABLE LoanPayment (  
loan_Number varchar(45) not null,
    payment_date DATE NOT NULL,
    payment_Number INT(12) NOT NULL primary key,
    payment_amount DECIMAL(10, 2 ) NOT NULL
);



drop table LoanPayment; 
insert into LoanPayment ( loan_Number, payment_date,payment_Number,payment_amount)
values 
(' 191-250-456-331-2100 ', '2018-04-15',  123,    175),
(' 191-250-456-331-4446 ',  '2018-04-15',	124	,  100.5),
(' 191-458-459-331-2102',   '2018-04-25',	130	,   1000),
(' 191-458-459-621-4569 ',  '2018-04-27',	131,	50.25),
(' 191-458-459-721-1000 ' , '2018-04-27',	132,    100),
( ' 191-458-459-999-6900',   '2018-04-30',	143	,    150),
( ' 456-191-457-400-5555',    '2018-04-30',	144,   	2500),
( '  456-191-457-401-7777',    '2018-04-30',   145,   5000);

select Cust_First_Name,Cust_Last_Name, concat( Address, ',',City , ',', State , ',', ZipCode) as FullAddress
 from customer;
 
 select  concat(First_Name, ',', Last_Name) as Full_Name, Email_Address 
 from Banker;

select customerID, count(City) from customer
 where City in ('South Park', 'Yonkers', 'Miami', 'Santa monica');
 
select Cust_First_Name ,Cust_Last_Name , concat( Address , ' ' , City, ' ', State, ' ',ZipCode) as Full_Address from customer 
where  State = 'NY' or  State = 'FL';
select * from Accounts order by Balance desc;
 
select sum ( Amount) from Loan;

select customerID, Cust_First_Name ,Cust_Last_Name 
from customer
where Cust_Last_Name like  "%son%";

select   BankerID ,First_Name,Last_Name 
 from Banker
where First_Name like "a%";

 select * from Banker; 
 
 select * from customer 
 where State not in ("NY");
 
 select loan_Number , payment_date,payment_Number,payment_amount
 from LoanPayment
 where payment_date between ' 2018-04-25' and '2018-04-29';
 
 
 select min(Amount) from loan;
 
 select * from LoanPayment;
 select count( customerID) from customer;
 
 select * from customer 
 where City = 'Santa monica' and State = 'CA';
 
 select Cust_First_Name ,Cust_Last_Name , concat( Address , ' ' , City, ' ', State, ' ',ZipCode) 
 as Full_Address , loan_Number, concat('$', format( Amount ,2)) as Balance
 from customer join loan on customer.customerID = loan.customerID
 order by Amount asc;

select customerID, Cust_First_Name ,Cust_Last_Name ,concat('$', ' ',Amount) as Amount
from customer join loan on customer.customer_ID = loan.customer_ID
where Amount <100000 and Amount > 15000; 



select Cust_First_Name ,Cust_Last_Name , Account_Number, category, Balance 
from customer inner join accounts  on customer.customerID = accounts.customerID
where category = 'checking' and Balance >0;

select concat(Cust_First_Name , ' ', Cust_Last_Name) as Full_Name,  Account_Number, category, 
concat('$', format( Balance ,2)) as Balance
from customer inner join accounts  on customer.customerID = accounts.customerID
where category = 'saving' and Balance > 1 and Balance < 1000;


select customerID, Cust_First_Name , Cust_Last_Name, 
concat( Address , ' ' , City, ' ', State, ' ',ZipCode) 
 as Full_Address ,concat('$', ' ',Amount) as Amount, Amount * (power( 1.1500, .805)) - Amount as newAmount
 from customer join loan on customer.customer.ID = loan.customer.ID;
 
 





