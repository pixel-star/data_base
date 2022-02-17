-- Лабораторна робота № 2
-- З дисципліни Бази даних
-- Студента групи МІТ-31 Кульбачинського Данила

-- Запит1. Обрати всі записи з таблиці table1

SELECT * FROM customer;


SELECT TOP 3 * FROM customer;

SELECT * FROM customer
LIMIT 3;

select name as customer from customer
limit 3;

SELECT * FROM customer
FETCH FIRST 3 ROWS ONLY;

SELECT TOP 10 PERCENT * FROM customer;

SELECT * FROM customer
FETCH FIRST 50 PERCENT ROWS ONLY;

SELECT TOP 3 * FROM cars
WHERE rented=true;

SELECT * FROM cars
WHERE rented=true
LIMIT 3;

SELECT * FROM cars
WHERE rented=true
FETCH FIRST 3 ROWS ONLY;

SELECT MIN(name)
FROM customer
WHERE pasport_id;

SELECT MAX(name)
FROM customer
WHERE pasport_id;

SELECT MIN(pasport_id) AS Smallest
FROM customer;

SELECT MAX(pasport_id) AS Largest
FROM customer;

SELECT COUNT(pasport_id)
FROM customer;

SELECT AVG(pasport_id)
FROM customer;

SELECT SUM(pasport_id)
FROM OrderDetails;

SELECT * FROM customer
WHERE last_name LIKE 'a%';

SELECT * FROM customer
WHERE last_name LIKE '%a';

SELECT * FROM customer
WHERE last_name LIKE '%or%';

SELECT * FROM customer
WHERE pasport_id BETWEEN 10 AND 20;

SELECT * FROM customer
WHERE pasport_id NOT BETWEEN 10 AND 20;

SELECT * FROM customer
WHERE pasport_id BETWEEN 10 AND 20
AND id NOT IN (1,2,3);

SELECT * FROM customer
WHERE home_address BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY last_name;

Select name +' '+ last_name As "Full Name" from customer;

Select * from customer where last_name like '%A%';

Select * from customer where last_name like 'D%';

Select * from customer where last_name like '%a';

SELECT name, last_name FROM customer 
WHERE last_name LIKE '%Ma%' OR name LIKE '%Da%';

Select * from customer order by name asc

--30--

Select * from customer order by last_name desc;

Select * from customer order by LastName asc, name desc

select 'Hello ' + firstname from tblStudent

Select RTRIM(FirstName) from tblstudent

Select LTRIM(FirstName) from tblstudent

Select len(FirstName) from tblstudent

Select REPLACE(FirstName,'a','$') from tblStudent

Select * from tblStudent where FirstName like 'm___'

Select * from tblStudent where FirstName like '___a' 

select * from tblStudent where FirstName like '[^a-p]%'

select SUBSTRING (convert(varchar,admission_date,103),7,4) as Year,
SUBSTRING (convert(varchar,admission_date,100),1,3) as Month, 
SUBSTRING (convert(varchar,admission_date,100),5,2) as Date
from tblStudent

Select * from tblStudent where SUBSTRING(convert(varchar,Admission_date,103),7,4)='2015'

Select * from tblStudent where Admission_date >'01/31/2016'

Select * from tblStudent where Admission_date <'01/31/2016'

Select * from tblStudent where SUBSTRING(convert(varchar,Admission_date,100),1,3)='Jan'

Select convert(varchar(19), admission_date,121) from tblStudent

select getdate()

select GETUTCDATE()

select DATEPART(MONTH, admission_date) from tblStudent

select DATEPART(YEAR, admission_date) from tblStudent

select * from tblStudent where admission_date between '2015-01-01' and '2016-01-01'

select FirstName, LastName, GETDATE() as 'Current_date', Admission_date,
DATEDIFF(DD, Admission_date, GETDATE()) As days from tblStudent

select FirstName, LastName, GETDATE() as 'Current_date', Admission_date,
DATEDIFF(MM, Admission_date, GETDATE()) As months from tblStudent


select FirstName, LastName, GETDATE() as 'Current_date', Admission_date,
DATEDIFF(YYYY, Admission_date, GETDATE()) As years from tblStudent

select CONVERT(varchar(30), admission_date, 106) from tblStudent

select CONVERT(varchar(30), admission_date, 111) from tblStudent

Select CONVERT(varchar(20), admission_date, 108) from tblStudent

select datepart (YYYY,Admission_date) Admission_Year, datepart (MM,Admission_date)
Admission_Month,count(*) Total_Student from tblStudent group by datepart(YYYY,Admission_date),
datepart(MM,Admission_date)

select top 1 * from tblStudent

Select TOP 1 Admission_fee from (Select TOP 2 Admission_fee from tblStudent
order by Admission_fee DESC) T Order By Admission_fee ASC

select top 2 * from tblStudent order by Admission_fee desc

Select Max(Admission_fee) from (select top 6 * from tblStudent) A

Select Min(Admission_fee) from (select top 6 * from tblStudent) A

select FirstName from tblStudent union select LastName from tblStudent

Select * from tblStudent where Admission_fee < 15000

Select * from tblStudent where Admission_fee > 15000

Select * from tblStudent where Admission_fee between 10000 and 15000

SELECT FirstName, CASE FirstName WHEN 'Sara' THEN Admission_fee * .10 WHEN 'Dora' THEN Admission_fee * .15 ELSE Admission_fee * .15

select COUNT(*) from tblStudent

Select Branch, SUM(admission_fee) as Total_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) ASC

Select Branch, SUM(admission_fee) as Total_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) DESC

Select Branch, AVG(admission_fee) as Average_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) ASC

Select Branch, MAX(admission_fee) as Maxmum_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) DESC

Select Branch, MIN(admission_fee) as Minimum_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) ASC

Select Branch,count(FirstName),sum(admission_fee) Admission_fee from tblStudent
group by Branch order by Admission_fee desc

select datepart (YYYY,Admission_date) Admission_year,datepart (MM,Admission_date) Admission_month,
count(*) Total_student from tblStudent group by datepart(YYYY,Admission_date), datepart(MM,Admission_date)
SQL Server Advanced Questions – ‘Join’ questions

Select Firstname, Lastname, Scholarship_Amount from tblStudent A left join tblScholarship
 B on A.StudentId = B.Student_ref_id

Select Firstname, Lastname, Scholarship_Amount from tblStudent A Inner join tblScholarship 
B on A.StudentId = B.Student_ref_id

Select Firstname, Lastname, Scholarship_Amount from tblStudent A Inner join tblScholarship 
B on A.StudentId = B.Student_ref_id and Scholarship_Amount > 1200

Select Firstname, Lastname, isnull(Scholarship_Amount,0) from tblStudent A right join 
tblScholarship B on A.StudentId = B.Student_ref_id

Select Firstname, Lastname, ISNULL(Scholarship_Amount,0) from tblStudent a left join
tblScholarship B on A.StudentId = B.Student_ref_id
 Also check Top C# interview questions and answers


Select Firstname, ISNULL(Scholarship_Amount, 0) As [Scholarship Amount]
from tblStudent A Left Outer Join [tblScholarship] B on 
A.StudentId = B.Stuent_ref_id where Scholarship_Amount is null
SQL Server Advanced Questions – ‘Tricky Query’

Select top 1* from tblStudent order by NEWID()

Select Top 6 * INTO tblStudent_clone From tblstudent
note- ‘tblStudent_clone’ will be create in sample database


Select LEN('TECHSTUDY') - LEN (REPLACE('TECHSTUDY', 'T', ''))

Select UPPER(SUBSTRING(Firstname, 1,1))+ 
LOWER(SUBSTRING(Firstname, 2, Len(FirstName)-1))As Firstname from tblStudent
 Also check Top C# interview questions and answers

-- Висновки: я навчився на практиці використовувати команди sql та умілому використанню бази даних
