-- SIMPLE VIEW 1 - FOR ALL THE ACTIVE EMPLOYEES

CREATE VIEW ActiveEmployees AS
SELECT
    e.ID AS Employee_ID,
    e.First_Name || ' ' || e.Last_Name AS Employee_Name,
    r.Role AS Employee_Role
FROM
    EMPLOYEE e
    JOIN ROLE r ON e.Role_ID = r.ID
WHERE
    e.Active = 'Y';

SELECT * FROM ActiveEmployees;


-- SIMPLE VIEW 2 - FOR ALL THE AVAILABLE BOOKS

CREATE VIEW AvailableBooks AS
SELECT
    b.ID AS Book_ID,
    b.Title AS Book_Title,
    be.ID AS Edition_ID,
    be.Release_Year,
    be.Language,
    be.ISBN
FROM
    BOOK b
    INNER JOIN BOOK_EDITION be ON b.ID = be.Book_ID
    LEFT JOIN BOOK_COPY bc ON be.ID = bc.EDITION_ID
WHERE
    bc.AVAILABLE = 'Y' OR bc.AVAILABLE IS NULL;

SELECT * FROM AvailableBooks;


-- COMPLEX VIEW 1 - FOR CUSTOMERS WITH LOANS WHICH ARE OVERDUE

CREATE VIEW OverdueLoans AS
SELECT
    l.ID AS Loan_ID,
    c.First_Name || ' ' || c.Last_Name AS Customer_Name,
    b.Title AS Book_Title,
    l.Start_Date,
    l.Deadline_Date,
    l.Returned_Date
FROM
    LOAN l
    JOIN CUSTOMER c ON l.Customer_ID = c.ID
    JOIN BOOK_COPY bc ON l.Book_Copy_ID = bc.ID
    JOIN BOOK_EDITION be ON bc.EDITION_ID = be.ID
    JOIN BOOK b ON be.Book_ID = b.ID
WHERE
    l.Overdue = 'Y' AND l.Returned = 'N';


SELECT * FROM OverdueLoans;


-- COMPLEX VIEW 2 - FOR RESERVATION STATUS

CREATE VIEW ReservationStatus AS
SELECT
    r.ID AS Reservation_ID,
    c.First_Name || ' ' || c.Last_Name AS Customer_Name,
    b.Title AS Book_Title,
    r.Request_Date,
    r.Available_Date,
    r.Checkout_Date,
    CASE
        WHEN r.Checked_out = 'Y' THEN 'Checked Out'
        WHEN r.Expired = 'Y' THEN 'Expired'
        ELSE 'Pending'
    END AS Reservation_Status
FROM
    RESERVATION r
    JOIN CUSTOMER c ON r.Customer_ID = c.ID
    JOIN BOOK_EDITION be ON r.Book_Edition_ID = be.ID
    JOIN BOOK b ON be.Book_ID = b.ID;


SELECT * FROM ReservationStatus;
