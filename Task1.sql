
CREATE TABLE Department (
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(100) NOT NULL UNIQUE
);

CREATE TABLE Position (
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(100) NOT NULL UNIQUE,
	Mission nvarchar(100) NOT NULL UNIQUE,
	Wage int,
	DepartmentId int REFERENCES Department(Id)
);

SELECT Department.Name  'Name',
	   Position.Name  'Name',
	   Position.Mission  'Mission'
FROM Position
JOIN Department ON Department.Id = Position.DepartmentId;

SELECT Department.Name  'Name',
	   Position.Name  'Name',
	   Position.Mission  'Mission'
FROM Department
LEFT JOIN Position ON Department.Id = Position.DepartmentId;

SELECT Department.Name  'Name',
	   Position.Name  'Name',
	   Position.Mission  'Mission'
FROM Department
RIGHT JOIN Position ON Department.Id = Position.DepartmentId;

-- FULL Join
SELECT Employee.Name  'Ali',
       Employee.Name  'Name',
       Position.Mission  'Mission'
FROM Department AS Employee
FULL JOIN Position AS Position ON Employee.Id = Position.DepartmentId;


CREATE TABLE Positions (
	Id int PRIMARY KEY IDENTITY,
	Role nvarchar(255) NOT NULL,
	DependOn int
);

SELECT p1.Role, p2.Role AS 'Depend on'
FROM Positions p1
LEFT JOIN Positions p2 ON p1.DependOn = p2.Id;

CREATE TABLE Sizes (
	Id int PRIMARY KEY IDENTITY,
	Size varchar(10) NOT NULL
);

CREATE TABLE Products (
	Id int PRIMARY KEY IDENTITY,
	Name varchar(100) NOT NULL
);

SELECT Name, Size
FROM Products
CROSS JOIN Sizes;
