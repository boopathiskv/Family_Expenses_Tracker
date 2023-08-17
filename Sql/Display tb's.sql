--1. User TABLE
select * from UserDetails 
insert into UserDetails values('Boopathi','S',9092932627,'boopathiskv@gmail.com','admin@123')
update UserDetails set fname='Thenmozhi',lname='S',moblieno='9688670059',emailid='thenmozhiskv@gmail.com',password='admin@123' where userid=1002

--2. CategoryList_TB
select * from CategoryList_TB order by category_ID

--3. List_Category_TB
select * from List_Category_TB

--4. Records_TB 
select * from Records_TB
insert into Records_TB values (1001,1,'08/15/2023','1',1000,'anthiyur')
insert into Records_TB values (1001,15,'2023/08/15','2',1000,'anthiyur')

-- select from dispaly
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category Type',t2.List_Name as 'Category',t1.totalCost as 'Cose' from Records_TB t1 join
List_Category_TB t2 on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID 

-- selected Category
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category Type',t2.List_Name as 'Category',t1.about as 'About',t1.totalCost as 'Cose' from Records_TB t1 join
List_Category_TB t2 on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID where t3.category_ID=2

-- selected Category and list in Category
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category Type',t2.List_Name as 'Category',t1.totalCost as 'Cose' from Records_TB t1 join
List_Category_TB t2 on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID where t3.category_ID=1 
and t1.categoryList_id=1

-------Records_TB_category_and_SubCategory
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category Type',
t2.List_Name as 'Category',t1.about as 'About',t1.totalCost as 'Cose' from Records_TB t1 join List_Category_TB t2
on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID 
where  t1.categoryList_Id =(select category_ID from List_Category_TB where List_Name='Sub_Category_select_TB') and user_id=1001
-------Records_TB_category_only
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category Type',
t2.List_Name as 'Category',t1.about as 'About',t1.totalCost as 'Cose' from Records_TB t1 join List_Category_TB t2
on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID 
where  t3.category_ID=(select category_ID from CategoryList_TB where category_Name='HOUSING') --and user_id=1001
--------------
-------Records_TB_category_All
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category Type',
t2.List_Name as 'Category',t1.about as 'About',t1.totalCost as 'Cose' from Records_TB t1 join List_Category_TB t2
on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID 
where user_id=1001

select * from Records_TB