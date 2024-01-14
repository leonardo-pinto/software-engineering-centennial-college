CREATE OR REPLACE PACKAGE LibraryManagement AS
  PROCEDURE AddBook(
    p_Title VARCHAR2,
    p_Description VARCHAR2,
    p_Category_ID NUMBER,
    p_Author_ID NUMBER
  );
  
  PROCEDURE AddBookEdition(
    p_Book_ID NUMBER,
    p_Release_Year NUMBER,
    p_Edition NUMBER,
    p_Publisher_ID NUMBER,
    p_language VARCHAR2,
    p_ISBN VARCHAR2
  );
  
  PROCEDURE NotifyOverdueFees;
  

  FUNCTION GetAvailableBooksCount(p_Category_ID NUMBER) RETURN NUMBER;
  
  FUNCTION CalculateFee(p_Loan_ID NUMBER, p_Customer_ID NUMBER) RETURN NUMBER;
  
  FUNCTION CheckReservationStatus(p_Reservation_ID NUMBER) RETURN BOOLEAN;
  
END LibraryManagement;


CREATE OR REPLACE PACKAGE BODY LibraryManagement AS
  PROCEDURE AddBook(
    p_Title VARCHAR2,
    p_Description VARCHAR2,
    p_Category_ID NUMBER,
    p_Author_ID NUMBER
  ) AS
    v_BookID NUMBER;
    v_Error EXCEPTION;
  BEGIN
    Select NVL(MAX(ID),0)+1 into v_BookID from Book;
    INSERT INTO Book(ID,Title, Description, Category_ID)
    VALUES(v_BookID,p_Title, p_Description, p_Category_ID)
    RETURNING ID INTO v_BookID;

    INSERT INTO BOOK_AUTHOR(BOOK_ID, AUTHOR_ID)
    VALUES(v_BookID, p_Author_ID);

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20001, 'Error in adding book: ' || SQLERRM);
  END AddBook;

  PROCEDURE AddBookEdition(
    p_Book_ID NUMBER,
    p_Release_Year NUMBER,
    p_Edition NUMBER,
    p_Publisher_ID NUMBER,
    p_language VARCHAR2,
    p_ISBN VARCHAR2
  ) AS
    v_AditionID NUMBER;
    v_Error EXCEPTION;
    
  BEGIN
   Select NVL(MAX(ID),0)+1 into v_AditionID from BOOK_EDITION;
   INSERT INTO Book_Edition(ID,BOOK_ID,PUBLISHER_ID,RELEASE_YEAR,EDITION,LANGUAGE,ISBN)
    VALUES(v_AditionID,p_Book_ID, p_Publisher_ID, p_Release_Year,p_Edition,p_language,p_ISBN);
    
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20002, 'Error in updating book edition: ' || SQLERRM);
  END AddBookEdition;

  PROCEDURE NotifyOverdueFees AS
    CURSOR OverdueLoans IS
      SELECT ID, Customer_ID
      FROM Loan
      WHERE Overdue = 'Y' AND Returned = 'N';
    v_NotificationID NUMBER;
    v_Error EXCEPTION;
  BEGIN
    FOR loan_rec IN OverdueLoans LOOP
      Select NVL(Max(ID),0) + 1 into v_NotificationID from NOTIFICATION;
      INSERT INTO NOTIFICATION(ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID)
      VALUES(v_NotificationID, loan_rec.Customer_ID, 'N', 'Overdue', SYSDATE, loan_rec.ID);
      
      COMMIT;
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20003, 'Error in notifying overdue fees: ' || SQLERRM);
  END NotifyOverdueFees;

  FUNCTION GetAvailableBooksCount(p_Category_ID NUMBER) RETURN NUMBER AS
    v_Count NUMBER := 0;
  BEGIN
    SELECT COUNT(*)
    INTO v_Count
    FROM Book_Copy bc
    JOIN Book_Edition be ON bc.EDITION_ID = be.ID
    JOIN Book b ON be.Book_ID = b.ID
    WHERE b.Category_ID = p_Category_ID AND bc.AVAILABLE = 'Y';

    RETURN v_Count;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20004, 'Error in getting available books count: ' || SQLERRM);
  END GetAvailableBooksCount;

  FUNCTION CalculateFee(p_Loan_ID NUMBER, p_Customer_ID NUMBER) RETURN NUMBER AS
    v_Fee NUMBER := 0;
    v_LoanDuration NUMBER;
    v_OverdueDays NUMBER;
    v_FinePerDay NUMBER := 1; 
    
  BEGIN
    SELECT TRUNC(SYSDATE - Start_Date)
    INTO v_LoanDuration
    FROM LOAN
    WHERE ID = p_Loan_ID;
    SELECT TRUNC(SYSDATE - Deadline_Date)
    INTO v_OverdueDays
    FROM LOAN
    WHERE ID = p_Loan_ID;
    IF v_OverdueDays > 0 THEN
      v_Fee := v_OverdueDays * v_FinePerDay;
    END IF;
    RETURN v_Fee;
    
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20005, 'Error in calculating fee: ' || SQLERRM);
  END CalculateFee;

  FUNCTION CheckReservationStatus(p_Reservation_ID NUMBER) RETURN BOOLEAN AS
    v_Status VARCHAR2(1);
  BEGIN
    SELECT Checked_out
    INTO v_Status
    FROM Reservation
    WHERE ID = p_Reservation_ID;

    IF v_Status = 'Y' THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN FALSE;
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20006, 'Error in checking reservation status: ' || SQLERRM);
  END CheckReservationStatus;

END LibraryManagement;

-- Calling all Procedues of that package
BEGIN
  LibraryManagement.AddBook('Nation Heroes 2', 'You can also use the package name and the dot notation to access the body of the package 2, ', 1, 1000000001);
  LibraryManagement.AddBookEdition(1000000011, 2023, 2, 3, 'English','2231-231-123-012');
  LibraryManagement.NotifyOverdueFees;
END;

-- Calling all functions of that package
DECLARE
  available_count NUMBER;
  fee_amount NUMBER;
  reservation_status BOOLEAN;
BEGIN
  available_count := LibraryManagement.GetAvailableBooksCount(3);
  DBMS_OUTPUT.PUT_LINE('Available Books Count: ' || available_count);

  fee_amount := LibraryManagement.CalculateFee(1000000001, 1000000001);
  DBMS_OUTPUT.PUT_LINE('Calculated Fee: ' || fee_amount);

  reservation_status := LibraryManagement.CheckReservationStatus(1000000001);
  DBMS_OUTPUT.PUT_LINE('Reservation Status: ' || CASE WHEN reservation_status THEN 'Checked out' ELSE 'Not checked out' END);
END;



