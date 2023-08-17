
create table CategoryList_TB
(
category_ID int  primary key identity(1,1),
category_Name varchar(100) not null unique,
)
create table List_Category_TB
(
category_ID int  primary key identity(1,1),
CategoryList_TB_ID int NOT NULL foreign key references CategoryList_TB(category_ID),
List_Name varchar(100) not null
)

insert into CategoryList_TB values ('HOUSING'),('UTILITIES'),('TRANSPORTATION'),('FOOD / GROCERY STORE ITEMS'),
('INSURANCE'),('HEALTHCARE / MEDICAL COSTS'),('KIDS'),('PERSONAL'),('ENTERTAINMENT'),('PETS'),('TRAVEL'),
('DEBT REPAYMENT'),('OTHER'),('INCOME'),('SAVINGS')
--15
select * from CategoryList_TB order by category_ID
