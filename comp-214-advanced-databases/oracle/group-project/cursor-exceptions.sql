//Creating Cursor examples
SET SERVEROUTPUT ON;

//Use cursor to apply a fee of $5 to all customers that haven't delivered and haven't paid 

DECLARE
  v_old_amount NUMBER(5,2);
  v_new_amount NUMBER(5,2);
  
  CURSOR overdue_cursor IS
    SELECT f.Loan_ID,
           f.Customer_ID,
           f.Current_Amount
      FROM FEE f
           JOIN LOAN l ON f.Loan_ID = l.ID
      WHERE l.Overdue = 'Y' AND f.Is_Paid = 'N';
BEGIN
  FOR overdue_rec IN overdue_cursor LOOP
    -- Storing the old amount for reference
    v_old_amount := overdue_rec.Current_Amount;
    
    -- Calculating the new amount by adding 5 to the current amount
    v_new_amount := overdue_rec.Current_Amount + 5;
    
    -- Updating the FEE table with the new amount
    UPDATE FEE
       SET Current_Amount = v_new_amount
     WHERE Loan_ID = overdue_rec.Loan_ID
       AND Customer_ID = overdue_rec.Customer_ID;
    
    -- Display the old and new amounts
    DBMS_OUTPUT.PUT_LINE('Loan ID: ' || overdue_rec.Loan_ID ||
                         ', Customer ID: ' || overdue_rec.Customer_ID ||
                         ', Old Amount: ' || v_old_amount ||
                         ', New Amount: ' || v_new_amount);
  END LOOP;
END;
/

//Use Cursor to change the Role_ID of all employees that are inactive to a new role with id 11 called inactive
DECLARE
  v_inactive_role_id NUMBER(2);
  v_old_role VARCHAR2(20);
  
  CURSOR inactive_employee_cursor IS
    SELECT e.ID, r.Role AS Old_Role
      FROM EMPLOYEE e
           JOIN ROLE r ON e.Role_ID = r.ID
     WHERE e.Active = 'N';
BEGIN
  -- Check if the "Inactive" role already exists; if not, insert it
  BEGIN
    SELECT ID INTO v_inactive_role_id FROM ROLE WHERE Role = 'Inactive';
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      -- Insert the "Inactive" role if it doesn't exist
      INSERT INTO ROLE (ID, Role) VALUES (11, 'Inactive');
      v_inactive_role_id := 11;
  END;

  -- Update employees with Active = 'N' to have the new role
  FOR employee_rec IN inactive_employee_cursor LOOP
    -- Store the old role for reference
    v_old_role := employee_rec.Old_Role;
    
    UPDATE EMPLOYEE
       SET Role_ID = v_inactive_role_id
     WHERE ID = employee_rec.ID;
    
    -- Display the employee ID, old role, and new role
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || employee_rec.ID ||
                         ', Old Role: ' || v_old_role ||
                         ', New Role: Inactive');
  END LOOP;
END;
/

//Creating EXCEPTIONS examples

//Unique constraint violation (duplicated emai in Employee table)
DECLARE
  dup_email_exception EXCEPTION;
  PRAGMA EXCEPTION_INIT(dup_email_exception, -1);
BEGIN
  INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
  VALUES (1000000011, 'Jane', 'Doe', 'john.smith@example.com', 5551234924, 'N', 1);
EXCEPTION
  WHEN dup_email_exception THEN
    DBMS_OUTPUT.PUT_LINE('Exception: Duplicate Email Detected');
END;
/

//Divide by zero error (Handling in Fee table)
DECLARE
  divide_by_zero_exception EXCEPTION;
  PRAGMA EXCEPTION_INIT(divide_by_zero_exception, -1476);
  v_result NUMBER;
BEGIN
  SELECT Current_Amount / 0 INTO v_result FROM FEE WHERE Loan_ID = 1000000001 AND Customer_ID = 1000000003;
EXCEPTION
  WHEN divide_by_zero_exception THEN
    DBMS_OUTPUT.PUT_LINE('Exception: Divide by Zero Error');
END;
/

