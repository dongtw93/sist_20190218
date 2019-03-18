/*
SELECT : 특정 테이블(자료에 물리적 저장소)에 대한 조회 명령
주의)적절한 권한(CONNECT, RESOURCE role + SELECT ANY TABLE)이 부여된 경우만 조회 가능

형식
SELECT column1, column2....columnN
    FROM   table_name
    WHERE  condition
    GROUP BY column_name
    HAVING (arithematic function condition)
    ORDER BY column_name {ASC|DESC};

*/


----------------------------------------------
--Selecting All Columns + All Rows of a Table
/*
SELECT *
FROM   table_name;
*/

SELECT * 
    FROM hr.employees;

SELECT *
    FROM hr.departments;
    
    
--문제001) hr 계정(소유자)의 jobs 테이블의 정보를 전체 출력하는 쿼리 작성.,




------------------------------------------
--Selecting Specific Columns + All Rows of a Table
/*
SELECT column1, column2....columnN
FROM   table_name;
*/

SELECT employee_id, first_name, phone_number
    FROM hr.employees;

SELECT department_id, department_name
    FROM hr.departments;
    
--문제002) hr 계정(소유자)의 jobs 테이블의 정보에서 
-- job_id, job_title 컬럼 정보만 출력하는 쿼리 작성.


------------------------------------------
--Displaying Selected Columns Under New Headings
/*
형식1)
SELECT column1 alias1, column2 alias2, ....columnN  aliasN
FROM   table_name;
형식2)
SELECT column1 AS alias1, column2 AS alias2, ....columnN AS aliasN
FROM   table_name;
형식3)
SELECT column1 "alias1", column2 "alias2", ....columnN  "aliasN"
FROM   table_name;
*/

SELECT employee_id eid, first_name fname, phone_number phone
    FROM hr.employees;
SELECT employee_id AS eid, first_name AS fname, phone_number AS phone
    FROM hr.employees;    
SELECT employee_id "Employee Id", first_name "First Name", phone_number "Phone Number"
    FROM hr.employees;
    

--문제003) hr 계정(소유자)의 jobs 테이블의 정보에서 
-- job_id 컬럼은 "Job Id", job_title 컬럼은 "Job Title"로 타이틀 변경해서 출력하는 쿼리 작성.



------------------------------------------
--Selecting Data that Satisfies Specified Conditions
/*
SELECT column1, column2....columnN
FROM   table_name
WHERE  condition;

=, !=, <, >, <=, >=
IS [NOT] NULL, LIKE, [NOT] BETWEEN, [NOT] IN, EXISTS, IS OF type
NOT, AND, OR

주의) 연산자를 이용해서 조건식 작성시 자료형(data type) 확인 필요. NUMBER(숫자), VARCHAR2(문자열), DATE(날짜), ...
*/

SELECT employee_id, first_name, phone_number, salary
    FROM hr.employees
    WHERE salary = 10000;
--4 rows

SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE department_id = 100;
--6 rows


--문제004) hr 계정(소유자)의 employees 테이블의 정보에서 
-- job_id가 'ST_CLERK'인 경우만 출력하는 쿼리 작성.


--문제005) hr 계정(소유자)의 employees 테이블의 정보에서 
-- salary가 10000 이상인 경우만 출력하는 쿼리 작성.


--문제006) hr 계정(소유자)의 employees 테이블의 정보에서 
-- salary가 5000 이하인 경우만 출력하는 쿼리 작성.

-------------------------------------------
SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE department_id = ANY (90, 100);

SELECT employee_id, first_name, phone_number, salary
    FROM hr.employees
    WHERE salary >= ALL (9000, 10000);
    
--------------------------------------------
SELECT employee_id, first_name, hire_date
    FROM hr.employees;
--yy/mm/dd
--날짜형식 지정시 yyyy-mm-dd로 변환 가능. TO_CHAR() function
SELECT employee_id, first_name
    , TO_CHAR(hire_date, 'YYYY-MM-DD') AS hire_date1
    , TO_CHAR(hire_date, 'YYYY-MM') AS hire_date2
    , TO_CHAR(hire_date, 'YYYY') AS hire_date3
    FROM hr.employees;

SELECT employee_id, first_name, department_id, hire_date
    FROM hr.employees
    WHERE TO_CHAR(hire_date, 'YYYY') = '2005';
    
--문제007) hr 계정(소유자)의 employees 테이블의 정보에서 
--이달(8월달)의 입사자만 출력하는 쿼리 작성. TO_CHAR() 함수 사용.



------------------------------------------------
--SQL IN Clause
/*
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name IN (val-1, val-2,...val-N);
*/
SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE department_id IN (90, 100);
    
SELECT employee_id, first_name, phone_number, salary
    FROM hr.employees
    WHERE salary IN (8000, 9000, 10000);
    
    
--문제008) hr 계정(소유자)의 employees 테이블의 정보에서 
--특정달(8월달, 9월달) 입사자만 출력하는 쿼리 작성. IN 연산자 사용.

        
---------------------------------------------

