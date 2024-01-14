---- Task 2.6
---- Function 1
 Customer should not be able to get a new loan or make reservation if they have overdue books
--Function declaration
CREATE OR REPLACE FUNCTION is_customer_valid (id_customer IN NUMBER)
RETURN VARCHAR2
IS 
    result VARCHAR2(1);
    overdue_books NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO overdue_books
    FROM LOAN
    WHERE CUSTOMER_ID=id_customer AND OVERDUE='Y';
    
    IF overdue_books > 0 THEN
        result := 'N';
    ELSE
        result := 'Y';
    END IF;
    return result;
END;


-- Function execution
DECLARE
    can_user_loan VARCHAR2(1);
BEGIN
    can_user_loan := is_customer_valid(1000000003);
    DBMS_OUTPUT.PUT_LINE ('Is user allowed to loan a book? ' || can_user_loan);
END;

-- Function 2
-- Customers should not be able to get a new loan or make reservation if they have pending fees.
--
CREATE OR REPLACE FUNCTION has_pending_fees(id_customer IN NUMBER)
RETURN VARCHAR
IS 
    result VARCHAR(1);
    pending_fee_count NUMBER;
BEGIN
    SELECT COUNT(LOAN_ID)
    INTO pending_fee_count
    FROM FEE
    WHERE CUSTOMER_ID=id_customer AND IS_PAID='N' AND PAYMENT_DATE IS NULL;
    
    IF pending_fee_count = 0 THEN
        result := 'N';
    ELSE
        result := 'Y';
    END IF;
    return result;
END;

DECLARE
    customer_has_pending_fees VARCHAR2(1);
BEGIN
    customer_has_pending_fees := has_pending_fees(1000000003);
    DBMS_OUTPUT.PUT_LINE ('User has pending fees? ' || customer_has_pending_fees);
END;


-- Procedure 1
-- Add a new customer

CREATE OR REPLACE PROCEDURE ADD_CUSTOMER(
    c_id IN CUSTOMER.ID%TYPE, 
    c_first_name IN CUSTOMER.FIRST_NAME%TYPE, 
    c_last_name IN CUSTOMER.LAST_NAME%TYPE, 
    c_email IN CUSTOMER.EMAIL%TYPE, 
    c_phone IN CUSTOMER.PHONE%TYPE, 
    c_status IN CUSTOMER.STATUS%TYPE, 
    c_inactive_start_date IN VARCHAR2, 
    c_ban_start_date IN VARCHAR2
)
IS
BEGIN
    INSERT INTO CUSTOMER (ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE, STATUS, INACTIVE_START_DATE, BAN_START_DATE)
    VALUES (c_id, c_first_name, c_last_name, c_email, c_phone, c_status, TO_DATE(c_inactive_start_date, 'dd/mm/yy'), TO_DATE(c_ban_start_date, 'dd/mm/yy'));
    COMMIT;
END ADD_CUSTOMER;

BEGIN
    ADD_CUSTOMER(1000000019, 'Joseph', 'Richards', 'joseph@example.com', 4375521899, 'Active', '05/11/23','05/12/23');
END;

SELECT * FROM CUSTOMER;

--Procedure 2.
-- Update a customer phone

CREATE OR REPLACE PROCEDURE UPDATE_CUSTOMER_PHONE(id_customer IN NUMBER, new_phone IN NUMBER)
IS
BEGIN
    UPDATE CUSTOMER SET PHONE=new_phone WHERE ID=id_customer;
    COMMIT;
END;


BEGIN
    UPDATE_CUSTOMER_PHONE(1000000001, 4375521899);
END;
