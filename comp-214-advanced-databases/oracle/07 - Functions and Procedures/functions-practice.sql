--CHECKING A FUNCTION
--SELECT OBJECT_NAME FROM USER_OBJECTS WHERE OBJECT_TYPE='FUNCTION';
----
--SELECT TEXT FROM USER_SOURCE WHERE NAME='FIRST';

-- Function without parameters returning a string

--CREATE OR REPLACE FUNCTION HELLO_WORLD RETURN VARCHAR2
--IS 
--BEGIN
--    RETURN 'Hello World!';
--END;

--SELECT HELLO_WORLD FROM DUAL;

--DECLARE
--    RESULT VARCHAR2(50);
--BEGIN
--    RESULT := HELLO_WORLD;
--    DBMS_OUTPUT.PUT_LINE(RESULT);
--END;

-- Function with arguments

--CREATE OR REPLACE FUNCTION check_grade(grade IN NUMBER)
--RETURN VARCHAR2
--IS result VARCHAR2(50);
--BEGIN
--    IF grade > 70 THEN
--        result := 'PASSED WITH A+';
--    ELSIF grade > 50 THEN
--        result := 'PASSED WITH A';
--    ELSE
--        result := 'FAILED';
--    END IF;
--    RETURN result;
--END;
--SELECT check_grade(&VALUE) FROM DUAL;

--DECLARE
--    result VARCHAR2(50);
--BEGIN
--    result := check_grade(60);
--    DBMS_OUTPUT.PUT_LINE(result);
--END;
--    

-- Function to add two numbers and return the result
--CREATE OR REPLACE FUNCTION ADD_NUM (num1 IN NUMBER, num2 IN NUMBER)
--RETURN NUMBER
--IS result NUMBER;
--BEGIN
--    result := num1 + num2;
--    RETURN RESULT;
--END;
--SELECT ADD_NUM(10,20) FROM DUAL;

-- Function to retrieve data from table

--CREATE OR REPLACE FUNCTION GET_DEP_INFO(DEP_ID IN NUMBER)
--RETURN 
--    VARCHAR2
--IS 
--    CURSOR C1 IS SELECT * FROM EMPLOYEE WHERE DEPTNO=DEP_ID;
--    INFO VARCHAR2(300);
--BEGIN
--    FOR IDX IN C1 LOOP
--        INFO := INFO || ' ' || IDX.ENAME || ' ' || IDX.SAL || ' ' || IDX.DEPTNO;
--    END LOOP;
--    RETURN INFO;
--END GET_DEP_INFO;

--SELECT GET_DEP_INFO(30) FROM DUAL;

--DECLARE
--    RESULT VARCHAR(300);
--BEGIN
--    RESULT := GET_DEP_INFO(30);
--    DBMS_OUTPUT.PUT_LINE(RESULT);
--END;
--    
    