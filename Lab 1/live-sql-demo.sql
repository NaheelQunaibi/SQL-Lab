-- Lab1: Introduction
-- Basic Select Statement

-- Question1
-- Write a query to display all employee’s
-- information.
SELECT *
FROM HR.EMPLOYEES;

-- Question2
-- Write a query to display all department’s
-- information.
SELECT *
FROM HR.DEPARTMENTS;

-- Question3
-- Write a query to display all department’s
-- names and their location.
SELECT DEPARTMENT_NAME, LOCATION_ID
FROM HR.DEPARTMENTS;

-- Question4
-- Write a query to display all information in
-- JOB_HISTORY table.
SELECT *
FROM HR.JOB_HISTORY;

-- Question5
-- Write a query to display all employee’s names
-- and their salaries and their annual salaries.
SELECT LAST_NAME, SALARY, (SALARY*12) AS ANNUAL_SALARY
FROM HR.EMPLOYEES;

-- Question6
-- Modify the previous query where each
-- employee gets $100 bonus for each month.
SELECT LAST_NAME, SALARY+100, (SALARY+100)*12 AS ANNUAL_SALARY
FROM HR.EMPLOYEES; 

-- Question7
-- Write a query to display all employee’s
-- numbers, names and their annual income.
SELECT LAST_NAME, PHONE_NUMBER, SALARY*12 AS ANNUAL_SALARY
FROM HR.EMPLOYEES;

-- Question8
-- Write a query to display all employee’s numbers,
-- names and their annual income
-- Note: use appropriate column heading.
-- DONE ON Q7

-- Question9
-- Write a query to display all employee’s names and
-- their jobs.
-- Note: format must be as the following example
-- CLARK is a MANAGER
SELECT LAST_NAME ||' is a '|| JOB_ID
FROM HR.EMPLOYEES;

-- Question10
-- Write a query to display all job positions in
-- EMPLOYEES table.
SELECT DISTINCT JOB_ID
FROM HR.EMPLOYEES;

-- Question11
-- Display table structure for EMPLOYEES and
-- DEPTARTMENTS tables.
DESC HR.EMPLOYEES
DESC HR.DEPARTMENTS

-- Question12
-- Write a query to display all employee’s information
-- whose salary $2800 or more and less than or equal
-- $3500.
SELECT *
FROM HR.EMPLOYEES
WHERE SALARY>= 2800 AND SALARY <= 3500;

-- Question13
-- Write a query to display all employee’s information
-- whose job FI_MGR.
SELECT *
FROM HR.EMPLOYEES
WHERE JOB_ID = 'FI_MGR';

-- Question14
-- Write a query to display all employee’s
-- information whose salary $2800 or more and less
-- than or equal $3500.
SELECT * 
FROM HR.EMPLOYEES
WHERE SALARY BETWEEN 2800 AND 3500;

-- Question15
-- Write a query to display employee’s numbers,
-- names and salaries whose salary $800 or $3000
-- or $5000.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY 
FROM HR.EMPLOYEES
WHERE SALARY IN (300, 3000, 5000);

-- Question16
-- Write a query to display all employee’s
-- information for employees whose names
-- contain letter A.
SELECT * 
FROM HR.EMPLOYEES
WHERE LAST_NAME LIKE '%A%';

-- Question17
-- Write a query to display all employee’s
-- information for employees whose names
-- contain letter A and contain four letters.
SELECT * 
FROM HR.EMPLOYEES
WHERE LAST_NAME LIKE '%A%' AND LAST_NAME LIKE  '____';

-- Question18
-- Write a query to display names, jobs and
-- salaries for employees who get more than
-- $2650 and their job IT_PROG.
SELECT LAST_NAME, JOB_ID, SALARY
FROM HR.EMPLOYEES
WHERE SALARY >= 2650 AND JOB_ID = 'IT_PROG';

-- Question19
-- Write a query to display names, jobs and
-- salaries for employees who do not get $800,
-- $3000 or $5000.
SELECT LAST_NAME, JOB_ID, SALARY
FROM HR.EMPLOYEES
WHERE SALARY NOT IN (800, 3000, 5000);

-- Question20
-- Write a query to display all employee’s
-- information for employees who have known
-- commission.
SELECT *
FROM HR.EMPLOYEES
WHERE COMMISSION_PCT;
-- MAYBE THERE IS ANOTHER WAY

-- Question21
-- Write a query to display all employee’s
-- information, sort output according to hire date
-- form most recently hired to least hire date.
SELECT *
FROM HR.EMPLOYEES
ORDER BY  HIRE_DATE DESC;

-- Question22
-- Write a query to display all employee’s names
-- and their annual income sort output according
-- to annual income in ascending.
SELECT LAST_NAME, SALARY*12 AS ANNUAL_SALARY
FROM HR.EMPLOYEES
ORDER BY  ANNUAL_SALARY;