CREATE TABLE EmployeeInfo (EmployeeID int, FirstName varchar(50), LastName varchar(50), age int, gender varchar(50)) 

CREATE TABLE EmployeeSalary (EmployeeID int, Position varchar(50), Salary int) 

INSERT INTO EmployeeInfo VALUES 
(101, 'Mircea', 'Jigovan', 50, 'Male'),
(102, 'Elena', 'Maria', 25, 'Female'),
(103, 'Marcel', 'Florin', 35, 'Male'),
(104, 'Aurel', 'Ionel', 45, 'Male'),
(105, 'Marina', 'Stoian', 31, 'Female'),
(106, 'Raul', 'Doble', 42, 'Male'),
(107, 'Laura', 'Paul', 22, 'Female'),
(108, 'Marinela', 'Margaret', 32, 'Female'),
(109, 'Zidan', 'Pletea', 36, 'Male')

INSERT INTO EmployeeSalary VALUES 
(101, 'Salesman', 55000),
(102, 'Accountant', 25000),
(103, 'Receptionist', 30000 ),
(104, 'Salesman', 45000),
(105, 'Supplier Relations', 31000),
(106, 'Manager', 42000),
(107, 'HR', 22000),
(108, 'Salesman', 32000),
(109, 'Manager', 36000)

SELECT *
FROM jobs.dbo.EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

SELECT *
FROM EmployeeInfo
WHERE FirstName LIKE 'M%A%C%' and age <> 45

SELECT * FROM EmployeeInfo WHERE FirstName IS NOT NULL

DELETE FROM EmployeeInfo WHERE EmployeeID = 110

SELECT TOP 10 * FROM EmployeeInfo 

SELECT * 
FROM EmployeeInfo
WHERE FirstName IN ('Mircea', 'ELENA')

SELECT gender, age, COUNT(gender)
FROM EmployeeInfo
WHERE age>=31 
GROUP BY gender, age 

SELECT * 
FROM EmployeeSalary 
ORDER BY Salary DESC

SELECT *
FROM EmployeeSalary
ORDER BY 2 DESC, 3

INSERT INTO EmployeeInfo VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly','Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

INSERT INTO EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)

SELECT *
FROM EmployeeInfo

SELECT *
FROM EmployeeSalary

SELECT *
FROM EmployeeInfo
JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeInfo
FULL OUTER JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID

SELECT*
FROM EmployeeInfo
LEFT OUTER JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID

SELECT*
FROM EmployeeInfo
RIGHT OUTER JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID

SELECT EmployeeInfo.EmployeeID, FirstName, LastName, Position, Salary 
FROM EmployeeInfo
JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID

SELECT FirstName, LastName, Position, Salary
FROM EmployeeInfo
FULL OUTER JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID
WHERE FirstName IN ('Laura', 'MARINA', 'RAUL')

SELECT Position, AVG(SALARY)
FROM EmployeeInfo
JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID
WHERE Position = 'Manager'
GROUP BY Position 

INSERT INTO EmployeeInfo VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

CREATE TABLE WareHouseEmployeeInfo
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

INSERT INTO WareHouseEmployeeInfo VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

DELETE FROM EmployeeInfo WHERE FirstName IN ('RYAN', 'HOLLY', 'DARRYL')

SELECT * 
FROM EmployeeInfo
FULL OUTER JOIN WareHouseEmployeeInfo
ON EmployeeInfo.EmployeeID=WareHouseEmployeeInfo.EmployeeID

SELECT * 
FROM EmployeeInfo
UNION ALL
SELECT *
FROM WareHouseEmployeeInfo
ORDER BY EmployeeID

SELECT EmployeeID, FirstName, age
FROM EmployeeInfo
UNION
SELECT *
FROM EmployeeSalary

SELECT FirstName, LastName, age,
CASE
	WHEN LastName='PAUL' THEN 'FUMAT'
	WHEN age<30 THEN 'young' 
	WHEN age BETWEEN 30 AND 40 THEN 'OK SURE'
	ELSE 'OLD'
END
FROM EmployeeInfo
WHERE age IS NOT NULL
ORDER BY age

SELECT FirstName, LastName, Position, Salary,
CASE
	WHEN Position = 'Salesman' THEN Salary + (Salary * .10)
	WHEN Position = 'ACCOUNTANT' THEN Salary + (Salary * .05)
	WHEN Position = ' MANAGER' THEN Salary + (Salary * .04)
	ELSE (Salary + Salary * .01) 
END AS RaisedSalary
FROM EmployeeInfo
JOIN EmployeeSalary
	ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID

SELECT Position, COUNT(POSITION)
FROM EmployeeInfo
JOIN EmployeeSalary
	ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY Position
HAVING COUNT(POSITION) > 1

SELECT POSITION, AVG(SALARY)
FROM EmployeeInfo
JOIN EmployeeSalary
	ON EmployeeInfo.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY Position
HAVING AVG(SALARY) > 30000
ORDER BY AVG(SALARY)

SELECT *
FROM EmployeeInfo

UPDATE EmployeeInfo
SET EmployeeID = 1012
WHERE FirstName = 'HOLLY' AND LastName = 'FLAX'

UPDATE EmployeeInfo 
SET AGE = 30, gender = 'Female'
WHERE EmployeeID = 1012

DELETE --USE SELECT INSTEAD OF DELETE TO TEST WHAT YOU DELETE AS THE DATA DELETED CAN NOT BE ROCOVERED
FROM EmployeeInfo
WHERE EmployeeID = 105

SELECT FirstName + ' ' + LastName AS FullName
FROM EmployeeInfo

SELECT SAL.Position, INFO.age,
CASE
	WHEN INFO.AGE > 30 THEN 'THIS' 
	ELSE 'THAT' 
END AS ThisThat
FROM EmployeeInfo INFO
JOIN EmployeeSalary SAL
	ON INFO.EmployeeID = SAL.EmployeeID
ORDER BY INFO.AGE

SELECT FirstName, LastName, Salary, gender, 
COUNT(gender) OVER (PARTITION BY gender) AS TotalGender
FROM EmployeeInfo INFO
JOIN EmployeeSalary SAL
	ON INFO.EmployeeID = SAL.EmployeeID