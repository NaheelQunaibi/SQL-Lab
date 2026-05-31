-- Practice

-- 1. Write a query to display the highest, lowest, sum and the average
-- salary for all employees in each job_id . Label the columns:
-- maximum, minimum, Sum and Average respectively. Round the
-- results to the nearest whole number.
SELECT JOB_ID,
       ROUND(MAX(SALARY),0) AS MAXIMUM,
       ROUND(MIN(SALARY),0) AS MINIMUM,
       ROUND(SUM(SALARY),0) AS SUM,
       ROUND(AVG(SALARY),0) AS AVERAGE
FROM HR.EMPLOYEES
GROUP BY JOB_ID;

-- 2. Write a query that will display the number of employees who has the
-- same job_id.
SELECT JOB_ID, COUNT(EMPLOYEE_ID)
FROM HR.EMPLOYEES
GROUP BY JOB_ID;

-- 3. Determine the number of managers.
SELECT COUNT(DISTINCT MANAGER_ID)
FROM HR.EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

-- 4. Write a query that displays the difference between the highest and
-- lowest salary. Label the column Difference.
SELECT MAX(SALARY) - MIN(SALARY) AS DIFFERENCE
FROM HR.EMPLOYEES;

-- 5. Write a query to display the department name, City, number of
-- employees, and the average salary for all employees in that
-- department.
SELECT D.DEPARTMENT_NAME, L.CITY, COUNT(E.EMPLOYEE_ID), AVG(E.SALARY)
FROM HR.DEPARTMENTS D, HR.LOCATIONS L, HR.EMPLOYEES E
WHERE D.LOCATION_ID = L.LOCATION_ID AND D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, L.CITY;

-- 6. Display the employee last name, department name for all
-- employees who have an 'A' in their name.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
      AND E.LAST_NAME LIKE '%A%';

-- 7. Write a query to display the last name, department name, City that
-- the employees work in.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM HR.DEPARTMENTS D, HR.LOCATIONS L, HR.EMPLOYEES E
WHERE D.LOCATION_ID = L.LOCATION_ID 
      AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 8. Write a query to display the last name, job_id, department name for
-- all employees who works in Oxford.
SELECT E.LAST_NAME, E.JOB_ID, D.DEPARTMENT_NAME
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D, HR.LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
      AND D.LOCATION_ID = L.LOCATION_ID 
      AND L.CITY = 'Oxford';

-- 9. Write a query to display the name ( first name and last name ),
-- salary, department id for those employees who earn such amount
-- of salary which is the smallest salary of any of the departments.
SELECT FIRST_NAME, LAST_NAME, SALARY, E.DEPARTMENT_ID
FROM HR.EMPLOYEES E
WHERE SALARY = (SELECT MIN(SALARY)
                FROM HR.EMPLOYEES
                WHERE DEPARTMENT_ID = E.DEPARTMENT_ID);

-- 10.Write a query to display the department number, name ( first name
-- and last name ), job and department name for all employees in the
-- Finance department.
SELECT E.DEPARTMENT_ID, E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM HR.EMPLOYEES E, HR.DEPARTMENTS D, HR.JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
      AND E.JOB_ID = J.JOB_ID 
      AND D.DEPARTMENT_NAME = 'Finance';