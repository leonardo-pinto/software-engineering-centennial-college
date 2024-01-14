-- PL/SQL Block
--Set of instructions, result in better performance/security
--
--Anonymous Block
    --Declare (optional)
        -- create variavles, cursors, and types
    --Begin (mandatory)
        -- SQL, logic, loops, assignment statements
    --Exceptions (optional)
        -- error handling
    --End (mandatory)
        -- close the block

--Named Block
    --Function
    --Procedures
    --Packages
    --Triggers
    
--Scalar Variable Data Types
--
--Character
--    CHAR(n) - only string
--    VARCHAR2(n) - string, numbers
--Numeric
--    NUMBER(p,s) - p digits, s decimal cases
--Date
--    DATE
--Boolean
--    BOOLEAN

SHOW SERVEROUTPUT VERI -- check server output status
SET SERVEROUTPUT ON -- enable server output

--DECLARE
--    lv_last_txt VARCHAR2(25);
--    lv_qty_num NUMBER(2);
--    lv_shipflag_bln BOOLEAN;
--BEGIN
--    DBMS_OUTPUT.PUT_LINE('This is our first program');
--END;

-- Assigning and displaying variables
--DECLARE
--    lv_last_txt VARCHAR2(25);
--    lv_qty_num NUMBER(2);
--    lv_shipflag_bln BOOLEAN;
--BEGIN
--    lv_last_txt := 'BROWN';
--    lv_qty_num := 3;
--    lv_shipflag_bln := TRUE;
--DBMS_OUTPUT.PUT_LINE(lv_last_txt);
--DBMS_OUTPUT.PUT_LINE(lv_qty_num);
--END;

-- Declaring and initilizing the value
--DECLARE
--    lv_last_txt VARCHAR2(25) := 'BROWN';
--    lv_qty_num NUMBER(2) := 3;
--    lv_shipflag_bln BOOLEAN := TRUE;
--BEGIN
--    DBMS_OUTPUT.PUT_LINE(lv_last_txt);
--    DBMS_OUTPUT.PUT_LINE(lv_qty_num);
--END;


--BEGIN
--    DBMS_OUTPUT.PUT_LINE('I am studying at Centennial College');
--    DBMS_OUTPUT.PUT_LINE('This course is Advanced Database');
--END;

--DECLARE
--    num1 NUMBER(2) := 5;
--    num2 NUMBER(2) := 1;
--    result NUMBER(2);
--BEGIN
--    result := num1 + num2;
--    DBMS_OUTPUT.PUT_LINE(num1 || ' + ' || num2 || ' = ' || result);
--    if result > 15 then
--        DBMS_OUTPUT.PUT_LINE('The result is greater than 15');
--    end if;
--END;


-- Example using user input
--DECLARE
--    num1 NUMBER(4) :=&num1;
--    num2 NUMBER(4) :=&num2;
--    result NUMBER(4) := num1 + num2;
--BEGIN
----    num1 :=&num1; --prompt user
----    num2 :=&num2; -- prompt user
----    result := num1 + num2;
--    DBMS_OUTPUT.PUT_LINE(num1 || ' + ' || num2 || ' = ' || result);
--    if result > 15 then
--        DBMS_OUTPUT.PUT_LINE('The result is greater than 15');
--    end if;
--END;

-- Example switch case
--DECLARE
--    num1 NUMBER(4) :=&num1;
--    num2 NUMBER(4) :=&num2;
--    result NUMBER(4) := num1 + num2;
--BEGIN
--    CASE result
--        WHEN 15 then DBMS_OUTPUT.PUT_LINE('The result is 15');
--        ELSE DBMS_OUTPUT.PUT_LINE('Is that everything?');
--    END CASE;
--END;

-- Example loop
--DECLARE
--    idx NUMBER(2) := 1;
--BEGIN
--    LOOP
--        DBMS_OUTPUT.PUT_LINE(idx);
--        EXIT WHEN idx >= 5;
--        idx := idx + 1;
--    END LOOP;
--END;


-- Example while loop
--DECLARE 
--    idx NUMBER(2) := -7;
--BEGIN
--    WHILE idx <= 5 LOOP
--        DBMS_OUTPUT.PUT_LINE(idx);
--        idx := idx + 1;
--    END LOOP;
--END;

-- Example For Loop
BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;