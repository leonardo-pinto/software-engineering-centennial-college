-- Trigger 1
-- Customer should not be able to hold more than 10 books at a time
-- before inserting a new loan
CREATE OR REPLACE TRIGGER check_loan_amount
BEFORE INSERT ON LOAN FOR EACH ROW
DECLARE
    number_of_loans NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO number_of_loans
    FROM LOAN
    WHERE customer_id = :NEW.customer_id AND RETURNED='N';
    
    DBMS_OUTPUT.PUT_LINE('Customer has ' || number_of_loans || ' loans.');
    IF number_of_loans + 1 > 10 THEN
        
        RAISE_APPLICATION_ERROR(-20001, 'Limit of 10 loans reached.');
    END IF;
END;

-- Trigger 2
-- Customer who have over $20 fee pendings payment will have their account blocked
--
CREATE OR REPLACE TRIGGER check_fee_limit
BEFORE INSERT ON FEE FOR EACH ROW
DECLARE
    curr_pending_amount NUMBER;
    projected_pending_amount NUMBER;
BEGIN
    SELECT SUM(CURRENT_AMOUNT) - SUM(AMOUNT_PAID)
    INTO curr_pending_amount
    FROM FEE 
    WHERE IS_PAID='N' AND CUSTOMER_ID=:NEW.CUSTOMER_ID;
    
    projected_pending_amount := curr_pending_amount + (:NEW.CURRENT_AMOUNT - :NEW.AMOUNT_PAID);
    DBMS_OUTPUT.PUT_LINE('Projected fees pending payment: $' || projected_pending_amount);

    IF (projected_pending_amount >= 20) THEN
        DBMS_OUTPUT.PUT_LINE('Customer account will be inactived due to exceeding fees pending');
        UPDATE CUSTOMER SET STATUS='Inactive', INACTIVE_START_DATE=SYSDATE WHERE ID=:NEW.CUSTOMER_ID;
    END IF;
END;


-- Trigger 3
-- Loan must be performed only between 8am and 6pm and from monday to friday

CREATE OR REPLACE TRIGGER limit_loan_time
BEFORE INSERT ON LOAN FOR EACH ROW
DECLARE 
    curr_time TIMESTAMP;
    curr_day VARCHAR2(20);
BEGIN
    SELECT SYSDATE INTO curr_time FROM DUAL;
    SELECT TO_CHAR(SYSDATE, 'DY') INTO curr_day FROM DUAL;
    
    IF (curr_day IN ('SAT', 'SUN') OR (EXTRACT(HOUR FROM curr_time) < 8 OR EXTRACT(HOUR FROM curr_time) >= 18)) THEN
       RAISE_APPLICATION_ERROR(-20002, 'Invalid time/day for loan.');
    END IF;
END;

 
        
