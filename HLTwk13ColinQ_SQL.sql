CREATE DATABASE Employees;

create table    Employee_Details (
  	EmpID int,
    Name varchar(40),
    Title enum('Mr','Ms','Mrs'),
    Age int,
    StartDate date,
    Grade char(1),
    Salary decimal,
  	ContractType enum("Perm","Temp") DEFAULT "Perm",
  	PRIMARY KEY (EmpID),
	UNIQUE (EmpID)
);
insert into Employee_Details (EmpID, Name, Title, Age, StartDate, Grade, Salary)
values 	(1, "Colin", "Mr", 33, "1988-01-01", "A", 20000.1),
		(2, "John", "Mr",21,"2012-01-02","C",34000.41),
		(3, "Jim", "Mr", 43, "2002-07-05","D",60000.99),
		(4,"Jane", "Mrs", 36, "2001-05-08","E",62000.11),
		(5,"Joe", "Mr", 23, "2020-03-01","G",22000.11),
		(6,"Milly", "Ms", 37, "2022-02-10","F",18000.11);

create table    Employee_Appraisals (
  ApprID int,
  EmpID int,
  ReviewDate date,
  SelfScore char(2),
  MgrScore char(2),
  AgreedScore char(2),
  Bonus int,
  PRIMARY KEY (ApprID),
  UNIQUE (ApprID)
);
insert into Employee_Appraisals(ApprID, EmpID, ReviewDate, SelfScore, MgrScore, AgreedScore, Bonus)
values	(1,1,"2020-01-01","A","B","A-","1000"),
		(2,1,"2019-02-22","B","B","B","500"),    
        (3,2,"2020-01-01","C+","C+","C+","410"),
        (4,2,"2019-02-22","C+","C+","C+","420"),
		(5,3,"2020-01-01","D","A-","C-","430"),
        (6,3,"2019-02-22","D","A-","C-","440"),
        (7,4,"2020-01-01","A","C","B-","510"),
        (8,4,"2019-02-22","E","F","F","0"),
        (9,5,"2020-01-01","D","C","C","560"),
        (10,5,"2019-02-22","C","A","B","870"),
		(11,6,"2020-01-01","D","C","C","680");
        
--#1
EXPLAIN Employee_Details;

--#2
EXPLAIN Employee_Appraisals;

--#3
Update Employee_Appraisals
set Bonus = "900"
where AgreedScore = "B";

--#4
SELECT * FROM Employee_Details; 

--#5
SELECT * FROM Employee_Appraisals;

--#6
delete from Employee_Details where EmpID = 1;

--#7
SELECT Employee_Details.EmpID,Employee_Details.Name,Employee_Appraisals.Bonus, Employee_Appraisals.ReviewDate
FROM Employee_Details 
Left JOIN Employee_Appraisals
ON Employee_Details.EmpID=Employee_Appraisals.EmpID;

--#8
SELECT * FROM Employee_Appraisals; 

--#9 Simple Query
Select * from Employee_Appraisals where bonus >600;

#--10 Complex query
SELECT Employee_Details.EmpID,Employee_Details.Name,Employee_Appraisals.Bonus 
FROM Employee_Details 
Left JOIN Employee_Appraisals
ON Employee_Details.EmpID=Employee_Appraisals.EmpID
where  Employee_Appraisals.bonus > 600;

#--11 Retrieve all and order
Select Employee_Details.EmpID,Employee_Details.Name,Employee_Appraisals.Bonus, Employee_Appraisals.ReviewDate 
FROM Employee_Details 
Left JOIN Employee_Appraisals
ON Employee_Details.EmpID=Employee_Appraisals.EmpID
ORDER BY bonus asc;

#--12 Filter data using comparison operators
Select Employee_Appraisals.Empid, Employee_Appraisals.Bonus, Employee_Appraisals.ReviewDate 
FROM Employee_Appraisals where bonus >400 and bonus < 800
ORDER BY bonus asc;