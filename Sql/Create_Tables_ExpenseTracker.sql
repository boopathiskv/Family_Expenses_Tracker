-- Create_Tables_ExpenseTracker

create database ExpenseTracker

create table UserDetails
(
userid int primary key identity(1001,1),
fname varchar(40) not null,
lname varchar(40) not null,
moblieno bigint unique not null,
emailid varchar(50) unique not null,
password varchar(50) not null
)

--drop table UserDetails
select * from UserDetails
select * from UserDetails where moblieno=9092932627 or emailid='boopathiskv@gmail.com'

update UserDetails set fname='Thenmozhi',lname='S',moblieno='9688670059',emailid='thenmozhiskv@gmail.com' where userid=1002
update UserDetails set password='12345' where userid=1001

insert into UserDetails values('Boopathi','S',9092932627,'boopathiskv@gmail.com','admin@123')
select * from UserDetails where moblieno=9092932627 or emailid='boopathiskv@gmail.com'
--create table IncomeTB
--(
--incomeId int  primary key identity(1,1),
--expensename varchar(100) unique
--)
drop table IncomeAndExpenseCategoryListTB
--create table CategoryListIdTB
--(
--category_ID int  primary key identity(1,1),
--HOUSING_ID int NOT NULL foreign key references HOUSING(HOUSING_ID),
--UTILITIES_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(UTILITIES_ID),
--TRANSPORTATION_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(TRANSPORTATION_ID),
--FOOD_GROCERY_STORE_ITEMS_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(FOOD_GROCERY_STORE_ITEMS_ID),
--INSURANCE_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(INSURANCE_ID),
--HEALTHCARE_MEDICAL_COSTS_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(HEALTHCARE_MEDICAL_COSTS_ID),
--KIDS_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(KIDS_ID),
--PERSONAL_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(PERSONAL_ID),
--ENTERTAINMENT_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(ENTERTAINMENT_ID),
--PETS_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(PETS_ID),
--TRAVEL_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(TRAVEL_ID),
--DEBT_REPAYMENT_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(DEBT_REPAYMENT_ID),
--OTHER_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(OTHER_ID),
--INCOME_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(INCOME_ID),
--SAVINGS_ID int NOT NULL foreign key references IncomeAndExpenseCategoryListTB(SAVINGS_ID),
--)

create table Records_TB 
(
record_Id int  primary key identity(1,1),
user_id int NOT NULL foreign key references UserDetails(userid),
categoryList_Id int NOT NULL foreign key references List_Category_TB(category_ID),
expenseDate varchar(50) not null,
Bill_IdOrGst_Id varchar(100) not null unique,
totalCost decimal(18,2) not null,
about varchar(500)
)
drop table Records_TB
select getdate()
select * from IncomeAndExpenseListTB
select * from Records_TB
