CREATE SEQUENCE book_copy_sequence
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE OR REPLACE PACKAGE StockManagement AS
  PROCEDURE AddBookCopy(
    p_Edition_ID NUMBER,
    p_Available CHAR DEFAULT 'Y'
  );
  
  PROCEDURE UpdateStockQuantity(
    p_Edition_ID NUMBER,
    p_Quantity NUMBER
  );

  PROCEDURE UpdateBookAvailability(
    p_Copy_ID NUMBER,
    p_Available CHAR
  );

  
  FUNCTION GetAvailableCopiesCount(p_Edition_ID NUMBER) RETURN NUMBER;
  
  FUNCTION GetTotalStockQuantity(p_Edition_ID NUMBER) RETURN NUMBER;
  
  FUNCTION IsBookCopyAvailable(p_Copy_ID NUMBER) RETURN BOOLEAN;
  
END StockManagement;


CREATE OR REPLACE PACKAGE BODY StockManagement AS
  PROCEDURE AddBookCopy(
    p_Edition_ID NUMBER,
    p_Available CHAR DEFAULT 'Y'
  ) AS
  BEGIN
    INSERT INTO BOOK_COPY(ID, EDITION_ID, AVAILABLE)
    VALUES (book_copy_sequence.NEXTVAL, p_Edition_ID, p_Available);

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20001, 'Error in adding book copy: ' || SQLERRM);
  END AddBookCopy;

  PROCEDURE UpdateStockQuantity(
    p_Edition_ID NUMBER,
    p_Quantity NUMBER
  ) AS
  BEGIN
    UPDATE REPLENISH_STOCK
    SET Quantity = p_Quantity
    WHERE Book_Edition_ID = p_Edition_ID;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20002, 'Error in updating stock quantity: ' || SQLERRM);
  END UpdateStockQuantity;

  PROCEDURE UpdateBookAvailability(
    p_Copy_ID NUMBER,
    p_Available CHAR
  ) AS
  BEGIN
    UPDATE BOOK_COPY
    SET AVAILABLE = p_Available
    WHERE ID = p_Copy_ID;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20003, 'Error in updating book availability: ' || SQLERRM);
  END UpdateBookAvailability;

  FUNCTION GetAvailableCopiesCount(p_Edition_ID NUMBER) RETURN NUMBER AS
    v_Count NUMBER := 0;
  BEGIN
    SELECT COUNT(*)
    INTO v_Count
    FROM BOOK_COPY
    WHERE EDITION_ID = p_Edition_ID AND AVAILABLE = 'Y';

    RETURN v_Count;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20004, 'Error in getting available copies count: ' || SQLERRM);
  END GetAvailableCopiesCount;

  FUNCTION GetTotalStockQuantity(p_Edition_ID NUMBER) RETURN NUMBER AS
    v_Quantity NUMBER := 0;
  BEGIN
    SELECT Quantity
    INTO v_Quantity
    FROM REPLENISH_STOCK
    WHERE Book_Edition_ID = p_Edition_ID;

    RETURN v_Quantity;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20005, 'Error in getting total stock quantity: ' || SQLERRM);
  END GetTotalStockQuantity;

  FUNCTION IsBookCopyAvailable(p_Copy_ID NUMBER) RETURN BOOLEAN AS
    v_Available CHAR(1);
  BEGIN
    SELECT AVAILABLE
    INTO v_Available
    FROM BOOK_COPY
    WHERE ID = p_Copy_ID;

    IF v_Available = 'Y' THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20006, 'Error in checking book copy availability: ' || SQLERRM);
  END IsBookCopyAvailable;
END StockManagement;


--run all the procedures of that package
BEGIN
  StockManagement.AddBookCopy(1000000011, 'Y'); -- Example parameters: Edition ID and availability

  StockManagement.UpdateStockQuantity(1000000011, 50); -- Example parameters: Edition ID and  quantity

  StockManagement.UpdateBookAvailability(1000000020, 'N'); -- Example parameters: Copy ID and  availability
END;

--run all functions for that package
DECLARE
  available_copies NUMBER;
  total_stock_quantity NUMBER;
  is_copy_available BOOLEAN;
BEGIN
  available_copies := StockManagement.GetAvailableCopiesCount(1000000011); -- Example parameter: Edition ID
  DBMS_OUTPUT.PUT_LINE('Available Copies: ' || available_copies);

  total_stock_quantity := StockManagement.GetTotalStockQuantity(1000000004); -- Example parameter: Edition ID
  DBMS_OUTPUT.PUT_LINE('Total Stock Quantity: ' || total_stock_quantity);

  is_copy_available := StockManagement.IsBookCopyAvailable(1000000020); -- Example parameter: Copy ID
  IF is_copy_available THEN
    DBMS_OUTPUT.PUT_LINE('The copy is available');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The copy is not available');
  END IF;
END;
