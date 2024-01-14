--Use an sql sub-query statement to answer the following:
--
-- 1. List the book title and retail price for all books with a retail price 
--lower than the average retail price of all books sold by JustLee Books.

SELECT TITLE, RETAIL 
FROM BOOKS 
WHERE RETAIL < (SELECT AVG(RETAIL) FROM BOOKS);

-- 2. Determine which books cost less than the average cost of other
--books in the same category.

SELECT B.TITLE, B.COST
FROM BOOKS B, (SELECT CATEGORY, AVG(COST) AS "AVG_COST" FROM BOOKS GROUP BY CATEGORY) A
WHERE B.COST < A.AVG_COST AND B.CATEGORY = A.CATEGORY;

-- 3. Determine which orders were shipped to the same state as order 1014.
SELECT * 
FROM ORDERS 
WHERE SHIPSTATE = (SELECT SHIPSTATE FROM ORDERS WHERE ORDER#=1014);

-- 5. Determine which author or authors wrote the books 
--most frequently purchased by customers of JustLee Books.

SELECT LNAME, FNAME FROM BOOKAUTHOR JOIN AUTHOR USING(AUTHORID)
WHERE ISBN IN (
SELECT ISBN FROM ORDERITEMS 
GROUP BY ISBN
HAVING SUM(QUANTITY) = (SELECT MAX(COUNT(*)) FROM ORDERITEMS GROUP BY ISBN));

-- 6. List the title of all books in the same category as books 
--previously purchased by customer 1007. Don’t include books this 
--customer has already purchased.
SELECT TITLE
FROM BOOKS
WHERE CATEGORY IN (
    SELECT CATEGORY
    FROM ORDERITEMS OI 
    JOIN ORDERS O USING(ORDER#)
    JOIN BOOKS B USING(ISBN)
    WHERE O.CUSTOMER#=1007)
AND ISBN NOT IN (
    SELECT ISBN
    FROM ORDERITEMS OI 
    JOIN ORDERS O USING(ORDER#)
    JOIN BOOKS B USING(ISBN)
    WHERE O.CUSTOMER#=1007);

-- 7. List the shipping city and state for the order that had the longest shipping delay.
SELECT SHIPCITY, SHIPSTATE FROM ORDERS
WHERE (SHIPDATE - ORDERDATE) = (
SELECT 
    MAX(SHIPDATE - ORDERDATE)
FROM ORDERS);

-- 8. Determine which customers placed orders for the least expensive book 
--(in terms of regular retail price) carried by JustLee Books.
SELECT CUSTOMER#
FROM ORDERS 
JOIN ORDERITEMS USING(ORDER#) 
JOIN CUSTOMERS USING (CUSTOMER#)
WHERE PAIDEACH = (SELECT MIN(RETAIL) FROM BOOKS);

-- 9. Determine the number of different customers who have placed 
--an order for books written or cowritten by James Austin. 

SELECT COUNT(DISTINCT CUSTOMER#)
FROM CUSTOMERS C
JOIN ORDERS O USING(CUSTOMER#) 
JOIN ORDERITEMS OI USING(ORDER#)
WHERE OI.ISBN IN (
    SELECT ISBN 
    FROM BOOKS B 
    JOIN BOOKAUTHOR BA USING (ISBN) 
    JOIN AUTHOR A USING(AUTHORID)
    WHERE A.LNAME='AUSTIN' AND A.FNAME='JAMES'
);

-- 10. Determine which books were published by the publisher of The Wok Way to Cook.
SELECT * FROM BOOKS 
WHERE PUBID = (SELECT PUBID FROM BOOKS WHERE TITLE='THE WOK WAY TO COOK');