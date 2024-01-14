-- VIEWS

--1. Create a view that lists the name and phone number of the contact person at each publisher. 
--Don’t include the publisher’s ID in the view. Name the view CONTACT.
CREATE VIEW CONTACT AS
SELECT NAME, PHONE FROM PUBLISHER;

--2. Change the CONTACT view so that no users can accidentally perform DML operations on the view.
CREATE VIEW CONTACT AS
SELECT NAME, PHONE FROM PUBLISHER
WITH READ ONLY;

--3. Create a view called HOMEWORK13 that includes the columns named Col1 and Col2 
--from the FIRSTATTEMPT table. Make sure the view is created even if the FIRSTATTEMPT 
--table doesn’t exist.

CREATE FORCE VIEW HOMEWORK13 AS
SELECT COL1, COL2 FROM FIRSTATTEMPT;


--4. Attempt to view the structure of the HOMEWORK13 view.
SELECT * FROM HOMEWORK13;

--5. Create a view that lists the ISBN and title for each book in inventory along 
--with the name and phone number of the person to contact if the book needs to be reordered.
--Name the view REORDERINFO.
CREATE VIEW REORDERINFO AS
SELECT ISBN, TITLE, PHONE, CONTACT FROM BOOKS JOIN PUBLISHER USING (PUBID);

--6. Try to change the name of a contact person in the REORDERINFO view to your name. 
--Was an error message displayed when performing this step? If so, what was the cause 
--of the error message?
SELECT * FROM REORDERINFO;
UPDATE REORDERINFO SET CONTACT='LEONARDO PINTO' WHERE CONTACT='RENEE SMITH';

--7. Select one of the books in the REORDERINFO view and try to change its ISBN. 
--Was an error message displayed when performing this step? 
--If so, what was the cause of the error message?
UPDATE REORDERINFO SET ISBN='8843172113' WHERE TITLE='REVENGE OF MICKEY';

--8. Delete the record in the REORDERINFO view containing your name. 
--(If you weren’t able to perform #6 successfully, delete one of the contacts already 
--listed in the table.) Was an error message displayed when performing this step? 
--If so, what was the cause of the error message?
DELETE FROM REORDERINFO WHERE CONTACT='RENEE SMITH';

--9. Issue a rollback command to undo any changes made with the preceding DML operations.
ROLLBACK;

--10. Delete the REORDERINFO view.
DROP VIEW REORDERINFO;


-- SEQUENCES AND INDEXES

--Create a sequence for populating the Customer# column of the CUSTOMERS table. 
--When setting the start and increment values, keep in mind that data already exists in this table. 
--The options should be set to not cycle the values and not cache any values, 
--and no minimum or maximum values should be declared.
SELECT * FROM CUSTOMERS;

CREATE SEQUENCE CUSTOMERS_CUSTOMER#_SEQ
START WITH 1021
INCREMENT BY 1
NOCYCLE 
NOCACHE;

--Add a new customer row by using the sequence created in Question 1. 
--The only data currently available for the customer is as follows:
--last name = Shoulders, first name = Frank, and zip = 23567.

INSERT INTO CUSTOMERS (CUSTOMER#, LASTNAME, FIRSTNAME, ZIP) 
VALUES (CUSTOMERS_CUSTOMER#_SEQ.NEXTVAL, 'Shoulders', 'Frank', 23576);

--Create a sequence that generates integers starting with the value 5. 
--Each value should be three less than the previous value generated. 
--The lowest possible value should be 0, and the sequence shouldn’t be allowed to cycle. 
--Name the sequence MY_FIRST_SEQ.

CREATE SEQUENCE MY_FIRST_SEQ
START WITH 5
INCREMENT BY -3
MINVALUE 0
MAXVALUE 5
NOCYCLE;


--Issue a SELECT statement that displays NEXTVAL for MY_FIRST_SEQ three times. 
--Because the value isn’t being placed in a table, use the DUAL table in the FROM 
--clause of the SELECT statement. What causes the error on the third SELECT?
SELECT MY_FIRST_SEQ.NEXTVAL FROM DUAL;

--Change the setting of MY_FIRST_SEQ so that the minimum value that can be generated is -1000.
ALTER SEQUENCE MY_FIRST_SEQ
MINVALUE -1000;

--Create a private synonym that enables you to reference the MY_FIRST_SEQ object as NUMGEN.
CREATE PUBLIC SYNONYM NUMGEN FOR MY_FIRST_SEQ;
SELECT * FROM USER_SYNONYMS;
--Use a SELECT statement to view the CURRVAL of NUMGEN. Delete the NUMGEN synonym and MY_FIRST_SEQ.


--Create a bitmap index on the CUSTOMERS table to speed up queries that search for customers 
--based on their state of residence. Verify that the index exists, and then delete the index.
SELECT * FROM CUSTOMERS;
SELECT * FROM USER_INDEXES;
CREATE BITMAP INDEX CUSTOMERS_STATE_INDEX ON CUSTOMERS(STATE);
DROP INDEX CUSTOMERS_STATE_INDEX;

--Create a B-tree index on the customer’s Lastname column. 
--Verify that the index exists by querying the data dictionary. Remove the index from the database.
CREATE INDEX CUSTOMERS_LASTNAME_INDEX ON CUSTOMERS(LASTNAME);
SELECT * FROM USER_INDEXES;
SELECT * FROM CUSTOMERS WHERE LASTNAME='Shoulders';

--Many queries search by the number of days to ship (number of days between the order 
--and shipping dates). Create an index that might improve the performance of these queries.
SELECT * FROM ORDERS;

SELECT CUSTOMER#, SHIPDATE, ORDERDATE 
FROM ORDERS WHERE (SHIPDATE - ORDERDATE) > 3; -- 0.022

CREATE INDEX ORDERS_SHIP_ORDER_SUB_INDEX ON ORDERS(SHIPDATE - ORDERDATE);
DROP INDEX ORDERS_SHIP_ORDER_INDEX;