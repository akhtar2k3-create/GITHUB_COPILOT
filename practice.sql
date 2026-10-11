-- get all employees from TCS
SELECT * FROM employees WHERE company = 'TCS';
-- get count of all employees
SELECT COUNT(*) FROM employees WHERE company = 'TCS';

-- get employees with salary more than 50000
-- sort employees by salary descending
-- join employees and departments table
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;

-- get employees with salary more than 50000
-- sort employees by salary descending
SELECT *
FROM employees
WHERE salary > 50000
ORDER BY salary DESC;

-- get employee with the highest salary
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- get employees whose name contains the letter 'r'
SELECT *
FROM employees
WHERE employee_name LIKE '%r%';

-- get all employees from the EMP table
SELECT * FROM HR.EMP;

SELECT * FROM HR.EMP WHERE SAL > 2000 ORDER BY SAL DESC;

SELECT * FROM HR.EMP WHERE SAL = (SELECT MAX(SAL) FROM HR.EMP);

SELECT * FROM HR.EMP WHERE ENAME LIKE '%A%';

SELECT DEPTNO, COUNT(*) AS total_emp FROM HR.EMP GROUP BY DEPTNO;

SELECT MAX(SAL) FROM HR.EMP WHERE SAL < (SELECT MAX(SAL) FROM HR.EMP);

-- Employee name + Department name
SELECT e.ENAME, e.JOB, d.DNAME, d.LOC 
FROM HR.EMP e 
JOIN HR.DEPT d ON e.DEPTNO = d.DEPTNO
ORDER BY e.ENAME;

SELECT d.DNAME, SUM(e.SAL) AS total_salary
FROM HR.EMP e 
JOIN HR.DEPT d ON e.DEPTNO = d.DEPTNO
GROUP BY d.DNAME
ORDER BY total_salary DESC;

SELECT DEPTNO, ENAME, SAL FROM HR.EMP 
WHERE (DEPTNO, SAL) IN 
(SELECT DEPTNO, MAX(SAL) FROM HR.EMP GROUP BY DEPTNO)
ORDER BY DEPTNO;

SELECT e.ENAME AS Employee, m.ENAME AS Manager
FROM HR.EMP e LEFT JOIN HR.EMP m ON e.MGR = m.EMPNO
ORDER BY e.ENAME;

CREATE OR REPLACE PROCEDURE get_highest_salary(p_salary OUT NUMBER) IS
BEGIN
  SELECT MAX(salary) INTO p_salary FROM HR.EMPLOYEES;
END;
/

SET SERVEROUTPUT ON;

DECLARE
--variable to hold the highest salary
  v_salary NUMBER;
BEGIN
  get_highest_salary(v_salary);
  DBMS_OUTPUT.PUT_LINE('Highest salary: ' || v_salary);
END;
/