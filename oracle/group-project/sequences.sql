CREATE SEQUENCE BOOK_SEQ
    START WITH 1000000011
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


CREATE TABLE BOOK (
    ID NUMBER PRIMARY KEY,
    Title VARCHAR2(255),
    Description VARCHAR2(1000),
    Category_ID NUMBER
);


INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (BOOK_SEQ.NEXTVAL, 'Sample Book 1', 'Description for Sample Book 1', 1);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (BOOK_SEQ.NEXTVAL, 'Sample Book 2', 'Description for Sample Book 2', 2);

INSERT INTO BOOK (ID, Title, Description, Category_ID)
VALUES (BOOK_SEQ.NEXTVAL, 'Sample Book 3', 'Description for Sample Book 3', 3);


SELECT * FROM BOOK;