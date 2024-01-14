 ALTER SESSION SET NLS_NUMERIC_CHARACTERS=',.';
-- Question 1

-- 1. Produce a list of sentencing information to include criminal ID, full name, sentence ID, sentence start date, and the length in months of the sentence. The number of months should be shown as a whole number. That start date should be displayed in the format “January 1, 2023” 
SELECT 
CRIMINAL_ID, 
FIRST || ' ' || LAST AS "FULL_NAME", 
SENTENCE_ID, 
TO_CHAR(START_DATE, 'Month D, YYYY') AS "SENTENCE_START_DATE", 
ROUND(MONTHS_BETWEEN(END_DATE, START_DATE),0) AS "SENTENCE_LENGTH_MONTHS" -- Since there were no instructions regarding considering the next or previous whole number, I decided to round the number without decimals cases
FROM SENTENCES JOIN CRIMINALS USING (CRIMINAL_ID);

-- Question 2

--2. A list of all amounts owed is needed. Create a list showing each criminal name, charge ID, total amount owed (fine amount plus court fee), amount paid, amount owed, and payment due date. If nothing has been paid to date, the amount paid is NULL. Include only criminals who owe some amount of money. Display the dollar amounts with a dollar sign and two decimals.
SELECT 
FIRST || ' ' || LAST AS "FULL_NAME", 
CHARGE_ID, 
TO_CHAR((FINE_AMOUNT + COURT_FEE), '$9999.99') AS "TOTAL_AMOUNT_OWED", 
TO_CHAR(AMOUNT_PAID,'$9999.99') AS "AMOUNT_PAID",
TO_CHAR(FINE_AMOUNT + COURT_FEE - NVL(AMOUNT_PAID, 0), '$9999.99') AS "AMOUNT_OWED",
PAY_DUE_DATE AS "PAYMENT_DUE_DATE"
FROM CRIME_CHARGES 
JOIN CRIMES USING(CRIME_ID)
JOIN CRIMINALS USING (CRIMINAL_ID)
WHERE (FINE_AMOUNT + COURT_FEE - NVL(AMOUNT_PAID, 0)) != 0;

-- Question 3
--3. Display the criminal name and probation start date for all criminals who have a probation period greater than two months. Also, display the date that’s two months from the beginning of the probation period, which will serve as a review date.
SELECT 
FIRST || ' ' || LAST AS "CRIMINAL_NAME",
START_DATE AS "PROBATION_START_DATE",
ADD_MONTHS(START_DATE, 2) AS "REVIEW_DATE"
FROM SENTENCES JOIN CRIMINALS USING (CRIMINAL_ID)
WHERE MONTHS_BETWEEN(END_DATE, START_DATE) > 2 AND P_STATUS='Y';

-- Question 4
--4. List the following information for all crimes that have a period longer than 10 days between the data charged and the hearing date: crime ID, classification, date charged, hearing date, and the number of days between the date charged and the hearing date
SELECT 
CRIME_ID,
CLASSIFICATION,
DATE_CHARGED,
HEARING_DATE,
HEARING_DATE - DATE_CHARGED AS "DAYS_BTWN_HEARING_CHARGED"
FROM CRIMES
WHERE (HEARING_DATE - DATE_CHARGED) > 10; 

-- Question 5
--5. Show the average number of crimes reported by an officer. 
SELECT AVG(COUNT(*)) AS "AVG_REPORTED_CRIMES_BY_OFFICER" 
FROM CRIME_OFFICERS 
GROUP BY (OFFICER_ID);

--6. Show the total number of crimes by status. 
SELECT STATUS, COUNT(*) AS "NUMBER_OF_CRIMES"
FROM CRIMES
GROUP BY STATUS;

--7. List the highest number of crimes committed by a person. 
SELECT 
    FIRST || ' ' || LAST AS "CRIMINAL_NAME", 
    CRIMINAL_ID, 
    COUNT(*) AS "NUMBER_OF_CRIMES"
FROM CRIMES
JOIN CRIMINALS USING (CRIMINAL_ID)
GROUP BY CRIMINAL_ID, FIRST, LAST
ORDER BY COUNT(*) DESC
FETCH FIRST 1 ROW ONLY;


--8. Display the lowest fine amount assigned to a crime charge. 
SELECT MIN(FINE_AMOUNT) FROM CRIME_CHARGES;

--9. List criminals (ID and name) who have multiple sentences assigned. 
SELECT 
    CRIMINAL_ID,
    FIRST || ' ' || LAST AS "CRIMINAL_NAME", 
    COUNT(*) "NUMBER_OF_SENTENCES"
FROM SENTENCES
JOIN CRIMINALS USING (CRIMINAL_ID)
GROUP BY CRIMINAL_ID, FIRST, LAST
HAVING COUNT(*) > 1;

--10. List the name of each officer who has reported longer than the average 
--number of crimes officers have reported

SELECT OFFICER_NAME
FROM (
    SELECT 
        FIRST || ' ' || LAST AS "OFFICER_NAME",
        COUNT(*) AS "REPORTED_CRIMES"
    FROM CRIME_OFFICERS 
    JOIN OFFICERS USING (OFFICER_ID) 
    GROUP BY OFFICER_ID, FIRST, LAST)
WHERE 
    REPORTED_CRIMES > (
        SELECT AVG(COUNT(*)) 
        FROM CRIME_OFFICERS 
        GROUP BY OFFICER_ID
    );

--11. List the names of all criminals who have committed less than average 
--number of crimes and aren’t listed as violent offenders 

SELECT CRIMINAL_NAME 
FROM (
    SELECT 
        FIRST || ' ' || LAST AS "CRIMINAL_NAME",
        COUNT(*) AS "NUMBER_OF_CRIMES",
        V_STATUS AS "VIOLENCE_STATUS"
    FROM CRIMES 
    JOIN CRIMINALS USING (CRIMINAL_ID)
    GROUP BY CRIMINAL_ID, FIRST, LAST, V_STATUS)
WHERE 
    NUMBER_OF_CRIMES < (
        SELECT AVG(COUNT(*)) 
        FROM CRIMES 
        GROUP BY CRIMINAL_ID)
AND 
    VIOLENCE_STATUS = 'N';

--12. List appeal information for each appeal that has longer than the average 
--number of days between the filing and hearing dates 

SELECT *
FROM (
    SELECT APPEAL_ID, 
    CRIME_ID,
    HEARING_DATE,
    FILING_DATE, 
    STATUS,
    (HEARING_DATE - FILING_DATE) AS "DAYS_BTWN_HEARING_FILING"
    FROM APPEALS
) WHERE 
    DAYS_BTWN_HEARING_FILING > (
        SELECT AVG(HEARING_DATE - FILING_DATE) FROM APPEALS
    );

--13. List the names of probation officers who have had less than average 
--number of criminals assigned
-- 0.02 seconds
SELECT  
    FIRST || ' ' || LAST AS "OFFICER_NAME"
FROM (
    SELECT PROB_ID, COUNT(*) AS "CRIMINALS_ASSIGNED"
    FROM SENTENCES 
    JOIN PROB_OFFICERS USING (PROB_ID)
    WHERE PROB_ID IS NOT NULL
    GROUP BY (PROB_ID)
) 
JOIN PROB_OFFICERS USING (PROB_ID)
WHERE CRIMINALS_ASSIGNED < (
    SELECT AVG(COUNT(*)) 
    FROM SENTENCES
    WHERE PROB_ID IS NOT NULL
    GROUP BY PROB_ID 
);



--14. List each crime that has had the least number of appeals recorded 
SELECT * 
FROM (
    SELECT 
        CRIME_ID, 
        COUNT(*) AS "APPEALS_PER_CRIME"
    FROM 
        APPEALS GROUP BY CRIME_ID)
ORDER BY APPEALS_PER_CRIME DESC
FETCH FIRST 1 ROW ONLY;
