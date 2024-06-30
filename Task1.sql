-- ENTRI DSML COURSE - MYSQL TASK 1

-- Create a Database name entri_assignment

CREATE DATABASE entri_assignment;
USE ENTRI_ASSIGNMENT;
-- Create a Table with name departments
-- Department_id (pk)  Department_name  Location_id  
CREATE TABLE IF NOT EXISTS departments(
Department_id INT NOT NULL PRIMARY KEY,
Department_name VARCHAR(100) NOT NULL,
Location_id INT NOT NULL
);

DESCRIBE departments;

-- Create a Table with name employees
-- Employee_id  (pk)  ,first_name,last_name ,email,phone_number,hire_date, 
-- job_id, salary, commission_pct, manager_id, department_id (fk reference

CREATE TABLE IF NOT EXISTS employees(
Employee_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
email VARCHAR(50) ,
phone_number VARCHAR(20),
hire_date DATE,
job_id VARCHAR(10) ,
salary INT,
commission_pct FLOAT(4,2),
manager_id INT,
department_id INT,
FOREIGN KEY (department_id) REFERENCES departments(Department_id)
);

SHOW TABLES;

DESCRIBE employees;

-- ## Insert into Departments table

INSERT INTO departments VALUES ( 170 , 'Payroll' , 1700);

SELECT * FROM DEPARTMENTS;

-- Insert into Employees table

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO employees VALUES (101, 'Neena' , 'Kochhar' , 'NKOCHHAR' , '515.123.4568' , '1989-11-21' , 'AD_VP' , 17000 , NULL , 100 , 20);
INSERT INTO employees VALUES (102 , 'Lex' , 'De Haan' , 'LDEHAAN' , '515.123.4569' , '1993-09-12' , 'AD_VP' , 17000 , NULL , 100 , 30);
INSERT INTO employees VALUES (104 , 'Bruce' , 'Ernst' , 'BERNST' , '590.423.4568' , '1991-05-21',  'IT_PROG' , 6000 , NULL , 103 , 60);
INSERT INTO employees VALUES (105 , 'David' , 'Austin' , 'DAUSTIN' , '590.423.4569' , '1997-06-25',  'IT_PROG' , 4800 , NULL , 103 , 60);
INSERT INTO employees VALUES (106 , 'Valli' , 'Pataballa' , 'VPATABAL' , '590.423.4560' , '1998-02-05',  'IT_PROG' , 4800 , NULL , 103 , 40);
INSERT INTO employees VALUES (107 , 'Diana' , 'Lorentz' , 'DLORENTZ' , '590.423.5567' , '1999-02-09',  'IT_PROG' , 4200 , NULL , 103 , 40);
INSERT INTO employees VALUES (108 , 'Nancy' , 'Greenberg' , 'NGREENBE' , '515.124.4569' , '1994-08-17',  'FI_MGR' , 12000 , NULL , 101 , 100);
INSERT INTO employees VALUES (109 , 'Daniel' , 'Faviet' , 'DFAVIET' , '515.124.4169' , '1994-08-12',  'FI_ACCOUNT' , 9000 , NULL , 108 , 170);
INSERT INTO employees VALUES (110 , 'John' , 'Chen' , 'JCHEN' , '515.124.4269' , '1997-04-09',  'FI_ACCOUNT' , 8200 , NULL , 108 , 170);
INSERT INTO employees VALUES (111 , 'Ismael' , 'Sciarra' , 'ISCIARRA' , '515.124.4369' , '1997-02-01',  'FI_ACCOUNT' , 7700 , NULL , 108 , 160);
INSERT INTO employees VALUES (112 , 'Jose Manuel' , 'Urman' , 'JMURMAN' , '515.124.4469' , '1998-06-03', 'FI_ACCOUNT' , 7800 , NULL, 8 , 150);
INSERT INTO employees VALUES (114 , 'Den' , 'Raphaely' , 'DRAPHEAL' , '515.127.4561' , '1994-11-08',  'PU_MAN' , 11000 , NULL , 100 , 30);
INSERT INTO employees VALUES (115 , 'Alexander' , 'Khoo' , 'AKHOO' , '515.127.4562' , '1995-05-12',  'PU_CLERK' , 3100 , NULL , 114 , 80);
INSERT INTO employees VALUES (116 , 'Shelli' , 'Baida' , 'SBAIDA' , '515.127.4563' ,'1997-12-13', 'PU_CLERK' , 2900 , NULL , 114 , 70);
INSERT INTO employees VALUES (117 , 'Sigal' , 'Tobias' , 'STOBIAS' , '515.127.4564' , '1997-09-10', 'PU_CLERK' , 2800 , NULL , 114 , 30);
INSERT INTO employees VALUES (118 , 'Guy' , 'Himuro' , 'GHIMURO' , '515.127.4565' , '1998-01-02',  'PU_CLERK' , 2600 , NULL , 114 , 60);
INSERT INTO employees VALUES (119 , 'Karen' , 'Colmenares' , 'KCOLMENA' , '515.127.4566' , '1999-04-08',  'PU_CLERK' , 2500 , NULL , 114 , 130);
INSERT INTO employees VALUES (120 , 'Matthew' , 'Weiss' , 'MWEISS' , '650.123.1234' ,'1996-07-18',  'ST_MAN' , 8000 , NULL , 100 , 50);
INSERT INTO employees VALUES (122 , 'Payam' , 'Kaufling' , 'PKAUFLIN' , '650.123.3234' ,'1995-05-01',  'ST_MAN' , 7900 , NULL , 100 , 40);
INSERT INTO employees VALUES (123 , 'Shanta' , 'Vollman' , 'SVOLLMAN' , '650.123.4234' , '1997-10-12',  'ST_MAN' , 6500 , NULL , 100 , 50);
INSERT INTO employees VALUES (124, 'Kevin' , 'Mourgos' , 'KMOURGOS' , '650.123.5234' , '1999-11-12',  'ST_MAN' , 5800 , NULL , 100 , 80);
INSERT INTO employees VALUES (125, 'Julia' , 'Nayer' , 'JNAYER' , '650.124.1214' , '1997-07-02',  'ST_CLERK' , 3200 , NULL , 120 , 50);
INSERT INTO employees VALUES (126, 'Irene' , 'Mikkilineni' , 'IMIKKILI' , '650.124.1224' , '1998-11-12', 'ST_CLERK' , 2700 , NULL , 120 , 50);
INSERT INTO employees VALUES (127, 'James' , 'Landry' , 'JLANDRY' , '650.124.1334' , '1999-01-02' , 'ST_CLERK' , 2400 , NULL , 120 , 90);
INSERT INTO employees VALUES (128, 'Steven' , 'Markle' , 'SMARKLE' , '650.124.1434' , '2000-03-04' , 'ST_CLERK' , 2200 , NULL , 120 , 50);
INSERT INTO employees VALUES (130, 'Mozhe' , 'Atkinson' , 'MATKINSO' , '650.124.6234' , '1997-10-12' , 'ST_CLERK' , 2800 , NULL , 121 , 110);

SET FOREIGN_KEY_CHECKS = 1;

UPDATE EMPLOYEES
SET manager_id=108
WHERE Employee_id=112;

SELECT * FROM EMPLOYEES;

-- QUESTIONS
-- 1. Select employees first name, last name, job_id and salary whose first name starts with alphabet S

SELECT first_name, last_name, job_id, salary FROM EMPLOYEES WHERE first_name LIKE 'S%' ORDER BY first_name;

-- 2. Write a query to select employee with the highest salary  (using an inner query)

SELECT * FROM EMPLOYEES WHERE SALARY=(SELECT MAX(SALARY) FROM EMPLOYEES);

-- 3. Select employee with the second highest salary

SELECT * FROM EMPLOYEES WHERE SALARY=(SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 1,1);

-- 4. Write a query to select employees and their corresponding managers and their salaries

SELECT 
concat(e.first_name,' ',e.last_name) as Employee,
e.salary as Employee_salary,
concat(m.first_name,' ',m.last_name) Manager,
m.salary as Manager_salary
FROM employees e 
LEFT JOIN employees m
ON e.manager_id = m.Employee_id;

-- 5. Write a query to select employees and their corresponding managers and their salaries (SELF Join)

SELECT 
concat(e.first_name,' ',e.last_name) as Employee,
e.salary as Employee_salary,
concat(m.first_name,' ',m.last_name) Manager,
m.salary as Manager_salary
FROM employees e 
INNER JOIN employees m
ON e.manager_id = m.Employee_id
order by Manager;

-- 6. Create a view for the above query

CREATE VIEW EMPLOYEE_MANAGER_DETAILS AS
SELECT 
concat(e.first_name,' ',e.last_name) as Employee,
e.salary as Employee_salary,
concat(m.first_name,' ',m.last_name) Manager,
m.salary as Manager_salary
FROM employees e 
INNER JOIN employees m
ON e.manager_id = m.Employee_id
order by Manager;

 SHOW FULL TABLES;

-- 7. Write a query to show the count of employees under each manager in descending order (from view)

SELECT Manager, Count(Employee) Count 
FROM EMPLOYEE_MANAGER_DETAILS 
GROUP BY Manager 
ORDER BY Count DESC;

-- 8. Find the count of employees in each department

SELECT department_id, Count(*) Employee_Count
FROM employees 
GROUP BY department_id
ORDER BY department_id;

-- 9. Get the count of employees hired year wise

SELECT YEAR(hire_date) Year_of_Hiring, Count(*) Employee_Count
FROM employees 
GROUP BY Year_of_Hiring
ORDER BY Year_of_Hiring;

-- 10 . Create a stored procedure to get the “ Get the count of employees hired in the input year”(IN year , OUT count)

DELIMITER $$
CREATE PROCEDURE EMPLOYEE_COUNT (
IN Input_Year INT,
OUT No_of_Employees INT 
)
BEGIN 
SELECT Count(*) 
INTO No_of_Employees
FROM employees 
WHERE Input_Year = Year(HIRE_DATE);
END $$
DELIMITER ;

CALL EMPLOYEE_COUNT ('1997', @No_of_Employees);

SELECT @No_of_Employees;

-- 11.Select the employees whose first_name contains “an” 

SELECT * FROM EMPLOYEES 
WHERE first_name LIKE '%an%';

-- 12.  Select employee first name and the corresponding phone number in the format (_ _ _)-(_ _ _)-(_ _ _ _)

 SELECT first_name Name_of_Employee,
 CONCAT('(',SUBSTRING(phone_number,1,3),')-(', SUBSTRING(phone_number,5,3),')-(',SUBSTRING(phone_number,9,4),')')
 AS Phone_NUmber
 from employees;
 
 -- 13. Find the employees who joined in August, 1994.
 
 SELECT * FROM employees
 WHERE YEAR(hire_date)=1994 AND
 MONTH(hire_date)=08;
 
 -- 14. Find the maximum salary from each department.
 
 SELECT department_id, MAX(salary) AS Maximum_Salary
 FROM employees
 GROUP BY department_id
 ORDER BY department_id;
 
 -- 15.Write a SQL query to display the 5 least earning employees

SELECT DISTINCT first_name Employee_Name,
salary 
FROM EMPLOYEES
ORDER BY salary 
LIMIT 5;

-- 16. Find the employees hired in the 80s

SELECT CONCAT(first_name,' ', last_name) Employee,
hire_date Date_of_hiring
FROM employees
WHERE YEAR(hire_date) BETWEEN '1980' AND '1989';
 
-- 17. Find the employees who joined the company after 15th of the month

SELECT CONCAT(first_name,' ', last_name) Employee,
hire_date Date_of_hiring
FROM employees
WHERE DAY(hire_date)>15;