SET SERVEROUTPUT ON;

--1.
--DECLARE
--    TYPE TYPE_ORDER_SUMMARY_INFO IS RECORD(
--        v_subtotal BB_BASKET.SUBTOTAL%TYPE,
--        v_shipping BB_BASKET.SHIPPING%TYPE,
--        v_tax BB_BASKET.TAX%TYPE,
--        v_total BB_BASKET.TOTAL%TYPE);
--    REC_ORDER_SUMMARY_INFO TYPE_ORDER_SUMMARY_INFO;
--    v_id_basket BB_BASKET.IDBASKET%TYPE := 6;
--BEGIN
--    SELECT SUBTOTAL, SHIPPING, TAX, TOTAL 
--    INTO REC_ORDER_SUMMARY_INFO
--    FROM BB_BASKET
--    WHERE IDBASKET = v_id_basket;
--    DBMS_OUTPUT.PUT_LINE('*** ORDER SUMMARY INFO ***');
--    DBMS_OUTPUT.PUT_LINE('ID BASKET: ' || v_id_basket);
--    DBMS_OUTPUT.PUT_LINE('SUB TOTAL: ' || REC_ORDER_SUMMARY_INFO.v_subtotal);
--    DBMS_OUTPUT.PUT_LINE('SHIPPING: ' || REC_ORDER_SUMMARY_INFO.v_shipping);
--    DBMS_OUTPUT.PUT_LINE('TAX: ' || REC_ORDER_SUMMARY_INFO.v_tax);
--    DBMS_OUTPUT.PUT_LINE('TOTAL: ' || REC_ORDER_SUMMARY_INFO.v_total);
--END;


-- 2.

--DECLARE
--    donor_type VARCHAR2(50) :='&donor_type';
--    pledge_amount NUMBER(8,2) :=&pledge_amount;
--BEGIN
--    IF donor_type = 'I' THEN
--        IF pledge_amount >= 500 THEN
--            DBMS_OUTPUT.PUT_LINE('MATCHING 30%: ' || + TO_CHAR(pledge_amount * 0.3, '$9999.99'));
--        ELSIF pledge_amount > 300 AND pledge_amount < 499 THEN
--            DBMS_OUTPUT.PUT_LINE('MATCHING 40%: ' || + TO_CHAR(pledge_amount * 0.4, '$9999.99'));
--        ELSIF pledge_amount > 100 AND pledge_amount < 299 THEN
--            DBMS_OUTPUT.PUT_LINE('MATCHING 50%: ' || + TO_CHAR(pledge_amount * 0.5, '$9999.99'));
--        ELSE
--             DBMS_OUTPUT.PUT_LINE('NO MATCH');
--        END IF;
--    ELSIF donor_type = 'B' THEN
--        IF pledge_amount >= 10000 THEN
--            DBMS_OUTPUT.PUT_LINE('MATCHING 10%: ' || + TO_CHAR(pledge_amount * 0.1, '$9999.99'));
--        ELSIF pledge_amount > 1000 AND pledge_amount < 9999 THEN
--            DBMS_OUTPUT.PUT_LINE('MATCHING 20%: ' || + TO_CHAR(pledge_amount * 0.2, '$9999.99'));
--        ELSIF pledge_amount > 500 AND pledge_amount < 999 THEN
--            DBMS_OUTPUT.PUT_LINE('MATCHING 40%: ' || + TO_CHAR(pledge_amount * 0.4, '$9999.99'));
--        ELSE
--             DBMS_OUTPUT.PUT_LINE('NO MATCH');
--        END IF;
--    ELSIF donor_type = 'G' AND pledge_amount >= 100 THEN
--        DBMS_OUTPUT.PUT_LINE('MATCHING 10%: ' || + TO_CHAR(pledge_amount * 0.1, '$9999.99'));
--    ELSE
--             DBMS_OUTPUT.PUT_LINE('NO MATCH');
--    END IF;
--END;


-- 3.
--CREATE SEQUENCE DD_PROJECT_IDPROJ_SEQ
--START WITH 800 INCREMENT BY 1 NOCYCLE  NOCACHE;
--DECLARE
--    TYPE TYPE_DD_PROJECT IS RECORD(
--        IDPROJ DD_PROJECT.IDPROJ%TYPE,
--        PROJNAME DD_PROJECT.PROJNAME%TYPE,
--        PROJSTARTDATE DD_PROJECT.PROJSTARTDATE%TYPE,
--        PROJENDDATE DD_PROJECT.PROJENDDATE%TYPE,
--        PROJFUNDGOAL DD_PROJECT.PROJFUNDGOAL%TYPE
--    );
--    NEW_PROJECT TYPE_DD_PROJECT;
--BEGIN
--    NEW_PROJECT.IDPROJ := DD_PROJECT_IDPROJ_SEQ.NEXTVAL;
--    NEW_PROJECT.PROJNAME := 'Covid-19 relief fund';
--    NEW_PROJECT.PROJSTARTDATE := TO_DATE('01-02-2023', 'DD-MM-YY');
--    NEW_PROJECT.PROJENDDATE := TO_DATE('30-06-2023', 'DD-MM-YY');
--    NEW_PROJECT.PROJFUNDGOAL := 500000;
--    INSERT INTO DD_PROJECT (
--        IDPROJ, PROJNAME, PROJSTARTDATE, PROJENDDATE, PROJFUNDGOAL
--    )
--    VALUES (NEW_PROJECT.IDPROJ, NEW_PROJECT.PROJNAME, NEW_PROJECT.PROJSTARTDATE, NEW_PROJECT.PROJENDDATE,
--        NEW_PROJECT.PROJFUNDGOAL
--    );
--END;


-- 4.

DECLARE
    TYPE type_pledges IS TABLE OF DD_PLEDGE%ROWTYPE
    INDEX BY PLS_INTEGER;
    monthly_pledges type_pledges;
    v_month NUMBER(2) :=&month;
BEGIN
    SELECT * BULK COLLECT INTO monthly_pledges 
    FROM DD_PLEDGE
    WHERE v_month=EXTRACT(month from pledgedate)
    ORDER BY PAYMONTHS;
    FOR i in 1..monthly_pledges.COUNT
    LOOP
        IF (monthly_pledges(i).PAYMONTHS = 0) THEN  
            DBMS_OUTPUT.PUT_LINE(monthly_pledges(i).IDPLEDGE 
                || ' - ' || monthly_pledges(i).IDDONOR  || ' - ' || monthly_pledges(i).PLEDGEAMT
                || ' - Lump Sum' );
        ELSE
             DBMS_OUTPUT.PUT_LINE( monthly_pledges(i).IDPLEDGE || ' - ' || monthly_pledges(i).IDDONOR 
                || ' - ' || monthly_pledges(i).PLEDGEAMT|| ' - Monthly ** ' || monthly_pledges(i).PAYMONTHS
            );
        END IF;
    END LOOP;
END;

