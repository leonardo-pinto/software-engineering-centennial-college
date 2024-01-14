--SET SERVEROUTPUT ON;


?-- Creating a function with arguments
--CREATE OR REPLACE FUNCTION SUM_FN(num1 IN NUMBER, num2 IN NUMBER) RETURN NUMBER
--CREATE OR REPLACE FUNCTION SUM_FUNCTION(num1 IN NUMBER, num2 IN NUMBER) RETURN NUMBER
--IS result_num NUMBER;
--    BEGIN
--        result_num := num1 + num2;
--        RETURN result_num;
--    END;
      
--SELECT OBJECT_NAME FROM USER_OBJECTS WHERE OBJECT_TYPE='FUNCTION';  
--?SELECT SUM_FUNCTION(&NUM_1, &NUM_2) FROM DUAL;
-- CREATING A FUNCTION 
--CREATE OR REPLACE 
--FUNCTION ship_calc_cf
--    (p_qty IN number)
--    RETURN NUMBER
--IS
--iv_ship_num NUMBER(5,2);
--BEGIN
--    IF p_qty> 10 Then
--    iv_ship_num :=11.00;
--ELSIF p_qty> 5 Then
--    iv_ship_num :=8.00;
--ELSE
--    iv_ship_num :=5.00;
--END IF;
--RETURN iv_ship_num; 
--END;
----____________
----CHECKING A FUNCTION
--SELECT OBJECT_NAME FROM USER_OBJECTS WHERE OBJECT_TYPE='FUNCTION';
----
--SELECT TEXT FROM USER_SOURCE WHERE NAME='LOGIN_INFO';
--________
----INVOKING A FUNCITON IN SELECT STATEMENT
--SELECT SHIP_CALC_CF(&P_QTY) FROM DUAL;
--
DESC SHIP_CALC_CF;
--______
----INVOKING A FUNCITON IN PL/SQL BLOCK
--DECLARE 
--iv_cost_num NUMBER(5,2);
--Begin
--iv_cost_num := ship_calc_cf(5);
--DBMS_OUTPUT.PUT_LINE (iv_cost_num);
--END;


-- Example creating a function without arguments

--CREATE OR REPLACE FUNCTION HELLO_WORLD RETURN CHAR
--    IS
--    BEGIN
--        RETURN('Hello World from Oracle Function');
--    END;

--SELECT OBJECT_NAME FROM USER_OBJECTS WHERE OBJECT_TYPE='FUNCTION'
--
--SELECT TEXT FROM USER_SOURCE WHERE NAME='HELLO_WORLD';
--SELECT HELLO_WORLD FROM DUAL;