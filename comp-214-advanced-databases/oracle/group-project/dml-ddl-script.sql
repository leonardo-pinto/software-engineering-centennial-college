-- Drop statements for each table

DROP TABLE AUTHOR;
DROP TABLE BOOK_AUTHOR;
DROP TABLE BOOK_COPY;
DROP TABLE BOOK_EDITION;
DROP TABLE BOOK;
DROP TABLE CATEGORY;
DROP TABLE CUSTOMER;
DROP TABLE EMPLOYEE;
DROP TABLE FEE;
DROP TABLE LOAN;
DROP TABLE NOTIFICATION;
DROP TABLE PUBLISHER;
DROP TABLE REPLENISH_STOCK;
DROP TABLE RESERVATION;
DROP TABLE ROLE;


--Creating CATEGORY table
CREATE TABLE category (
    ID NUMBER(3,0) PRIMARY KEY,
    Category VARCHAR(25) UNIQUE
);

--Inserting data into CATEGORY table
INSERT INTO category (ID, Category) VALUES (1, 'Historical Fiction');
INSERT INTO category (ID, Category) VALUES (2, 'Mystery');
INSERT INTO category (ID, Category) VALUES (3, 'Family');
INSERT INTO category (ID, Category) VALUES (4, 'Fantasy');
INSERT INTO category (ID, Category) VALUES (5, 'Children''s Fiction');
INSERT INTO category (ID, Category) VALUES (6, 'Adventure');
INSERT INTO category (ID, Category) VALUES (7, 'Detective');
INSERT INTO category (ID, Category) VALUES (8, 'Mystery Thriller');
INSERT INTO category (ID, Category) VALUES (9, 'Drama');
INSERT INTO category (ID, Category) VALUES (10, 'Sci-Fi');

SELECT * FROM category;

--Creating the BOOK table

CREATE TABLE Book (
    ID NUMBER(10,0) PRIMARY KEY,
    Title VARCHAR2(50) NOT NULL,
    Description VARCHAR2(250),
    Category_ID NUMBER(10,0) REFERENCES Category(ID)
);

-- Inserting Data into BOOK table
INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000001, 'A Tale of Two Cities', 'A classic novel by Charles Dickens, set in London and Paris before and during the French Revolution. It explores themes of sacrifice, resurrection, and the impact of social injustice.', 1);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000002, 'And Then There Were None', 'Agatha Christie mystery masterpiece where ten strangers, invited to an isolated island, are accused of past crimes. As they are systematically killed off, the mystery deepens.', 2);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000003, 'Dream of the Red Chamber (???)', 'A Chinese classic novel by Cao Xueqin, offering a portrayal of the rise and fall of the Jia family. It delves into themes of love, politics, and the transient nature of life.', 3);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000004, 'Harry Potter and the Philosophers Stone', 'J.K. Rowlings first book in the magical series, introducing young wizard Harry Potter as he discovers his identity, attends Hogwarts School, and confronts the dark wizard Voldemort.', 5);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000005, 'The Hobbit', 'J.R.R. Tolkiens fantasy adventure follows Bilbo Baggins as he embarks on a quest with dwarves to reclaim a treasure guarded by the dragon Smaug. A prelude to "The Lord of the Rings."', 4);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000006, 'The Little Prince (Le Petit Prince)', 'Antoine de Saint-Exupérys novella tells the story of a young prince who travels from planet to planet, meeting unique characters and reflecting on life, love, and human nature.', 5);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000007, 'She: A History of Adventure', 'H. Rider Haggards adventure novel explores the quest for a lost African kingdom ruled by a mysterious woman named Ayesha. A tale of love, immortality, and ancient secrets.', 6);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000008, 'Vardi Wala Gunda', 'A crime thriller from Indian author Ved Prakash Sharma, "Vardi Wala Gunda" follows the journey of a police officer fighting against corruption and crime.', 7);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000009, 'The Da Vinci Code', 'Dan Brown\s gripping mystery follows symbologist Robert Langdon and cryptologist Sophie Neveu as they unravel a complex web of secrets, religious mysteries, and hidden codes.', 8);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (1000000010, 'Harry Potter and the Chamber of Secrets', 'The second installment in J.K. Rowlings series follows Harry Potter in his second year at Hogwarts, dealing with the mystery of the Chamber of Secrets and a dark force threatening the students.', 4);


SELECT * FROM book ORDER BY ID;

--Create the PUBLISHER table

CREATE TABLE PUBLISHER (
    ID NUMBER(3,0) PRIMARY KEY,
    Name VARCHAR2(50) UNIQUE
);


-- Inserting data into PUBLISHER table
INSERT INTO PUBLISHER (ID, Name) VALUES (1, 'Random House (UK)');
INSERT INTO PUBLISHER (ID, Name) VALUES (2, 'Penguin Books');
INSERT INTO PUBLISHER (ID, Name) VALUES (3, 'HarperCollins');
INSERT INTO PUBLISHER (ID, Name) VALUES (4, 'Pan Macmillan');
INSERT INTO PUBLISHER (ID, Name) VALUES (5, 'Pearson Education');
INSERT INTO PUBLISHER (ID, Name) VALUES (6, 'Bloomsbury');
INSERT INTO PUBLISHER (ID, Name) VALUES (7, 'Oxford University Press');
INSERT INTO PUBLISHER (ID, Name) VALUES (8, 'Simon and Schuster');
INSERT INTO PUBLISHER (ID, Name) VALUES (9, 'John Wiley and Sons');
INSERT INTO PUBLISHER (ID, Name) VALUES (10, 'Egmont');

SELECT * FROM publisher ORDER BY ID;

--Creating the BOOK_EDITION table
DROP TABLE Book_Edition;

CREATE TABLE Book_Edition (
    ID NUMBER(10, 0) PRIMARY KEY,
    Book_ID NUMBER(10, 0) NOT NULL,
    Publisher_ID NUMBER(3, 0) NOT NULL,
    Release_Year NUMBER(4, 0),
    Edition NUMBER(3, 0) NOT NULL,
    Language VARCHAR2(20),
    ISBN VARCHAR2(20),
    FOREIGN KEY (Book_ID) REFERENCES Book(ID),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(ID)
);

--Inser data into BOOK_EDITION

-- Insert data into book_edition table
-- Insert data into BOOK_EDITION table
INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000001, 1000000001, 2, 1859, 5, 'English', '978-1-234567-89-0');

INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000002, 1000000002, 2, 1939, 4, 'English', '978-2-345678-90-1');

INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000003, 1000000003, 4, 1791, 12, 'Chinese', '978-3-456789-01-2');

INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000004, 1000000004, 5, 1997, 15, 'English', '978-4-567890-12-3');

INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000005, 1000000005, 10, 1937, 14, 'English', '978-5-678901-23-4');

INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000006, 1000000006, 9, 1943, 11, 'French', '978-6-789012-34-5');

INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000007, 1000000007, 8, 1887, 25, 'English', '978-7-890123-45-6');

INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000008, 1000000008, 7, 1992, 12, 'Hindi', '978-8-901234-56-7');

INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000009, 1000000009, 1, 2003, 5, 'English', '978-9-012345-67-8');

INSERT INTO BOOK_EDITION (ID, BOOK_ID, PUBLISHER_ID, RELEASE_YEAR, EDITION, LANGUAGE, ISBN)
VALUES (1000000010, 1000000010, 6, 1998, 7, 'English', '978-0-123456-78-9');


SELECT * FROM BOOK_EDITION;

-- Creating the BOOK_COPY table

CREATE TABLE BOOK_COPY (
    ID NUMBER(10,0) PRIMARY KEY,
    EDITION_ID NUMBER(10,0) REFERENCES BOOK_EDITION(ID),
    AVAILABLE CHAR(1) DEFAULT 'Y' CHECK (AVAILABLE IN ('Y', 'N'))
);

-- Insertin data into the BOOK_COPY table

-- Insert data into BOOK_COPY table
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000001, 1000000001, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000002, 1000000002, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000003, 1000000003, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000004, 1000000004, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000005, 1000000005, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000006, 1000000006, 'Y');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000007, 1000000007, 'Y');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000008, 1000000008, 'Y');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000009, 1000000009, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000010, 1000000010, 'Y');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000011, 1000000002, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000012, 1000000003, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000013, 1000000004, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000014, 1000000002, 'Y');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000015, 1000000003, 'Y');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000016, 1000000004, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000017, 1000000006, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000018, 1000000006, 'N');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000019, 1000000010, 'Y');
INSERT INTO BOOK_COPY (ID, EDITION_ID, AVAILABLE) VALUES (1000000020, 1000000010, 'N');

SELECT * FROM BOOK_COPY;

-- Creating the Author table

CREATE TABLE AUTHOR (
    ID NUMBER(10,0) PRIMARY KEY,
    NAME VARCHAR2(50) UNIQUE NOT NULL
);

-- Insert data into AUTHOR table
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000001, 'Charles Dickens');
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000002, 'Agatha Christie');
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000003, 'Cao Xueqin');
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000004, 'J. K. Rowling');
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000005, 'J. R. R. Tolkien');
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000006, 'Antoine de Saint-Exupéry');
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000007, 'H. Rider Haggard');
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000008, 'Ved Prakash Sharma');
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000009, 'Dan Brown');
INSERT INTO AUTHOR (ID, NAME) VALUES (1000000010, 'Paulo Coelho');

SELECT * FROM AUTHOR;

--Create the BOOK_AUTHOR table
CREATE TABLE BOOK_AUTHOR (
    BOOK_ID NUMBER(10,0),
    AUTHOR_ID NUMBER(10,0),
    CONSTRAINT PK_BOOK_AUTHOR PRIMARY KEY (BOOK_ID, AUTHOR_ID),
    CONSTRAINT FK_BOOK_AUTHOR_BOOK_ID FOREIGN KEY (BOOK_ID) REFERENCES BOOK(ID),
    CONSTRAINT FK_BOOK_AUTHOR_AUTHOR_ID FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(ID)
);

--Insert data into the BOOK_AUTHOR table
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000001, 1000000001);
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000002, 1000000002);
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000003, 1000000003);
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000004, 1000000004);
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000005, 1000000005);
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000006, 1000000006);
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000007, 1000000007);
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000008, 1000000008);
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000009, 1000000009);
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES (1000000010, 1000000004);

SELECT * FROM BOOK_AUTHOR;


-- Creating the ROLE table
CREATE TABLE ROLE (
    ID NUMBER(2) PRIMARY KEY NOT NULL,
    Role varchar(20) UNIQUE
);

-- Inserting Data into the ROLE table
INSERT INTO ROLE (ID, Role) VALUES (1, 'DBA');
INSERT INTO ROLE (ID, Role) VALUES (2, 'Database Developer');
INSERT INTO ROLE (ID, Role) VALUES (3, 'General Manager');
INSERT INTO ROLE (ID, Role) VALUES (4, 'Sales Manager');
INSERT INTO ROLE (ID, Role) VALUES (5, 'Sales Specialist');
INSERT INTO ROLE (ID, Role) VALUES (6, 'Sales Technician');
INSERT INTO ROLE (ID, Role) VALUES (7, 'Customer Support');
INSERT INTO ROLE (ID, Role) VALUES (8, 'Senior Sales Tech');
INSERT INTO ROLE (ID, Role) VALUES (9, 'Director');
INSERT INTO ROLE (ID, Role) VALUES (10, 'CEO');


SELECT * FROM ROLE ORDER BY ID;


--Creating the EMPLOYEE table
CREATE TABLE EMPLOYEE (
    ID NUMBER(10,0) PRIMARY KEY,
    First_Name varchar(50) NOT NULL,
    Last_Name varchar(50) NOT NULL,
    Email varchar(50) UNIQUE,
    Phone NUMBER(10,0),
    Active char(1) DEFAULT 'Y' CHECK (Active IN ('Y', 'N')),
    Role_ID NUMBER(2),
    FOREIGN KEY (Role_ID) REFERENCES ROLE(ID)
);

--Inserting data into EMPLOYEE table
-- Insert data into EMPLOYEE table
INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000001, 'John', 'Smith', 'john.smith@example.com', 5551234924, 'N', 1);

INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000002, 'Alice', 'Johnson', 'alice.johnson@example.com', 5555678245, 'Y', 1);

INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000003, 'Michael', 'Davis', 'michael.davis@example.com', 5559876200, 'Y', 3);

INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000004, 'Emily', 'Brown', 'emily.brown@example.com', 5556543816, 'N', 4);

INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000005, 'Daniel', 'Martinez', 'daniel.martinez@example.com', 5554321004, 'Y', 4);

INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000006, 'Olivia', 'Garcia', 'olivia.garcia@example.com', 5558765703, 'Y', 3);

INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000007, 'Ethan', 'Taylor', 'ethan.taylor@example.com', 5553456044, 'Y', 5);

INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000008, 'Sophia', 'Hernandez', 'sophia.hernandez@example.com', 5557890125, 'Y', 2);

INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000009, 'Benjamin', 'Adams', 'benjamin.adams@example.com', 5552345627, 'Y', 8);

INSERT INTO EMPLOYEE (ID, First_Name, Last_Name, Email, Phone, Active, Role_ID)
VALUES (1000000010, 'Ava', 'Wright', 'ava.wright@example.com', 5556789841, 'Y', 6);

SELECT * FROM employee;

-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    ID NUMBER(10) PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Email VARCHAR2(50) UNIQUE,
    Phone NUMBER(10),
    Status VARCHAR2(10) CHECK (Status IN ('Active', 'Inactive', 'Banned')),
    Inactive_Start_Date DATE,
    Ban_Start_Date DATE
);

-- Insert data into CUSTOMER table
INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000001, 'John', 'Doe', 'john.doe@example.com', 5551234567, 'Active', NULL, NULL);

INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000002, 'Alice', 'Johnson', 'alice.johnson@example.com', 5559876543, 'Active', NULL, NULL);

INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000003, 'Michael', 'Smith', 'michael.smith@example.com', 5558765432, 'Inactive', TO_DATE('2022-05-01', 'YYYY-MM-DD'), NULL);

INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000004, 'Emily', 'Brown', 'emily.brown@example.com', 5553456789, 'Active', NULL, NULL);

INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000005, 'Daniel', 'Martinez', 'daniel.martinez@example.com', 5552345678, 'Active', NULL, NULL);

INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000006, 'Olivia', 'Garcia', 'olivia.garcia@example.com', 5557890123, 'Banned', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-04-01', 'YYYY-MM-DD'));

INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000007, 'Ethan', 'Taylor', 'ethan.taylor@example.com', 5556543210, 'Active', NULL, NULL);

INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000008, 'Sophia', 'Hernandez', 'sophia.hernandez@example.com', 5558765432, 'Active', NULL, NULL);

INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000009, 'Benjamin', 'Adams', 'benjamin.adams@example.com', 5559876543, 'Active', NULL, NULL);

INSERT INTO CUSTOMER (ID, First_Name, Last_Name, Email, Phone, Status, Inactive_Start_Date, Ban_Start_Date)
VALUES (1000000010, 'Mia', 'Miller', 'mia.m@example.com', '5558765432', 'Active', NULL, NULL);


SELECT * FROM CUSTOMER;

-- Creating the REPLENISH_STOCK table
CREATE TABLE REPLENISH_STOCK (
    ID NUMBER(10) PRIMARY KEY,
    Book_Edition_ID NUMBER(10),
    Quantity NUMBER(2,0) NOT NULL,
    Order_Date DATE NOT NULL,
    Status VARCHAR2(20) DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Ordered', 'Delivered')),
    Employee_ID NUMBER(10),
    FOREIGN KEY (Book_Edition_ID) REFERENCES BOOK_EDITION(ID),
    FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(ID)
);

--Insert data into REPLENISH_STOCK
INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000001, 1000000003, 2, TO_DATE('2023-09-11', 'YYYY-MM-DD'), 'Delivered', 1000000005);

INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000002, 1000000005, 3, TO_DATE('2023-11-19', 'YYYY-MM-DD'), 'Ordered', 1000000005);

INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000003, 1000000010, 1, TO_DATE('2023-11-19', 'YYYY-MM-DD'), 'Ordered', 1000000005);

INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000004, 1000000004, 1, TO_DATE('2023-11-19', 'YYYY-MM-DD'), 'Ordered', 1000000005);

INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000005, 1000000005, 5, TO_DATE('2023-11-26', 'YYYY-MM-DD'), 'Ordered', 1000000009);

INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000006, 1000000009, 4, TO_DATE('2023-11-26', 'YYYY-MM-DD'), 'Pending', 1000000005);

INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000007, 1000000007, 3, TO_DATE('2023-11-26', 'YYYY-MM-DD'), 'Pending', 1000000009);

INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000008, 1000000007, 3, TO_DATE('2023-11-26', 'YYYY-MM-DD'), 'Pending', 1000000005);

INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000009, 1000000009, 2, TO_DATE('2023-11-27', 'YYYY-MM-DD'), 'Pending', 1000000009);

INSERT INTO REPLENISH_STOCK (ID, Book_Edition_ID, Quantity, Order_Date, Status, Employee_ID)
VALUES (1000000010, 1000000010, 1, TO_DATE('2023-11-27', 'YYYY-MM-DD'), 'Pending', 1000000005);

SELECT * FROM REPLENISH_STOCK;

--Creating the table LOAN
CREATE TABLE LOAN (
    ID NUMBER(10,0) PRIMARY KEY,
    Start_Date DATE NOT NULL,
    Deadline_Date DATE NOT NULL,
    Returned_Date DATE,
    Book_Copy_ID NUMBER(10),
    Customer_ID NUMBER(10),
    Returned CHAR(1) DEFAULT 'N' CHECK (Returned IN ('Y', 'N')),
    Overdue CHAR(1) DEFAULT 'N' CHECK (Overdue IN ('Y', 'N')),
    CONSTRAINT fk_loan_book_copy FOREIGN KEY (Book_Copy_ID) REFERENCES BOOK_COPY(ID),
    CONSTRAINT fk_loan_customer FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(ID)
);

-- Insert data into LOAN table
INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000001, TO_DATE('2023-10-24', 'YYYY-MM-DD'), TO_DATE('2023-11-10', 'YYYY-MM-DD'), NULL, 1000000015, 1000000003, 'N', 'Y');

INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000002, TO_DATE('2023-10-24', 'YYYY-MM-DD'), TO_DATE('2023-11-10', 'YYYY-MM-DD'), NULL, 1000000012, 1000000003, 'N', 'Y');

INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000003, TO_DATE('2023-10-25', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), NULL, 1000000011, 1000000005, 'N', 'Y');

INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000004, TO_DATE('2023-10-25', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), NULL, 1000000004, 1000000005, 'N', 'Y');

INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000005, TO_DATE('2023-10-25', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), NULL, 1000000003, 1000000005, 'N', 'Y');

INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000006, TO_DATE('2023-11-26', 'YYYY-MM-DD'), TO_DATE('2023-12-12', 'YYYY-MM-DD'), TO_DATE('2023-11-27', 'YYYY-MM-DD'), 1000000002, 1000000009, 'Y', 'N');

INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000007, TO_DATE('2023-11-26', 'YYYY-MM-DD'), TO_DATE('2023-12-12', 'YYYY-MM-DD'), TO_DATE('2023-11-27', 'YYYY-MM-DD'), 1000000008, 1000000009, 'Y', 'N');

INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000008, TO_DATE('2023-11-27', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), NULL, 1000000009, 1000000010, 'N', 'N');

INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000009, TO_DATE('2023-11-27', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), NULL, 1000000001, 1000000010, 'N', 'N');

INSERT INTO LOAN (ID, Start_Date, Deadline_Date, Returned_Date, Book_Copy_ID, Customer_ID, Returned, Overdue)
VALUES (1000000010, TO_DATE('2023-11-27', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), NULL, 1000000020, 1000000010, 'N', 'N');

SELECT * FROM LOAN;

-- Creating the RESERVATION table
CREATE TABLE RESERVATION (
    ID NUMBER(10,0) PRIMARY KEY,
    Request_Date DATE NOT NULL,
    Available_Date DATE,
    Checkout_Date DATE,
    Book_Edition_ID NUMBER(10,0),
    Customer_ID NUMBER(10,0),
    Checked_out char(1) DEFAULT 'N' CHECK (Checked_out IN ('Y', 'N')),
    Expired char(1) DEFAULT 'N' CHECK (Expired IN ('Y', 'N')),
    FOREIGN KEY (Book_Edition_ID) REFERENCES BOOK_EDITION(ID),
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(ID)
);

--Inserting data into RESERVATION
INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000001, TO_DATE('2023-10-25', 'YYYY-MM-DD'), TO_DATE('2023-11-27', 'YYYY-MM-DD'), NULL, 1000000010, 1000000003, 'N', 'N');

INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000002, TO_DATE('2023-11-01', 'YYYY-MM-DD'), NULL,  TO_DATE('2023-11-27', 'YYYY-MM-DD'), 1000000009, 1000000010, 'N', 'Y');

INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000003, TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2023-11-27', 'YYYY-MM-DD'), NULL, 1000000007, 1000000005, 'N', 'N');

INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000004, TO_DATE('2023-11-10', 'YYYY-MM-DD'), NULL, TO_DATE('2023-11-27', 'YYYY-MM-DD'), 1000000008, 1000000006, 'N', 'Y');

INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000005, TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD'), NULL, 1000000010, 1000000008, 'N', 'N');

INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000006, TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-09-27', 'YYYY-MM-DD'), NULL, 1000000005, 1000000002, 'N', 'N');

INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000007, TO_DATE('2023-11-25', 'YYYY-MM-DD'), TO_DATE('2023-10-12', 'YYYY-MM-DD'), NULL, 1000000009, 1000000010, 'N', 'Y');

INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000008, TO_DATE('2023-11-27', 'YYYY-MM-DD'), NULL, NULL, 1000000003, 1000000009, 'N', 'N');

INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000009, TO_DATE('2023-11-30', 'YYYY-MM-DD'), NULL, TO_DATE('2023-11-27', 'YYYY-MM-DD'), 1000000007, 1000000004, 'N', 'Y');

INSERT INTO RESERVATION (ID, Request_Date, Available_Date, Checkout_Date, Book_Edition_ID, Customer_ID, Checked_out, Expired)
VALUES (1000000010, TO_DATE('2023-12-05', 'YYYY-MM-DD'), NULL, NULL, 1000000006, 1000000007, 'N', 'N');

SELECT * FROM reservation;

-- Create the FEE table
CREATE TABLE FEE (
    Loan_ID NUMBER(10),
    Customer_ID NUMBER(10),
    Generated_Date DATE NOT NULL,
    Update_Date DATE,
    Payment_Date DATE,
    Current_Amount NUMBER(5,2) NOT NULL,
    Amount_Paid NUMBER(5,2),
    Is_Paid char(1) NOT NULL CHECK (Is_Paid IN ('Y', 'N')),
    CONSTRAINT PK_FEE PRIMARY KEY (Loan_ID, Customer_ID),
    CONSTRAINT FK_FEE_LOAN FOREIGN KEY (Loan_ID) REFERENCES LOAN (ID),
    CONSTRAINT FK_FEE_CUSTOMER FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER (ID)
);

--Inserting Data into FEE table
-- Inserting data into FEE table
INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000001, 1000000003, DATE '2023-11-01', DATE '2023-11-08', NULL, 1, 0, 'N');

INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000002, 1000000003, DATE '2023-11-01', DATE '2023-11-08', NULL, 1, 0, 'N');

INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000003, 1000000005, DATE '2023-11-02', DATE '2023-11-09', NULL, 1.5, 0, 'N');

INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000004, 1000000005, DATE '2023-11-02', DATE '2023-11-09', NULL, 2, 0, 'N');

INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000005, 1000000005, DATE '2023-11-02', DATE '2023-11-09', NULL, 2.5, 0, 'N');

INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000006, 1000000009, DATE '2023-11-27', DATE '2023-11-30', NULL, 1, 0, 'N');

INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000007, 1000000009, DATE '2023-11-27', DATE '2023-11-30', NULL, 1.5, 0, 'N');

INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000008, 1000000010, DATE '2023-12-13', DATE '2023-12-16', NULL, 1, 0, 'N');

INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000009, 1000000010, DATE '2023-12-13', DATE '2023-12-16', NULL, 1.5, 0, 'N');

INSERT INTO FEE (Loan_ID, Customer_ID, Generated_Date, Update_Date, Payment_Date, Current_Amount, Amount_Paid, Is_Paid)
VALUES (1000000010, 1000000010, DATE '2023-12-13', DATE '2023-12-16', NULL, 2, 0, 'N');

SELECT * FROM FEE;

-- Creating NOTIFICATION table
CREATE TABLE NOTIFICATION (
    ID NUMBER(10),
    Customer_ID NUMBER(10),
    Sent char(1) DEFAULT 'N' CHECK (Sent IN ('Y', 'N')),
    Type varchar(12) CHECK (Type IN ('Overdue', 'Fee', 'Reservation')),
    Notification_Date DATE,
    Fee_ID NUMBER(10),
    Book_Copy_ID NUMBER(10),
    PRIMARY KEY (ID),
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(ID),
    FOREIGN KEY (Fee_ID) REFERENCES LOAN(ID),
    FOREIGN KEY (Book_Copy_ID) REFERENCES BOOK_COPY(ID)
);

--Insert data into NOTIFICATION table
INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000001, 1000000003, 'Y', 'Reservation', TO_DATE('2023-12-04', 'YYYY-MM-DD'), NULL, 1000000001);

INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000002, 1000000010, 'N', NULL, NULL, NULL, NULL);

INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000003, 1000000005, 'Y', 'Reservation', TO_DATE('2023-12-04', 'YYYY-MM-DD'), NULL, 1000000003);

INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000004, 1000000006, 'N', NULL, NULL, NULL, NULL);

INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000005, 1000000008, 'N', NULL, NULL, NULL, NULL);

INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000006, 1000000002, 'Y', 'Reservation', TO_DATE('2023-12-04', 'YYYY-MM-DD'), NULL, 1000000006);

INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000007, 1000000010, 'N', NULL, NULL, NULL, NULL);

INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000008, 1000000009, 'Y', 'Reservation', TO_DATE('2023-12-04', 'YYYY-MM-DD'), NULL, 1000000008);

INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000009, 1000000004, 'N', NULL, NULL, NULL, NULL);

INSERT INTO NOTIFICATION (ID, Customer_ID, Sent, Type, Notification_Date, Fee_ID, Book_Copy_ID)
VALUES (1000000010, 1000000007, 'N', NULL, NULL, NULL, NULL);

SELECT * FROM NOTIFICATION;

SELECT * FROM TABS;