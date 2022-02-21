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
  	PRIMARY KEY (Name),
	UNIQUE (EmpID)
);
insert into Employee_Details (EmpID, Name, Title, Age, StartDate, Grade, Salary)
values 	(1, "Colin", "Mr", 33, "1988-01-01", "A", 20000.1),
		(2, "John", "Mr",21,"2012-01-02","C",34000.41),
		(3, "Jim", "Mr", 43, "2002-07-05","D",60000.99),
		(4,"Jane", "Mrs", 36, "2001-05-08","E",62000.11),
		(5,"Joe", "Mr", 23, "2020-03-01","G",22000.11),
		(6,"Milly", "Ms", 37, "2022-02-10","F",18000.11);

EXPLAIN Employee_Details;