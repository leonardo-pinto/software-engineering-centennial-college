--DECLARE
--    CURSOR C1 IS SELECT * FROM EMPLOYEE WHERE JOB <> 'PRESIDENT' AND SAL IS NOT NULL;
--    annual_raise NUMBER(6,2);
--    total_annual_raise_cost NUMBER(15,2) := 0;
--    proposed_annual_raise NUMBER(6,2);
--BEGIN
--    FOR I IN C1 LOOP
--        annual_raise := (I.SAL * 12) * 0.06;
--        IF annual_raise > 2000 THEN
--            annual_raise := 2000;
--        END IF;
--        total_annual_raise_cost := total_annual_raise_cost + annual_raise;
--        
--        UPDATE EMPLOYEE SET SAL=(annual_raise/12) WHERE EMPNO=I.EMPNO;
--        
--        DBMS_OUTPUT.PUT_LINE('EMPNO: ' || I.EMPNO || ' CURRENT ANNUAL SALARY:  $' || (12 * I.SAL) 
--            || ' RAISE: $' || annual_raise || ' PROPOSED NEW ANNUAL SALARY: $' || (12 * I.SAL + annual_raise) 
--        );
--        DBMS_OUTPUT.PUT_LINE('TOTAL COST OF ALL EMPLOYEES RAISE: $' || total_annual_raise_cost);
--    END LOOP;
--END;

-- Question 4
--The DoGood Donor application contains a page that allows administrators to change the ID 
--assigned to a donor in the DD_DONOR table. Create a PL/SQL block to handle this task. 
--Include exception-handling code to address an error raised by attempting to enter a 
--duplicate donor ID. If this error occurs, display the message “This ID is already assigned.” 
--Test the codeby changing donor ID305.(Don’t include a COMMIT statement; roll back any DML
--actions used.)

--
--DECLARE
--    id_to_update NUMBER := '&id_to_update';
--    new_id NUMBER := '&new_id';
--BEGIN
--    UPDATE DD_DONOR SET IDDONOR=new_id WHERE IDDONOR=id_to_update;
--EXCEPTION
--    WHEN DUP_VAL_ON_INDEX THEN
--        DBMS_OUTPUT.PUT_LINE('This ID is already assigned');
--END;

-- Question 5

--Create a function to calculate a shopper’s total spending, including shipping cost and tax amount,
--with Brewbean’s site in a particular year. Exception handling is needed [hint: use parameterized
--cursor]
--Use an anonymous block to call the function and output the result.

--CREATE OR REPLACE FUNCTION TOTAL_SPENDING(shopper_id IN NUMBER, selected_year IN NUMBER)
--RETURN NUMBER
--IS
--    total_spending NUMBER;
--BEGIN
--    SELECT SUM(total) 
--    INTO total_spending 
--    FROM BB_BASKET
--    WHERE EXTRACT(YEAR FROM DTCREATED) = selected_year
--    AND IDSHOPPER=shopper_id
--    GROUP BY (idshopper);
--    RETURN total_spending;
--END;
--DECLARE
--  RESULT NUMBER;
--BEGIN
--    RESULT:= TOTAL_SPENDING(22, 2012);
--    DBMS_OUTPUT.PUT_LINE('RESULT: ' || RESULT);
--END;

--
--SELECT * FROM BB_BASKET;
--DESC BB_BASKET;
-- NUMBER(4) -> TOTAL NUMBER(7,2)
-- TOTAL IN A YEAR
--
-- SELECT idshopper, SUM(total) FROM BB_BASKET
--    WHERE EXTRACT(YEAR FROM DTCREATED) = 2012
--    GROUP BY (idshopper)
--SELECT * FROM BB_BASKET WHERE YEAR;
--SELECT EXTRACT(YEAR FROM DTCREATED) FROM BB_BASKET;

--Create a function to calculate a shopper’s total spending, including shipping cost and 
--tax amount, with Brewbean’s site in a particular year. Exception handling is needed 
--[hint: use parameterized cursor] 
--Use an anonymous block to call the function and output the result.


-- QUESTION 6
--Create a procedure to allow an employee in the shipping department to update an order status to 
--add shipping information. The BB_BASKETSTATUS table lists events for each order so that a shopper 
--can see the current status, date, and comments as each stage of the order process are finished.
--Use an anonymous block to test your procedure.

--SELECT * FROM USER_SEQUENCES;
--
--CREATE OR REPLACE PROCEDURE SHIPPING_INFO_SP (
--    id_basket IN BB_BASKETSTATUS.IDSTATUS%TYPE, 
--    date_stage IN BB_BASKETSTATUS.DTSTAGE%TYPE,
--    notes IN BB_BASKETSTATUS.NOTES%TYPE, 
--    shipper IN BB_BASKETSTATUS.SHIPPER%TYPE, 
--    shippingnum IN BB_BASKETSTATUS.SHIPPINGNUM%TYPE
--)
--IS
--BEGIN
--    INSERT INTO BB_BASKETSTATUS (IDSTATUS, IDBASKET, IDSTAGE, DTSTAGE, NOTES, SHIPPER, SHIPPINGNUM)
--    VALUES (BB_STATUS_SEQ.NEXTVAL, id_basket, 3, date_stage, notes, shipper, shippingnum);
--    COMMIT;
--END SHIPPING_INFO_SP;
--SELECT * FROM BB_BASKETSTATUS;
--BEGIN
--    SHIPPING_INFO_SP(4, TO_DATE('15/03/12', 'dd/mm/yy'), 'urgent shipping', 'UPS', 'XAF45544GD89H569');
--END;
--
--BEGIN
--    SHIPPING_INFO_SP(4, TO_DATE('15/03/12', 'dd/mm/yy'), 'urgent shipping', 'UPS', 'XAF45544GD89H569');
--END;


-- QUESTION 7
--Create a function to insert a new product into an existing order, include the product id, quantity. 
-- The output of the function is the message to notify the calling program whether the update succeeded or not.
--You need to add proper exception handler to handle errors. For example, if basket id or/and product 
-- id does not exist which will cause ORA-02290 error, the function should return some message to the 
-- calling function. When the quantity is negative number or greater than the stock, the function should return 
-- some message to the calling function Use an anonymous block to call the function and output the result.

--CREATE OR REPLACE FUNCTION insert_product_to_basket(
--    product_id IN NUMBER, 
--    product_quantity IN NUMBER, 
--    basket_id IN NUMBER)
--RETURN VARCHAR2
--IS 
--    selected_product BB_PRODUCT%ROWTYPE;
--    invalid_quantity EXCEPTION;
--    result VARCHAR2(255);
--BEGIN
--    SELECT * INTO selected_product FROM BB_PRODUCT WHERE IDPRODUCT=product_id;
--    IF product_quantity < 0 OR product_quantity > selected_product.stock THEN
--        RAISE invalid_quantity;
--    END IF;
--    INSERT INTO BB_BASKETITEM (IDBASKETITEM, IDPRODUCT, PRICE, QUANTITY, IDBASKET)
--    VALUES (BB_IDBASKETITEM_SEQ.NEXTVAL, product_id, selected_product.price, product_quantity, basket_id);
--    result := selected_product.productname;
--    return result;
--EXCEPTION 
--    WHEN no_data_found THEN
--        result := 'Product not found';
--        RETURN result;
--    WHEN invalid_quantity THEN
--        result := 'Invalid quantity';
--        RETURN result;
--END insert_product_to_basket;
--
--select sequence_name from user_sequences;
--
--DECLARE
--    result VARCHAR2(255);
--BEGIN
--    result := insert_product_to_basket(38, 2, 3);
--    dbms_output.put_line(result);
--END;

-- QUESTION 8

--Create a function to determine the total pledge amount for a project. Use the function in an 
--SQL statement to list all projects, displaying project ID, project name, and project
--pledge total amount. Format the pledge total amount to show a dollar sign.

--CREATE OR REPLACE FUNCTION PROJECT_PLEDGE_AMOUNT(id_project IN NUMBER)
--RETURN VARCHAR2
--IS
--    result NUMBER(8,2);
--    formatted_value VARCHAR2(50);
--BEGIN
--    SELECT SUM(PLEDGEAMT) 
--    INTO result
--    FROM DD_PLEDGE 
--    WHERE IDPROJ=id_project
--    GROUP BY IDPROJ;
--    formatted_value := TO_CHAR(result,'$99,999.99');
--    RETURN formatted_value;
--END PROJECT_PLEDGE_AMOUNT;
--
--SELECT IDPROJ, PROJNAME, PROJECT_PLEDGE_AMOUNT(IDPROJ) AS TOTAL_AMT
--FROM DD_PLEDGE JOIN DD_PROJECT USING(IDPROJ) GROUP BY IDPROJ, PROJNAME;


-- QUESTION 9

--CREATE OR REPLACE PROCEDURE ADD_PRODUCT_SP 
--(
--    product_name IN BB_PRODUCT.PRODUCTNAME%TYPE,
--    product_description IN BB_PRODUCT.DESCRIPTION%TYPE,
--    product_image IN BB_PRODUCT.PRODUCTIMAGE%TYPE,
--    product_price IN BB_PRODUCT.PRICE%TYPE,
--    product_sale_start IN VARCHAR2,
--    product_sale_end IN VARCHAR2,
--    product_sale_price IN BB_PRODUCT.SALEPRICE%TYPE,
--    product_active IN BB_PRODUCT.ACTIVE%TYPE,
--    product_featured IN BB_PRODUCT.FEATURED%TYPE,
--    product_feature_start IN BB_PRODUCT.FEATURESTART%TYPE,
--    product_feature_end IN BB_PRODUCT.FEATUREEND%TYPE,
--    product_type IN BB_PRODUCT.TYPE%TYPE,
--    product_id_department IN BB_PRODUCT.IDDEPARTMENT%TYPE,
--    product_stock IN BB_PRODUCT.STOCK%TYPE,
--    product_ordered IN BB_PRODUCT.ORDERED%TYPE,
--    product_reorder IN BB_PRODUCT.REORDER%TYPE
--)
--IS
--BEGIN
--    INSERT INTO BB_PRODUCT (IDPRODUCT, PRODUCTNAME, DESCRIPTION, PRODUCTIMAGE, PRICE, SALESTART,
--    SALEEND, SALEPRICE, ACTIVE, FEATURED, FEATURESTART, FEATUREEND, TYPE, IDDEPARTMENT, STOCK, ORDERED, REORDER)
--    VALUES (BB_PRODID_SEQ.NEXTVAL, product_name, product_description, product_image, product_price,
--    TO_DATE(product_sale_start, 'dd/mm/yy'), TO_DATE(product_sale_end, 'dd/mm/yy'), product_sale_price, product_active, product_featured, product_feature_start,
--    product_feature_end, product_type, product_id_department, product_stock, product_ordered, product_reorder);
--END ADD_PRODUCT_SP;
--
--BEGIN
--    ADD_PRODUCT_SP('Exp Colombia', 'Orange Aroma', 'colombia.jpg', 69,
--    '01/01/23','05/05/23', 409, 1, 1, '','', 'E', 2, 300, 0, 0);
--END;




