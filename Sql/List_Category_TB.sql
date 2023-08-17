create table List_Category_TB
(
category_ID int  primary key identity(1,1),
CategoryList_TB_ID int NOT NULL foreign key references CategoryList_TB(category_ID),
List_Name varchar(1000) not null
)
--drop table List_Category_TB
select * from List_Category_TB
select * from List_Category_TB where CategoryList_TB_ID=1
insert into List_Category_TB values (1,'Rent'),(1,'Mortgage payments'),
(1,'Condo / HOA (home owner’s association) dues / Maintenance fees'),(1,'Household appliances'),
(1,'Household Repairs'),(1,'Heating systems (eg: furnace) and cooling systems (eg: air conditioning)'),
(1,'Landscaping'),(1,'Lawn Care'),(1,'Alarm systems'),(1,'Property taxes'),(1,'Furniture and décor items'),
(1,'Purchases from stores like Home Depot')
-- 12
insert into List_Category_TB values(2,'Electricity'),(2,'Water'),(2,'Phone'),(2,'Natural gas'),(2,'Sewer'),
(2,'Trash'),(2,'Heating'),(2,'Cable / TV streaming subscriptions'),(2,'Internet')
--9
insert into List_Category_TB values(3,'Transit'),(3,'Taxis / Uber'),(3,'Car / vehicle lease'),(3,'Gasoline'),
(3,'License and registration fees'),(3,'Vehicle repairs (including oil changes)'),(3,'Tires and tire storage'),
(3,'Parking'),(3,'Tolls')
--9
insert into List_Category_TB values(4,'Groceries and food (obviously)'),(4,'Toothpaste'),
(4,'Hygiene / toiletries'),(4,'Shampoo and conditioner'),(4,'Deodorant'),(4,'Vitamins and supplements'),
(4,'Laundry detergent'),(4,'Cleaning supplies'),(4,'Diapers'),(4,'Farmers market'),(4,'Meal kits')
--11
insert into List_Category_TB values(5,'Life insurance'),(5,'Home insurance'),(5,'Renters insurance'),
(5,'Vehicle insurance'),(5,'Healthcare insurance'),(5,'Pet insurance'),(5,'Disability insurance'),
(5,'Long term care insurance')
--8
insert into List_Category_TB values(6,'Prescription medication'),(6,'Prescription eye glasses'),(6,'Dental care'),
(6,'Braces'),(6,'Therapy'),(6,'Massages'),(6,'Health deductibles')
--7
insert into List_Category_TB values(7,'Child care'),(7,'Summer camp'),
(7,'Extra curricular activities, such as sports or music lessons'),(7,'School supplies'),
(7,'Tuition'),(7,'Tutoring'),(7,'Child support'),(7,'Allowance'),(7,'Birthday parties')
--9,
insert into List_Category_TB values(8,'Gym memberships and fitness classes'),(8,'Clothing'),(8,'Dry cleaning'),
(8,'air care / beauty'),(8,'Health and wellness / spa'),(8,'Miscellaneous shopping'),(8,'Personal development'),
(8,'Purchases from stores like Walmart')
--8
insert into List_Category_TB values(9,'Restaurants (this also includes items like fast food and food delivery)'),
(9,'Books'),(9,'Electronics'),(9,'Concerts / events'),(9,'Movies'),(9,'Hobbies'),(9,'Memberships'),
(9,'Subscriptions')
--8
insert into List_Category_TB values(10,'Grooming'),(10,'Pet food'),(10,'Toys'),
(10,'Supplies'),(10,'Pet sitter / daycare'),(10,'Veterinary bills'),(10,'Pet medication')
--7
insert into List_Category_TB values(11,'Vacation'),(11,'Hotel'),(11,'Car rentals'),(11,'Airfare'),(11,'Cruises')
--5
insert into List_Category_TB values(12,'Credit card debt'),(12,'Vehicle loan'),
(12,'Personal loans / lines of credit'),(12,'Student debt'),(12,'Medical bills'),
(12,'Loans from family or friends')
--6
insert into List_Category_TB values(13,'Miscellaneous expenses'),(13,'Gifts'),(13,'Special occasions'),
(13,'Donations'),(13,'Friend’s Debt'),(13,'Anything that doesn’t fit into another category.')
--6
insert into List_Category_TB values(14,'Regular work paycheck'),(14,'Bonus or commission'),
(14,'Side hustle money'),(14,'Interest (from investments)'),
(14,'Any money received from the government (for example, child benefits)'),(14,'Alimony payments')
--6
insert into List_Category_TB values(15,'Retirement fund'),(15,'Investments'),(15,'Emergency fund'),
(15,'Sinking funds'),(15,'General savings accounts')
--5
-----------------------------------------CRUD-----------------------------------------------------
select * from List_Category_TB

select * from List_Category_TB where CategoryList_TB_ID=1
update List_Category_TB set CategoryList_TB_ID=1,List_Name='Rent' where category_ID=1
insert into List_Category_TB values(1,'Rent')
delete List_Category_TB where category_ID=0
-------------------------------------------------------------------------------------------------
select * from List_Category_TB where 
CategoryList_TB_ID=(select category_ID from CategoryList_TB where category_Name='HOUSING') 

select category_ID from List_Category_TB where List_Name='Rent'