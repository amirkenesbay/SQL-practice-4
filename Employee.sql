CREATE TABLE Departments (
    Code INTEGER PRIMARY KEY NOT NULL,
    Name NVARCHAR NOT NULL ,
    Budget REAL NOT NULL
);

CREATE TABLE Employees (
    SSN INTEGER PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL ,
    LastName VARCHAR NOT NULL ,
    Department INTEGER NOT NULL ,
    CONSTRAINT fk_Departments_Code FOREIGN KEY(Department)
    REFERENCES Departments(Code)
);

INSERT INTO Departments (Code, Name, Budget) VALUES (14, 'IT', 65000);
INSERT INTO Departments (Code, Name, Budget) VALUES (37, 'Accounting', 15000);
INSERT INTO Departments (Code, Name, Budget) VALUES (59, 'Human Resources', 240000);
INSERT INTO Departments (Code, Name, Budget) VALUES (77, 'Research', 55000);

INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('123234877', 'Michael', 'Rogers', 14);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('152934485', 'Anand', 'Manikutty', 14);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('222364883', 'Carol', 'Smith', 37);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('326587417', 'Joe', 'Stevens', 37);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('332154719', 'Mary-Anne', 'Foster', 14);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('332569843', 'George', 'O''Donnell', 77);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('546523478', 'John', 'Doe', 59);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('631231482', 'David', 'Smith', 77);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('654873219', 'Zacary', 'Efron', 59);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('745685214', 'Eric', 'Goldsmith', 59);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('845657245', 'Elizabeth', 'Doe', 14);
INSERT INTO Employees (SSN, Name, LastName, Department) VALUES ('845657246', 'Kumar', 'Swamy', 14);

SELECT LastName FROM Employees2;

SELECT DISTINCT LastName FROM Employees2;

SELECT * FROM Employees2 WHERE LastName = 'Smith';

SELECT * FROM Employees2 WHERE LastName IN ('Smith', 'Doe');

SELECT * FROM Employees2 WHERE Department = 14;

SELECT * FROM Employees2 WHERE Department IN (37, 77);

SELECT * FROM Employees2 WHERE LastName LIKE 'S%';

SELECT sum(Budget) FROM Departments;

SELECT Department, count(*) FROM Employees2 GROUP BY Department;

SELECT * FROM Employees2 E INNER JOIN Departments D on D.Code = E.Department;

SELECT Employees2.Name, LastName, D.Name, D.Budget FROM Employees2 INNER JOIN Departments D on D.Code = Employees2.Department  GROUP BY Employees2.Name, LastName, D.Name, D.Budget;

SELECT Employees2.Name, LastName FROM employees2 INNER JOIN Departments D on D.Code = Employees2.Department AND D.Budget > 60000;

SELECT * FROM Departments WHERE Budget > (SELECT avg(Budget) FROM Departments);

SELECT Departments.Name FROM Departments INNER JOIN Employees2 E on Departments.Code = E.Department GROUP BY Departments.Name HAVING count(*) > 2;

INSERT INTO Departments (Code, Name, Budget) VALUES (11, 'Quality Assurance', 40000);

INSERT INTO Employees2 (SSN, Name, LastName, Department) VALUES ('847219811', 'Mary', 'Moore', 11);

UPDATE Departments SET Budget = Budget * 0.9;

UPDATE Employees2 SET Department = 14 WHERE Department = 77;

DELETE FROM Employees2 WHERE Department = 14;

DELETE FROM Employees2 WHERE Department IN (SELECT Code FROM Departments WHERE Budget >= 60000);

DELETE FROM Employees2;