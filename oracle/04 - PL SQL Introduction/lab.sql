-- Lab #4

-- 1.
SET SERVEROUTPUT ON;
--
--DECLARE
--    lv_test_date DATE := TO_DATE('01-FEB-2023');
--    lv_test_num CONSTANT NUMBER(3) := 10;
--    lv_test_txt VARCHAR2(10);
--BEGIN
--    lv_test_txt := 'Pinto';
--    DBMS_OUTPUT.PUT_LINE(lv_test_date);
--    DBMS_OUTPUT.PUT_LINE(lv_test_num);
--    DBMS_OUTPUT.PUT_LINE(lv_test_txt);
--END;
--    
-- 2.
--DECLARE 
--    total_purchases NUMBER(6,2) := &value;
--BEGIN
--    IF total_purchases > 200 THEN
--        DBMS_OUTPUT.PUT_LINE('HIGH');
--    ELSIF total_purchases > 100 THEN
--        DBMS_OUTPUT.PUT_LINE('MID');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('LOW');
--    END IF;
--END;

--DECLARE 
--    total_purchases NUMBER(6,2) := &value;
--BEGIN
--    CASE
--        WHEN total_purchases > 200 THEN
--            DBMS_OUTPUT.PUT_LINE('HIGH');
--        WHEN total_purchases > 100 THEN
--            DBMS_OUTPUT.PUT_LINE('MID');
--        ELSE
--            DBMS_OUTPUT.PUT_LINE('LOW');
--    END CASE;
--END;
-- 3.

DECLARE
    IS_AMOUNT_DUE BOOLEAN;
    BALANCE NUMBER(6,2) :=&VALUE;
    PAYMENT NUMBER(6,2) :=&VALUE;
BEGIN
    IF BALANCE > PAYMENT THEN
        IS_AMOUNT_DUE := TRUE;
    ELSE
        IS_AMOUNT_DUE := FALSE;
    END IF;
    
    IF NOT IS_AMOUNT_DUE THEN
        DBMS_OUTPUT.PUT_LINE('PAYMENT > BALANCE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('BALANCE > PAYMENT');
    END IF;
END;

