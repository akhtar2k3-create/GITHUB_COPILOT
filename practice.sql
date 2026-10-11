SET SERVEROUTPUT ON SIZE UNLIMITED;

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

-- 4. Procedure to get department wise total salary
CREATE OR REPLACE PROCEDURE get_dept_salary(p_dept_id IN NUMBER, p_total OUT NUMBER) IS
BEGIN
  SELECT NVL(SUM(salary),0) INTO p_total 
  FROM employees 
  WHERE department_id = p_dept_id;
END;
/

-- Testing Block - Final
DECLARE
  v_sal NUMBER;
  v_cnt NUMBER;
BEGIN
  DBMS_OUTPUT.ENABLE(NULL);
  DBMS_OUTPUT.PUT_LINE('--- Testing Started ---');
  
  get_highest_salary(v_sal);
  DBMS_OUTPUT.PUT_LINE('Highest salary: ' || v_sal);
  
  get_employee_count(v_cnt);
  DBMS_OUTPUT.PUT_LINE('Total employees: ' || v_cnt);
  
  get_dept_salary(80, v_sal);
  DBMS_OUTPUT.PUT_LINE('Total salary for Dept 80: ' || v_sal);
  
  DBMS_OUTPUT.PUT_LINE('--- Testing Done ---');
END;
/

