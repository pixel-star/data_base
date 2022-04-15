-- Лабораторна робота № 2
-- З дисципліни Бази даних
-- Студента групи МІТ-31 Кульбачинського Данила

--1 Get all students details from the tblstudent table.

Select * from tblstudent

--2 Get first name from the tblstudent using alias name “StudentName”.

Select FirstName as StudentName from tblstudent

--3 Get first name, last name from the tblstudent table.

Select FirstName, LastName from tblstudent

--4 Select student details whose name is “David” from tblstudent.

Select * from tblstudent where FirstName = 'David'

--5 Get first name from tblstudent in upper case.

Select upper(FirstName) from tblstudent 

--6 Get last name from tblstudent in lower case.

Select lower(FirstName) from tblstudent 

--7 Get unique branch from tblstudent table.

Select distinct(Branch) from tblstudent

--8 Write a query to combine FirstName and LastName and display it as “Full Name”.

Select FirstName +' '+ LastName As "Full Name" from tblstudent 

--9 Get all student details from tblstudent whose “FirstName” contains ‘a’.

Select * from tblstudent where FirstName like '%A%'

--10 Get all student details from tblstudent whose “FirstName” start with latter ‘d’.

Select * from tblstudent where FirstName like 'D%'

--11 Get all student details from tblstudent whose “FirstName” end with ‘a’.

Select * from tblstudent where FirstName like '%a'

--12  List all students whose first name start with ‘Ma’ or ‘Da’.

SELECT FirstName, LastName, Branch FROM
 tblStudent WHERE firstname LIKE '%Ma%' OR firstname LIKE '%Da%'

--13 Get all students details from the tblStudent table order by FirstName Ascending.

Select * from tblStudent order by FirstName asc

--14 Get all students details from the tblStudent table order by FirstName Descending

Select * from tblStudent order by FirstName desc

--15 Get all students details from the tblStudent table order by LastName Ascending and Admission fees descending.

Select * from tblStudent order by LastName asc, Admission_Fee desc

--16 Get position of ‘v’ in name ‘David’ from tblstudent.

Select CHARINDEX('v', FirstName,0) from tblstudent where FirstName = 'David'

--17 Select firstname from tblstudent with ‘Hello’ prefix.

select 'Hello ' + firstname from tblStudent

--18 Get FirstName from tblstudent after removing white spaces from right side.

Select RTRIM(FirstName) from tblstudent

--19 Get FirstName from tblstudent after removing white spaces from left side.

Select LTRIM(FirstName) from tblstudent

--20 Get length of FirstName from tblstudent.

Select len(FirstName) from tblstudent

--21 Get FristName from tblStudent table after replacing ‘a’ with ‘$’.

Select REPLACE(FirstName,'a','$') from tblStudent

--22 Get all students details from tblStudent whose first name starts with ‘m’ and name contains 4 letters.

Select * from tblStudent where FirstName like 'm___'

--23 Get all students details from tblStudent whose first name ends with ‘a’ and name contains 4 letters.

Select * from tblStudent where FirstName like '___a' 

--24 Get fristname from tblstudent not start with any single character between a-p.

select * from tblStudent where FirstName like '[^a-p]%'

--25 Get first name, admission year, admission month and admission date from tblStudent table.

select SUBSTRING (convert(varchar,admission_date,103),7,4) as Year,
SUBSTRING (convert(varchar,admission_date,100),1,3) as Month, 
SUBSTRING (convert(varchar,admission_date,100),5,2) as Date
from tblStudent

--26 Get student details from tblStudent table whose admission year is “2015”.

Select * from tblStudent where SUBSTRING(convert(varchar,Admission_date,103),7,4)='2015'

--27 Get student details from tblStudent table whose admission date is after January 31st.

Select * from tblStudent where Admission_date >'01/31/2016'

--28 Get student details from tblStudent table whose admission date is before January 31st.

Select * from tblStudent where Admission_date <'01/31/2016'

--29 Get student details from tblStudent table whose admission month is “January”.

Select * from tblStudent where SUBSTRING(convert(varchar,Admission_date,100),1,3)='Jan'

--30 Get admission date and time from tblStudent table.

Select convert(varchar(19), admission_date,121) from tblStudent

--31 Get database date.

select getdate()
 
--32 Get UTC date.

select GETUTCDATE()

--33 Get only month part of admission date from tblStudent.

select DATEPART(MONTH, admission_date) from tblStudent

--34 Get only year part of admission date from tblStudent.

select DATEPART(YEAR, admission_date) from tblStudent

--35 Get all student details from tblStudent table whose admission date between ‘2015-01-01’ and ‘2016-01-01’.

select * from tblStudent where admission_date between '2015-01-01' and '2016-01-01'

--36 Get the first name, last name, current date, admission date and difference between current date and admission date in days.

select FirstName, LastName, GETDATE() as 'Current_date', Admission_date,
DATEDIFF(DD, Admission_date, GETDATE()) As days from tblStudent

--37 Get the first name, last name, current date, admission date and difference between current date and admission date in month.

select FirstName, LastName, GETDATE() as 'Current_date', Admission_date,
DATEDIFF(MM, Admission_date, GETDATE()) As months from tblStudent

--38 Get the first name, last name, current date, admission date and difference between current date and admission date in year.

select FirstName, LastName, GETDATE() as 'Current_date', Admission_date,
DATEDIFF(YYYY, Admission_date, GETDATE()) As years from tblStudent

--39  Show “AdmissionDate” in “dd mmm yyyy” format, ex- “06 May 2016”.

select CONVERT(varchar(30), admission_date, 106) from tblStudent

--40 Show “AdmissionDate” in “yyyy/mm/dd” format, ex- “2016/05/06”.

select CONVERT(varchar(30), admission_date, 111) from tblStudent

--41  Show only time part of the “AdmissionDate” from tblStudent

Select CONVERT(varchar(20), admission_date, 108) from tblStudent

--42 Select no of students get admission with respect to year and month from tblStudent table.

select datepart (YYYY,Admission_date) Admission_Year, datepart (MM,Admission_date)
Admission_Month,count(*) Total_Student from tblStudent group by datepart(YYYY,Admission_date),
datepart(MM,Admission_date)

--43 Select TOP Nth (any number) admission fees from tblStudent table

select top 1 * from tblStudent

--44 Select second highest admission fees from “tblStudent” table.

Select TOP 1 Admission_fee from (Select TOP 2 Admission_fee from tblStudent
order by Admission_fee DESC) T Order By Admission_fee ASC

--45 Select TOP 2 Admission fees from tblStudent table

select top 2 * from tblStudent order by Admission_fee desc

--46 Select Highest Admission fees from tblStudent table.

Select Max(Admission_fee) from (select top 6 * from tblStudent) A

--47 Select Minimum Admission fees from tblStudent table.

Select Min(Admission_fee) from (select top 6 * from tblStudent) A

--48 Select FirstName, LastName from tblStudent table in singal column.

select FirstName from tblStudent union select LastName from tblStudent

--49 Get students details from “tblStudent” table whose admission fees is less than 15000.

Select * from tblStudent where Admission_fee < 15000

--50 Get students details from “tblStudent” table whose admission fees is greater than 15000.

Select * from tblStudent where Admission_fee > 15000

--51 Get students details from “tblStudent” table whose admission fees in between 10000 and 15000.

Select * from tblStudent where Admission_fee between 10000 and 15000

--52 Select 5 % of admission fees from sara , 10% of admission fees from Dora and for other 15 % of admission fees as ‘Deducted_Admission_fee’ from tblStudent table.

SELECT FirstName, CASE FirstName WHEN 'Sara' THEN Admission_fee * .10 WHEN 'Dora' THEN Admission_fee * .15 ELSE Admission_fee * .15

--53 Write a query to get how many students exist in tblstudent.

select COUNT(*) from tblStudent

--54 Write the query to get the branch and branch wise total(sum) admission fees, display it in ascending order according to admission fees.

Select Branch, SUM(admission_fee) as Total_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) ASC

--55 Write the query to get the branch and branch wise total(sum) admission fees, display it in desending order according to admission fees.

Select Branch, SUM(admission_fee) as Total_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) DESC

--56 Get branch wise average admission fees from “tblStudent” table order by admission fees ascending order.

Select Branch, AVG(admission_fee) as Average_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) ASC

--57 Get branch wise maximum admission fees from “tblStudent” table order by admission fees descending order.

Select Branch, MAX(admission_fee) as Maxmum_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) DESC

--58 Get branch wise minimum admission fees from “tblStudent” table order by admission fees ascending order.

Select Branch, MIN(admission_fee) as Minimum_admission_fees from tblStudent
group by Branch order by SUM(admission_fee) ASC

--59 Get branch, no of students in a branch, total admission fees with respect to a branch from tblStudent table order by admission fees descending.

Select Branch,count(FirstName),sum(admission_fee) Admission_fee from tblStudent
group by Branch order by Admission_fee desc

--60 Select no of students joined with respect to year and month from tblStudent table.

select datepart (YYYY,Admission_date) Admission_year,datepart (MM,Admission_date) Admission_month,
count(*) Total_student from tblStudent group by datepart(YYYY,Admission_date), datepart(MM,Admission_date)
SQL Server Advanced Questions – ‘Join’ questions

--61 Select FirstName, Lastname, Scholarship amount from tblStudent and tblScholarship table for all students even if they didn’t get Scolarship.

Select Firstname, Lastname, Scholarship_Amount from tblStudent A left join tblScholarship
 B on A.StudentId = B.Student_ref_id

--62 Select FirstName, Lastname, Scholarship amount from tblStudent and tblScolarship table for those students who got Scolarship amount.

Select Firstname, Lastname, Scholarship_Amount from tblStudent A Inner join tblScholarship 
B on A.StudentId = B.Student_ref_id

--63 Select FirstName, Lastname, Scholarship amount from tblStudent and tblScholarship table for those students who got Scolarship amount greater than 1200.

Select Firstname, Lastname, Scholarship_Amount from tblStudent A Inner join tblScholarship 
B on A.StudentId = B.Student_ref_id and Scholarship_Amount > 1200

--64 Select FirstName, Lastname, Scholarship amount from tblStudent and tblScholarship table for those students who got Scolarship amount using right join.

Select Firstname, Lastname, isnull(Scholarship_Amount,0) from tblStudent A right join 
tblScholarship B on A.StudentId = B.Student_ref_id

--65 Select FirstName, Lastname, Scholarship amount from tblStudent and tblScholarship table for all students even if they didn’t get Scolarship amount and set Scolarship amount as 0 for those students who didn’t get Scolarship amount.

Select Firstname, Lastname, ISNULL(Scholarship_Amount,0) from tblStudent a left join
tblScholarship B on A.StudentId = B.Student_ref_id
 Also check Top C# interview questions and answers

--66 Write a query to find out the studentname who has not received any scholarship amount, and display 0 in front of his name.

Select Firstname, ISNULL(Scholarship_Amount, 0) As [Scholarship Amount]
from tblStudent A Left Outer Join [tblScholarship] B on 
A.StudentId = B.Stuent_ref_id where Scholarship_Amount is null
SQL Server Advanced Questions – ‘Tricky Query’

--67 How to select random record form a tblstudent

Select top 1* from tblStudent order by NEWID()

--68 Write a query to create a clone of existing table without using Create Command.

Select Top 6 * INTO tblStudent_clone From tblstudent
note- ‘tblStudent_clone’ will be create in sample database

--69 Write a query to calculate number of T in string ‘TECHSTUDY’.

Select LEN('TECHNOLOGY') - LEN (REPLACE('TECHNOLOGY', 'T', ''))

--70  Write down the query to print first letter of a Name in Upper Case and all other letter in Lower Case.

Select UPPER(SUBSTRING(Firstname, 1,1))+ 
LOWER(SUBSTRING(Firstname, 2, Len(FirstName)-1))As Firstname from tblStudent

--71 How to select random record form a tblstudent.

Select top 1* from tblStudent order by NEWID()

--72 Write a query to create a clone of existing table without using Create Command.

Select Top 6 * INTO tblStudent_clone From tblstudent


--77 Write down the query to display all student name in one cell seprated by ‘,’ example:-“Sara, David, Dora, Jack, Vikram, Ross”.

Declare @name varchar(MAX) = ''
Select @name = @name + FirstName + ', ' from [tblStudent]
Select SUBSTRING(@name,1, LEN(@name)) As StudentList


--78 Write down the query to create tblstudent table with primary key

Create table tblstudent(
StudnetId int identity(1,1) Not null primary key, 
Firstname varchar(50), 
LastName varchar(50), 
Admission_fee int, 
Admission_date date, 
Branch date
)

--79 How to set Primary key(PK) using Alter command

Alter table tblstudent3 add primary key(StudnetId)

--80 How to drop Primary key(PK) using Alter command

ALTER TABLE tblstudent
DROP CONSTRAINT PK__tblstudentid

--81  Write a query to add new column in tblstudent

ALTER TABLE tblstudent
ADD Address varchar(50)

--82 Write a query to drop Address column in tblstudent

ALTER TABLE tblstudent
DROP Column Address

--83 PATH

SELECT ANY_PATH FROM RESOURCE_VIEW
WHERE EQUALS_PATH(res, '/sys/schemas/OE/www.pqr.com')=3;

--84 DUMP is one of the important string/char functions

SELECT DUMP('pqr', 1033)
FROM DUAL;

--85 CARDINALITY is utilized to obtain the number of components

SELECT product_id, CARDINALITY(ad_mydocs_get)
FROM my_media_table;

--86 TZ_OFFSET gives the time zone offset identical to the case based on the date the statement is given

SELECT TZ_OFFSET('US/Eastern') FROM DUAL;

--87 The SOUNDEX function delivers a character string comprising the description of char

SELECT last_name, first_name
FROM hr.emp
WHERE SOUNDEX(last_name)
= SOUNDEX('SCOTTY');

--88 COSH is used to deliver the hyperbolic cosine of a number

SELECT COSH(0) "COSH of 0" FROM DUAL;

--89 WIDTH_BUCKET is used to obtain the bucket number

SELECT emp_id, first_name,last_name,dept_id,mgr_id,
WIDTH_BUCKET(department_id,20,40,10) "Exists in Dept"
FROM emp
WHERE mgr_id < 300
ORDER BY "Exists in Dept";

--90 NANVL is utilized to deliver an optional value n1 if the inserted value n2 is NaN (not a number), and gives n2 if n2 is not a number

SELECT bin_float, NANVL(bin_float,0)
FROM my_demo_table;

--91 WITH Common Table Expressions

WITH all_emp
AS
(
SELECT empId, BossId, FirstName, LastName
FROM Emp
WHERE BossId is NULL
 
UNION ALL
 
SELECT e.empId, e.BossId, e.FirstName, e.LastName
FROM Emp e INNER JOIN all_emp r
ON e.BossId = r.Id
)
SELECT * FROM all_emp


--92 CLUSTER_SET can get the data in one of the couple steps

SELECT S.cluster_id, prob,
       CLUSTER_DETAILS(my_sample, S.cluster_id, 7 USING T.*) kset
FROM
  (SELECT v.*, CLUSTER_SET(my_sample, USING *) nset
    FROM mining_data
   WHERE client_id = 1000) T,
  TABLE(T.nset) Q
ORDER BY 2 DESC;  

--93 This example will add any records from the year 2018 to the archive.

INSERT INTO Yearly_Orders 
SELECT * FROM Orders 
WHERE Date<=1/1/2018

--94 Catching NULL Results

SELECT Item, Price * 
(QtyInStock + IFNULL(QtyOnOrder, 0)) 
FROM Orders

--95 list of customers by the region where there is at least one customer per region:

SELECT COUNT(ID), Region
FROM Customers
GROUP BY Region
HAVING COUNT(ID) > 0;

--96 Use COALESCE to return the first non-null expression

SELECT COALESCE(NULL,NULL,'ByteScout',NULL,'Byte')

--97 Use Convert to transform any value into a particular datatype

SELECT CONVERT(int, 27.64)

--98 It is an analytic query that computes the rank of a row in an arranged collection of rows.

SELECT eno,
dno,
salary,
DENSE_RANK() OVER (PARTITION BY dno ORDER BY salary) AS ranking
FROM employee;

--99 The query_partition_clause breaks the output set into distributions, or collections, of data.

SELECT eno, dno, salary,
AVG(salary) OVER () AS avg_sal
FROM employee;

--100  Finding the last five records from the table

Select * from Employee A where rownum <=8
union
select * from (Select * from Employee A order by rowid desc) where rownum <=8;

-- Висновки: я навчився на практиці використовувати команди sql та умілому використанню бази даних