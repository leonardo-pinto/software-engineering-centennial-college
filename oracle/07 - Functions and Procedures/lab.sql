--5.10 Create a procedure to retrieve project information for a specific project based on a project ID.
--The procedure should have two parameters: one to accept a project ID value and another 
--to return all data for the specified project. Use a record variable to hold what the procedure returns 

--CREATE OR REPLACE PROCEDURE project_info(
--    proj_id IN DD_PROJECT.IDPROJ%TYPE, 
--    proj_result OUT DD_PROJECT%ROWTYPE
--)
--IS
--BEGIN
--    SELECT IDPROJ, PROJNAME, PROJSTARTDATE, PROJENDDATE, PROJFUNDGOAL, PROJCOORD
--    INTO proj_result
--    FROM DD_PROJECT
--    WHERE IDPROJ = proj_id;
--END project_info;
--
--
--DECLARE
--    TYPE PROJECT_RECORD IS RECORD (
--        IDPROJ DD_PROJECT.IDPROJ%TYPE,
--        PROJNAME DD_PROJECT.PROJNAME%TYPE,
--        PROJSTARTDATE  DD_PROJECT.PROJSTARTDATE%TYPE,
--        PROJENDDATE  DD_PROJECT.PROJENDDATE%TYPE,
--        PROJFUNDGOAL  DD_PROJECT.PROJFUNDGOAL%TYPE,
--        PROJCOORD  DD_PROJECT.PROJCOORD%TYPE
--    );
--    proj_result PROJECT_RECORD;
--BEGIN
--    project_info(800, proj_result);
--    DBMS_OUTPUT.PUT_LINE(proj_result.PROJNAME);
--END;

--Create a function to determine the total pledge amount for a project. 
--Use the function in an SQL statement to list all projects' project ID, project name, 
--and project pledge total amount. Format the pledge total to have a dollar sign showed.
--
--CREATE OR REPLACE FUNCTION format_dollar(
--    pledge_amt IN NUMBER)
--RETURN VARCHAR2 
--IS 
--    formatted_value VARCHAR2(50);
--BEGIN
--    formatted_value := TO_CHAR(pledge_amt,'$99,999.99');
--    RETURN formatted_value;
--END;

SELECT 
    IDPROJ, format_dollar(PLEDGEAMT), PROJNAME
FROM 
    DD_PLEDGE 
JOIN 
    DD_PROJECT using(IDPROJ);







