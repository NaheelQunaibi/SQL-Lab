-- Lab2: SQL Functions

-- Write a query to display all employee’s names and
-- their jobs.
-- Note: format must be as the following example
-- Blake is a manager
SELECT INITCAP(LAST_NAME)||' is a '|| JOB_ID
FROM HR.EMPLOYEES;

-- Question2
-- Write a query to display first name and three letters
-- of last name for all employees in department 90.
SELECT FIRST_NAME, SUBSTR(LAST_NAME, 1, 3)
FROM HR.EMPLOYEES;

-- Question3
-- Write a query to display last three letters of
-- employee’s names.
SELECT LAST_NAME, SUBSTR(LAST_NAME, -3, 3)
FROM HR.EMPLOYEES;

-- Question4
-- Write a query to display all employee’s information
-- whose their names contain 4 letters.
SELECT *
FROM HR.EMPLOYEES
WHERE LENGTH(LAST_NAME) = 4 ;

-- Question5
-- Write a query to display employee's name,
-- numbers and the number of weeks employed for
-- all employees who earns more than $5750.
SELECT LAST_NAME, EMPLOYEE_ID, ROUND((CURRENT_DATE - HIRE_DATE)/7, 0) AS WEEKS_EMPLOYED
FROM HR.EMPLOYEES
WHERE SALARY >= 5750;

-- Question6
-- Write a query to display the date of the first FRIDAY.
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') AS First_Friday
FROM dual;

-- Question7
-- Write a query to display your age in months.
SELECT MONTHS_BETWEEN(SYSDATE,DATE '2006-1-3')/12
FROM dual;

-- Question8
-- Write a query to display last date of the current
-- month.
SELECT LAST_DAY(CURRENT_DATE)
FROM DUAL;

-- Question9
-- Write a query to display employee’s first names and
-- their annual income.
-- Note: For employees who have unknown commission consider it to be 0.
SELECT first_name, (salary * 12 + NVL(commission_pct, 0) * salary) AS annual_income
FROM HR.EMPLOYEES;

-- Question10
-- Write a query to display all employee’s names, their
-- salaries, and situation.
-- Note: situation of employee known form salary value.
SELECT FIRST_NAME, SALARY, 
       DECODE(SALARY,
        '800', 'Low',
        '3000', 'Moderate',
        '5000', 'High',
        'Unknown'
       ) AS SITUATION
FROM HR.EMPLOYEES, DUAL;

-- Question11
-- List ten functions other than listed in the
-- slides. Gives an example of each one.
--ارجعي للتسجيلات شوفي الدكتورة اذا كتبت FUNCTIONS غير الي بالسلايدات

-- Question12
-- Write a query to display all employee’s first
-- names, their department’s names and their
-- job title for all employees in department 30
-- and 80.
SELECT E.FIRST_NAME, D.DEPARTMENT_NAME, J.JOB_TITLE
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D, HR.JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
      AND E.JOB_ID = J.JOB_ID
      AND E.DEPARTMENT_ID IN (30, 80);

-- Question13
-- Write a query to display employee’s first
-- names, their last names, departments
-- numbers, and names of their departments.
-- Note: Include departments that have no employees
SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM HR.DEPARTMENTS D 
LEFT OUTER JOIN HR.EMPLOYEES E ON D.DEPARTMENT_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_ID;

-- Question14
-- Write a query to display employee’s numbers,
-- their names, their managers numbers and
-- their managers names.
