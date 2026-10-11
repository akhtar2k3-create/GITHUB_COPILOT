-- 1. Procedure to get highest salary
CREATE OR REPLACE PROCEDURE get_highest_salary(p_salary OUT NUMBER) IS
BEGIN
  SELECT MAX(salary) INTO p_salary FROM employees;
END;
/

-- 2. Procedure to get total employee count
CREATE OR REPLACE PROCEDURE get_employee_count(p_count OUT NUMBER) IS
BEGIN
  SELECT COUNT(*) INTO p_count FROM employees;
END;
/

-- 3. Procedure to get employees whose name contains 'r' or 'R'
CREATE OR REPLACE PROCEDURE get_employees_with_r(p_cursor OUT SYS_REFCURSOR) IS
BEGIN
  OPEN p_cursor FOR
    SELECT employee_id, first_name, last_name, salary 
    FROM employees 
    WHERE LOWER(first_name) LIKE '%r%' OR LOWER(last_name) LIKE '%r%';
END;
/

SET SERVEROUTPUT ON;

-- Testing Block
DECLARE
  v_salary NUMBER;
  v_count NUMBER;
  v_cursor SYS_REFCURSOR;
  v_emp_id employees.employee_id%TYPE;
  v_first_name employees.first_name%TYPE;
  v_last_name employees.last_name%TYPE;
  v_sal employees.salary%TYPE;
BEGIN
  -- Test 1: Highest Salary
  get_highest_salary(v_salary);
  DBMS_OUTPUT.PUT_LINE('Highest salary: ' || v_salary);
  
  -- Test 2: Employee Count
  get_employee_count(v_count);
  DBMS_OUTPUT.PUT_LINE('Total employees: ' || v_count);
  
  -- Test 3: Employees with letter R
  DBMS_OUTPUT.PUT_LINE('--- Employees having R in name ---');
  get_employees_with_r(v_cursor);
  LOOP
    FETCH v_cursor INTO v_emp_id, v_first_name, v_last_name, v_sal;
    EXIT WHEN v_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_emp_id || ' - ' || v_first_name || ' ' || v_last_name || ' - ' || v_sal);
  END LOOP;
  CLOSE v_cursor;
END;
/