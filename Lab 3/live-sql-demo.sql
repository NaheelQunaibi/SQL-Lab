-- Lab3:Group Functions and Subquery
-- Question1
-- Write a query to display maximum and minimum
-- salaries for department 10 and 30.
SELECT MIN(SALARY), MAX(SALARY)
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 30);

-- Question2
-- Write a query to display hire date for first hired
-- employee and hire date for the newest hired employee.
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
FROM HR.EMPLOYEES;

-- Question3
-- Write a query to display total ,average, maximum and
-- minimum for the paid salaries.
SELECT MIN(SALARY), MAX(SALARY), SUM(SALARY), AVG(SALARY)
FROM HR.EMPLOYEES;

-- Question4
-- Write a query to display total ,average, maximum and
-- minimum for the paid commissions.
SELECT MIN(COMMISSION_PCT), MAX(COMMISSION_PCT), SUM(COMMISSION_PCT), AVG(COMMISSION_PCT)
FROM HR.EMPLOYEES;

-- Question5
-- Write a query to display the total paid salaries for
-- each department.
SELECT DEPARTMENT_ID, SUM(SALARY)
FROM HR.EMPLOYEES
Group BY DEPARTMENT_ID;

-- Question6
-- Write a query to display the total paid salaries for
-- each department, exclude any departments that their
-- total salary less than $10000.
SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY
FROM HR.EMPLOYEES
Group BY DEPARTMENT_ID
HAVING TOTAL_SALARY >= 10000;

-- Question7
-- State whether the following query valid or not
SELECT DEPARTMENT_ID, JOB_ID, SUM(SALARY)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;
-- Not valid  
-- "JOB_ID": must appear in the GROUP BY clause or be used in an aggregate function

-- Question8
-- State whether the following query valid or not
SELECT DEPARTMENT_ID,SUM(SALARY)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID,JOB_ID;
-- Valid

-- Question9
-- Write a query to display all employee’s names, their
-- salaries and their job whose jobs same as job of
-- William Smith.
SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID
FROM HR.EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM HR.EMPLOYEES
                WHERE FIRST_NAME = 'William' AND LAST_NAME = 'Smith');

-- Question10
-- Write a query to display all employees names, their
-- hire dates and their departments numbers that was
-- hired after Tayler Fox and get more than employee
-- 184
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, DEPARTMENT_ID 
FROM HR.EMPLOYEES
WHERE HIRE_DATE > (SELECT HIRE_DATE
                   FROM HR.EMPLOYEES
                   WHERE FIRST_NAME = 'Tayler' AND LAST_NAME = 'Fox')
      AND SALARY > (SELECT SALARY
                    FROM HR.EMPLOYEES
                    WHERE EMPLOYEE_ID = 184);

-- Question11
-- Write a query to display all employees information who
-- have the get maximum paid salary.
SELECT *
FROM HR.EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM HR.EMPLOYEES);

-- Question12
-- Write a query to display departments and their
-- total paid salaries, exclude any department
-- that its total salary less than that of
-- department 30.
SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING TOTAL_SALARY > (SELECT SUM(SALARY) AS TOTAL_SALARY
                       FROM HR.EMPLOYEES
                       WHERE DEPARTMENT_ID = 30);

-- Question13
-- State weather the following query is valid or not
SELECT EMPLOYEE_ID , LAST_NAME
FROM HR.EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM HR.EMPLOYEES
                GROUP BY DEPARTMENT_ID);
-- Not valid to make it valid we need to change = to in

-- Question14
-- Write a query to display all employee’s
-- information whose less than any Stock Clerk
-- and they are not Stock Clerk.
SELECT * 
FROM HR.EMPLOYEES
WHERE سؤال مش واضح اقل من STOCK CLERK بالمرتب ولا شو 

-- Question15
-- Write a query to display employee’s numbers,
-- names and their salaries for employees who
-- earn more than the average salary and who
-- work in department with any employee with a
-- letter T in their names.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM HR.EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) 
                FROM HR.EMPLOYEES)
      AND DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID
                             FROM HR.EMPLOYEES
                             WHERE FIRST_NAME LIKE '%T%' OR LAST_NAME LIKE '%T%')