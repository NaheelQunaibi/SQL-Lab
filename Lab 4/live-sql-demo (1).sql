-- Lab4: DML
INSERT INTO HR.EMPLOYEES (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (207, 'Rami', 'Ali', 'RamiAli', SYSDATE, 'IT_PROG', 2500);
-- Write an SQL statement to add the following
-- information of employee.
-- ID: 207
-- First Name: Rami
-- Last Name: Ali
-- Email: RamiAli
-- Hire Date: Current Date
-- Job ID: IT_PROG
-- Salary: $2500
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, JOB_ID, SALARY)
VALUES (207, 'Rami', 'Ali', SYSDate, 'IT_PROG', 2500);

-- Question2
-- Write an SQL statement to modify salary of
-- employee 106 to be $12000.
UPDATE HR.EMPLOYEES
SET SALARY = 12000
WHERE EMPLOYEE_ID = 106;

-- Question3
-- Write an SQL statement to modify salary and
-- commission of employee 105 to be same as that of
-- employee 155.
UPDATE HR.EMPLOYEES
SET SALARY = (SELECT Salary
              FROM HR.EMPLOYEES
              WHERE EPLOYEE_ID = 155),
    COMMISSION_PCT = (SELECT Salary
                      FROM HR.EMPLOYEES
                      WHERE EPLOYEE_ID = 155)
WHERE EMPLOYEE_ID = 105

-- Question4
-- Write an SQL statement to add the following
-- information of employee.
-- ID: 208
-- First Name: Rami
-- Last Name: Sameer
-- Email: RamiSameer
-- Hire Date: Current Date
-- Job ID: SH_CLERK
-- Salary: $1800
-- Make a permanent change on pervious action
-- Delete job history for employee 122.
-- Modify the location id for department 30 to be 1700.
-- Add the following department which has the following
-- information
-- ID: 300
-- Name: Auditing
-- Location ID: 2500
-- Rollback the pervious changes and notice the changes
-- before and after rollback.