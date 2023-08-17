--drop proc DisplayAllRecords
drop proc DisplayAllRecords
create proc DisplayAllRecords
(
@user_id int
)
As
Begin
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category Type',t2.List_Name as 'Category',t1.about as 'About',t1.totalCost as 'Cose' from Records_TB t1 join
List_Category_TB t2 on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID  where t1.user_id=@user_id
End
Exec DisplayAllRecords 1003
---------------------------------------------------------------------------------------
create proc Insert_Records_TB
(
@user_id int,@categoryList_Id varchar(100),
@expenseDate varchar(100),@Bill_IdOrGst_Id varchar(100),
@totalCost decimal(18,2),@about varchar(500)
)
As
Begin
insert into Records_TB values (@user_id,(select category_ID from 
List_Category_TB where List_Name=@categoryList_Id),@expenseDate,@Bill_IdOrGst_Id,
@totalCost,@about)
End
drop proc Insert_Records_TB
exec Insert_Records_TB 1001,'Rent','2023/08/15','asd23',1234,'test'
select convert(date,'2023/08/15')
select * from Records_TB
---------------------------------------------------------------------------------------------------
--Category_select
create proc Category_select_TB
(
@user_id int,@categoryName varchar(100)
)
As
Begin
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category',
t2.List_Name as 'Sub Category',t1.about as 'About',t1.totalCost as 'Cose' from Records_TB t1 join List_Category_TB t2
on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID 
where  t3.category_ID=(select category_ID from CategoryList_TB where category_Name= @categoryName) and user_id=@user_id

End
drop proc Category_select_TB
exec Category_select_TB 1001,'HOUSING'
---------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
--Sub_Category_select
create proc Sub_Category_select_TB
(
@user_id int,@categoryName varchar(100)
)
As
Begin
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category',
t2.List_Name as 'Sub Category',t1.about as 'About',t1.totalCost as 'Cose' from Records_TB t1 join List_Category_TB t2
on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID 
where  t1.categoryList_Id =(select category_ID from List_Category_TB where List_Name= @categoryName) and user_id=@user_id

End
drop proc Sub_Category_select_TB
exec Sub_Category_select_TB 1001,'Rent'
---------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
--All_Category_select
create proc All_Category_select_TB
(
@user_id int,@categoryName varchar(100)
)
As
Begin
select t1.expenseDate as 'Date',t1.Bill_IdOrGst_Id as 'Bill No OR GST NO',t3.category_Name as 'Category',
t2.List_Name as 'Sub Category',t1.about as 'About',t1.totalCost as 'Cose' from Records_TB t1 join List_Category_TB t2
on t1.categoryList_id=t2.category_ID join CategoryList_TB t3 on t2.CategoryList_TB_ID=t3.category_ID 
where user_id=@user_id
End

drop proc All_Category_select_TB
exec All_Category_select_TB 1001,'Test'