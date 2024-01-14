SELECT value FROM V$NLS_PARAMETERS WHERE parameter = 'NLS_DATE_FORMAT';
set serveroutput on
DECLARE
    lv_test_date1 Date := to_date('2012-08-12');
    lv_test_date DATE := '10-12-12';
    lv_test_num NUMBER(3) := 10;
    lv_test_txt VARCHAR2(10);
BEGIN
  lv_test_txt :=  'Brown';
  DBMS_OUTPUT.PUT_LINE(lv_test_date1);
  DBMS_OUTPUT.PUT_LINE(lv_test_date);
  DBMS_OUTPUT.PUT_LINE(lv_test_num);
  DBMS_OUTPUT.PUT_LINE(lv_test_txt);
END;

_________

DECLARE
  lv_total_num NUMBER(6,2) := &VALUE ;
BEGIN
  IF lv_total_num > 200 THEN
    DBMS_OUTPUT.PUT_LINE('CUSTOMER RATED HIGH');
  ELSIF lv_total_num > 100 THEN
    DBMS_OUTPUT.PUT_LINE('CUSTOMER RATED MID');
  ELSE
    DBMS_OUTPUT.PUT_LINE('CUSTOMER RATED LOW');
  END IF;
END;

____

DECLARE
     FNO NUMBER:=10;
     SNO NUMBER:=10;
     ADD NUMBER:=0;
     PROD NUMBER:=0;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Basic Calculator');
        ADD:=FNO+SNO;
        DBMS_OUTPUT.PUT_LINE('SUM OF '||FNO||' AND '||SNO||' = '||ADD);
        PROD:=FNO*SNO;
        DBMS_OUTPUT.PUT_LINE('PROD OF '||FNO||' AND '||SNO||'= '||PROD);
   END;
__________

-- CLASS EXAMPLE
CREATE TABLE EMP1
    ( ENO NUMBER(3),
    ENAME VARCHAR2(20),
    SAL   NUMBER(3));
-- INSERT DATA 

SELECT * FROM EMP1;
DESC EMP1;

DECLARE 
--V_SAL NUMBER(6);
V_SAL EMP.SAL%TYPE;
BEGIN
SELECT SAL INTO V_SAL FROM EMP1 WHERE ENAME ='LEDUC';
DBMS_OUTPUT.PUT_LINE('THE SAL IS ' || V_SAL);
    IF V_SAL > 150 THEN
    DELETE FROM EMP1 WHERE ENAME = 'RYAN';
    END IF;
END;




SET SERVEROUTPUT ON;

SELECT * FROM BB_SHOPPER;
DESC BB_SHOPPER;
_________________________

--- DECLARING VARIABLE
DECLARE
SHOP_ID     NUMBER(4);
SHOP_FIRST  VARCHAR2(40);

BEGIN

SELECT IDSHOPPER, FIRSTNAMe INTO SHOP_ID,SHOP_FIRST
FROM BB_SHOPPER
WHERE idshopper = 25;
DBMS_OUTPUT.PUT_LINE('TESTING INDIVIDUAL VARIABLE');
DBMS_OUTPUT.PUT_LINE(SHOP_ID);
END;
________________________________________________________

--- DECLARING AND UNDERSTANDING %TYPE
DECLARE
SHOP_ID     BB_SHOPPER.IDSHOPPER%TYPE;
SHOP_FIRST  BB_SHOPPER.FIRSTNAME%TYPE;

BEGIN

SELECT IDSHOPPER, FIRSTNAMe INTO SHOP_ID,SHOP_FIRST
FROM BB_SHOPPER
WHERE idshopper = 25;
DBMS_OUTPUT.PUT_LINE('TESTING THE WHOLE RECORD');
END;
_____________________

-- DECLARING VARIABLE AND MAKE A RECORD
DECLARE
TYPE TYPE_SHOPPER IS RECORD(
SHOP_ID     BB_SHOPPER.IDSHOPPER%TYPE,
USERNAME    BB_SHOPPER.USERNAME%TYPE,
PW          BB_SHOPPER.PASSWORD%TYPE,
COOKIE      BB_SHOPPER.COOKIE%TYPE,
DTENTERED   BB_SHOPPER.DTENTERED%TYPE,
PROVINCE    BB_SHOPPER.PROVINCE%TYPE,
COUNTRY     BB_SHOPPER.COUNTRY%TYPE,
PROMO       BB_SHOPPER.PROMO%TYPE);

REC_SHOPPER TYPE_SHOPPER;

BEGIN

SELECT IDSHOPPER,USERNAME, PASSWORD, COOKIE, DTENTERED, PROVINCE,COUNTRY, PROMO
INTO REC_SHOPPER
FROM BB_SHOPPER
WHERE idshopper = 25;
DBMS_OUTPUT.PUT_LINE('TESTING THE WHOLE RECORD');
DBMS_OUTPUT.PUT_LINE(REC_SHOPPER.USERNAME);
END;

____________________________________________________



-- DECLARING AND UNDERSTANDING RECORD TYPE

DECLARE
TYPE TYPE_SHOPPER IS RECORD(
SHOP_ID     BB_SHOPPER.IDSHOPPER%TYPE,
SHOP_FIRST  BB_SHOPPER.FIRSTNAME%TYPE,
LAST        BB_SHOPPER.LASTNAME%TYPE,
ADDRESS     BB_SHOPPER.ADDRESS%TYPE,
CITY        BB_SHOPPER.CITY%TYPE,
STATE       BB_SHOPPER.STATE%TYPE,
ZIP         BB_SHOPPER.ZIPCODE%TYPE,
PHONE       BB_SHOPPER.PHONE%TYPE,
FAX         BB_SHOPPER.FAX%TYPE,
EMAIL       BB_SHOPPER.EMAIL%TYPE,
USERNAME    BB_SHOPPER.USERNAME%TYPE,
PW          BB_SHOPPER.PASSWORD%TYPE,
COOKIE      BB_SHOPPER.COOKIE%TYPE,
DTENTERED   BB_SHOPPER.DTENTERED%TYPE,
PROVINCE    BB_SHOPPER.PROVINCE%TYPE,
COUNTRY     BB_SHOPPER.COUNTRY%TYPE,
PROMO       BB_SHOPPER.PROMO%TYPE);

REC_SHOPPER TYPE_SHOPPER;

BEGIN

SELECT IDSHOPPER,FIRSTNAME,LASTNAME,ADDRESS,CITY,STATE, ZIPCODE, PHONE, 
FAX, EMAIL, USERNAME, PASSWORD, COOKIE, DTENTERED, PROVINCE,COUNTRY, PROMO
INTO REC_SHOPPER
FROM BB_SHOPPER
WHERE idshopper = 25;
DBMS_OUTPUT.PUT_LINE('TESTING THE WHOLE RECORD');
END;
___________________________________________________________________

--UNDERSTANDING % ROWTYPE
DECLARE 
REC1_SHOPPER BB_SHOPPER%ROWTYPE;
BEGIN
SELECT * INTO REC1_SHOPPER FROM BB_SHOPPER 
WHERE IDSHOPPER = 25;
DBMS_OUTPUT.PUT_LINE('TESTING THE ROWTYPE RECORD');
DBMS_OUTPUT.PUT_LINE(REC1_SHOPPER.IDSHOPPER);
END;

DECLARE
    -- declare an associative array type
    TYPE type_roast  
        IS TABLE OF number 
        INDEX BY BINARY_INTEGER;
    -- declare a variable of the t_capital_type
    tbl_roast type_roast;
    -- local variable
    lv_tot_num number := 0;
    lv_cnt_num Number := 0;
    lv_avg_num number;
    lv_samp1_num number(5,2) := 6.22;
    lv_samp2_num number(5,2) := 6.13;
    lv_samp3_num number(5,2) := 6.27;
    lv_samp4_num number(5,2) := 6.16;
    lv_samp5_num number(5,2);
BEGIN

    tbl_roast(1) := lv_samp1_num;
    tbl_roast(2) := lv_samp2_num;
    tbl_roast(3) := lv_samp3_num;
    tbl_roast(4) := lv_samp4_num;
    tbl_roast(5) := lv_samp5_num;
    
    for i in 1.. tbl_roast.count LOOP
            IF tbl_roast(i) is not null then 
        lv_tot_num := lv_tot_num + tbl_roast(i);
        lv_cnt_num := lv_cnt_num + 1;
            END IF;
        END LOOP;
        lv_avg_num := lv_tot_num / lv_cnt_num;
        dbms_output.put_line(lv_tot_num);
        dbms_output.put_line(lv_cnt_num);
        dbms_output.put_line(tbl_roast.count);
        dbms_output.put_line(lv_avg_num);  
END;
______________________


DECLARE
    -- declare an associative array type
    TYPE t_capital_type 
        IS TABLE OF VARCHAR2(100) 
        INDEX BY VARCHAR2(50);
    -- declare a variable of the t_capital_type
    t_capital t_capital_type;
    -- local variable
    l_country VARCHAR2(50);
BEGIN
    
    t_capital('USA')            := 'Washington, D.C.';
    t_capital('United Kingdom') := 'London';
    t_capital('Japan')          := 'Tokyo';
    
    l_country := t_capital.FIRST;
    
    WHILE l_country IS NOT NULL LOOP
        dbms_output.put_line('The capital of ' || 
            l_country || 
            ' is ' || 
            t_capital(l_country));
        l_country := t_capital.NEXT(l_country);
    END LOOP;
END;