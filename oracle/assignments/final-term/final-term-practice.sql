-- Question 31
-- a) Create a new table name temp_emp based on provided table emp, which only include
-- the column empno and ename

--CREATE TABLE temp_emp AS
--SELECT EMPNO, ENAME
--FROM EMP;

-- b) Use a cursor to retrieve the information about empno and ename and populate a database
--table temp_emp, with this information

-- Cursor implementation
--SET SERVEROUTPUT ON;
--DECLARE
--    CURSOR C1 IS SELECT * FROM EMP;
--BEGIN
--    FOR I IN C1 LOOP
--        INSERT INTO TEMP_EMP (EMPNO, ENAME)
--        VALUES (I.EMPNO, I.ENAME);
--    END LOOP;
--END;


-- Create a procedure or function Raise_Empsal to increase 10% salary for a specific employee

-- Hint: when invoked Raise_Empsal, it should accept the parameter for empno,
-- and update the employee record with a salary increase of 10%

-- Use emp table, and make appropriate assumptions if you need to
-- Invoke or test the procedure/function

--CREATE OR REPLACE PROCEDURE Raise_Empsal(emp_no IN NUMBER)
--IS
--    updated_salary NUMBER(7,2);
--    current_salary NUMBER(7,2);
--BEGIN
--    SELECT SAL
--    INTO current_salary
--    FROM EMP
--    WHERE EMPNO=emp_no;
--    
--    updated_salary := current_salary * 1.1;
--    UPDATE EMP SET SAL=updated_salary WHERE EMPNO=emp_no;
--    COMMIT;
--    DBMS_OUTPUT.PUT_LINE('Salary updated from '|| current_salary || ' to ' || updated_salary);
--    
--    EXCEPTION
--        WHEN NO_DATA_FOUND THEN
--            DBMS_OUTPUT.PUT_LINE('Invalid employee number');
--END;
--
--BEGIN
--    Raise_Empsal(97839);
--END;

-- Create a DML database trigger (CHK_DML) on emp table, which permits dml operation only
-- during week days and between 9:00 am to 5:00 pm. Include the necessary exception handling
-- and appropriate message

-- Run the INSERT, UPDATE and DELETE statement to test the trigger.
-- Use emp table, and make appropriate assumptions if you need to

--CREATE OR REPLACE TRIGGER CHK_DML
--BEFORE INSERT OR UPDATE OR DELETE ON EMP FOR EACH ROW
--DECLARE 
--    curr_time TIMESTAMP;
--    curr_day VARCHAR2(20);
--BEGIN
--    SELECT SYSDATE INTO curr_time FROM DUAL;
--    SELECT TO_CHAR(SYSDATE, 'DY') INTO curr_day FROM DUAL;
--    
--    IF (curr_day IN ('SAT', 'SUN') OR (EXTRACT(HOUR FROM curr_time) < 9 OR EXTRACT(HOUR FROM curr_time) >= 17)) THEN
--       RAISE_APPLICATION_ERROR(-20002, 'Operations only allowed on weekdays between 9:00 AM and 5:00 PM');
--    END IF;
--END;


-- Write a PL/SQL Block to select the name of the employee with a given deptno.

-- 1. If the deptno does not return any rows, handle the exception with an appropriate exception handler

-- 2. If the deptno return more than one row, handle the exception with an appropriate exception handler

-- 3. Handle any other exception with an appropriate exception
----
--DECLARE
--    department_number NUMBER(2);
--    employee_name EMP.ENAME%TYPE;
--BEGIN
--    department_number := TO_NUMBER('&Enter_department_number');
--    SELECT ENAME 
--    INTO employee_name
--    FROM EMP
--    WHERE DEPTNO=department_number;
--    DBMS_OUTPUT.PUT_LINE(employee_name || ' is an employee of department number ' || department_number);
--    EXCEPTION
--        WHEN TOO_MANY_ROWS THEN
--            DBMS_OUTPUT.PUT_LINE('More than one employee was found for the given department number');
--        WHEN NO_DATA_FOUND THEN
--            DBMS_OUTPUT.PUT_LINE('There are no employees for the given department number');
--        WHEN VALUE_ERROR THEN
--            DBMS_OUTPUT.PUT_LINE('Invalid input type. Please enter a number');
--END;
