--In this lab, you create a package that uses packaged variable to assist in the user logon process.
--When a returning shopper logs on, the username and password entered need to be verified against 
--the database. In addition, two values need to be stored in packaged variables for reference during 
--the user session: the shopper ID and the first three digits of the shopper's zip code 
--(used for regional advertisements displayed on the site)

--select * from user_objects where object_type='PACKAGE';
Operators

--1. Create a function that accepts a username and password as arguments and verifies these values against 
--the database for a match. If a match is found, return the value Y. Set the value of the variable holding 
--the return value to N. Include a NO_DATA_FOUND exception handler to display a message that the logon
--values are invalid
CREATE OR REPLACE FUNCTION check_credentials_fn(user_name IN VARCHAR2, pswd IN VARCHAR2)
RETURN VARCHAR2
IS 
    result VARCHAR2(255) := 'N';
    shopper BB_SHOPPER%ROWTYPE;
    shopper_id NUMBER;
    shopper_zip_code VARCHAR2(3);
BEGIN
    SELECT * 
    INTO shopper
    FROM BB_SHOPPER
    WHERE username=user_name AND password=pswd;

    result := 'Y';
    shopper_id := shopper.IDSHOPPER;
    shopper_zip_code := SUBSTR(shopper.ZIPCODE, 1, 3);
    RETURN result;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Username or password is invalid');  
    RETURN result;
END check_credentials_fn;

--2. Use an anonymous block to test the procedure, using the username gmal and the password goofy

DECLARE
    result VARCHAR2(255);
BEGIN
    result := check_credentials_fn('xgma1', 'goofy');
    DBMS_OUTPUT.PUT_LINE(result);
END;


--3. Now place the function in a package, and add code to create and populate the packaged variable specified 
--earlier. Name the package LOGIN_PKG

CREATE OR REPLACE PACKAGE LOGIN_PKG
IS
    shopper_id NUMBER;
    shopper_zip_code VARCHAR2(3);
    FUNCTION check_credentials_fn
        (user_name IN VARCHAR2, pswd IN VARCHAR2)
        RETURN VARCHAR2;
END;

CREATE OR REPLACE PACKAGE BODY LOGIN_PKG IS
    FUNCTION check_credentials_fn(user_name IN VARCHAR2, pswd IN VARCHAR2)
    RETURN VARCHAR2
    IS 
        result VARCHAR2(255) := 'N';
        shopper BB_SHOPPER%ROWTYPE;
    BEGIN
        SELECT * 
        INTO shopper
        FROM BB_SHOPPER
        WHERE username=user_name AND password=pswd;
    
        result := 'Y';
        shopper_id := shopper.IDSHOPPER;
        shopper_zip_code := SUBSTR(shopper.ZIPCODE, 1, 3);
        RETURN result;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Username or password is invalid');  
        RETURN result;
    END check_credentials_fn;
END;



--4. Use an anonymous block to test the packaged procedure, using the username gmal and the password
--goofy to verify that the procedure works correctly

DECLARE
    result VARCHAR2(255);
BEGIN
    result := LOGIN_PKG.check_credentials_fn('gma1', 'goofy');
    DBMS_OUTPUT.PUT_LINE(result);
    DBMS_OUTPUT.PUT_LINE(LOGIN_PKG.shopper_id);
    DBMS_OUTPUT.PUT_LINE(LOGIN_PKG.shopper_zip_code);
END;
    


--5.Use DBMS_OUTPUT statements in an anonymous block to display the values stored in the packaged variable. 


