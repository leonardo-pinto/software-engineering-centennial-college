--SET SERVEROUTPUT ON;

--CREATE OR REPLACE PROCEDURE WELCOME_MSG_SP (p_name IN VARCHAR2)
--IS
--BEGIN
--    DBMS_OUTPUT.PUT_LINE('Welcome ' || p_name);
--END;

--EXEC WELCOME_MSG_SP('Leonardo');

-- Procedure to add two numbers

--CREATE OR REPLACE PROCEDURE ADD_SP (num1 IN NUMBER, num2 IN NUMBER, result OUT NUMBER)
--IS
--BEGIN
--    result := num1 + num2;
--END;
--    
--DECLARE
--    result NUMBER;
--BEGIN
--    ADD_SP(10, 50, result);
--    DBMS_OUTPUT.PUT_LINE(result);
--END;

--SELECT * FROM EMPLOYEE;

--CREATE OR REPLACE PROCEDURE ADD_EMPLOYEE(
--    p_EMPNO IN EMPLOYEE.EMPNO%TYPE,
--    p_ENAME IN EMPLOYEE.ENAME%TYPE,
--    p_JOB IN EMPLOYEE.JOB%TYPE,
--    p_HIREDATE IN EMPLOYEE.HIREDATE%TYPE,
--    p_MGR IN EMPLOYEE.MGR%TYPE,
--    p_SAL IN EMPLOYEE.SAL%TYPE,
--    p_COMM IN EMPLOYEE.COMM%TYPE,
--    p_DEPTNO IN EMPLOYEE.DEPTNO%TYPE
--)
--IS
--BEGIN
--    INSERT INTO Employee ("EMPNO", "ENAME", "JOB", "HIREDATE", "MGR", "SAL", "COMM", "DEPTNO") 
--    VALUES (p_EMPNO, p_ENAME, p_JOB, p_HIREDATE, p_MGR, p_SAL, p_COMM, p_DEPTNO);
--    COMMIT;
--END ADD_EMPLOYEE;

--
--BEGIN
--    ADD_EMPLOYEE(6663, 'Baby', 'Clerk', TO_DATE('2003/07/09', 'yyyy/mm/dd'), 1000, 500, 300, 3);
--END;

SELECT * FROM EMPLOYEE