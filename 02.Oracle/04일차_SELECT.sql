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



/*
FUNCTION  : Functions are similar to operators in that they manipulate data items and return a result.

1. function(argument, argument, ...) 
2. 내장 함수(SQL, 오라클 제공 함수), 사용자 정의 함수(PL/SQL)
3. 단일 행 함수(Single-Row Functions), 복수 행 함수(Aggregate Functions)
4. 숫자 자료형 함수, 문자 자료형 함수, 날짜 자료형 함수, 형 변환 함수

*/


--------------------------------
--Single-Row Functions : Single-row functions return a single result row for every row of a queried table or view.



----------------------------------------
--Datetime Functions

--SYSDATE : SYSDATE returns the current date and time set for the operating system on which the database server resides. 

SELECT SYSDATE "NOW"
     FROM DUAL;
--18/08/16

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') "NOW"
     FROM DUAL;
--2018-08-16 09:10:20


--날짜 사이의 간격 (일단위)
SELECT TO_DATE('2019-03-21') - TO_DATE('2019-03-20') "날짜 사이의 간격"
    FROM DUAL;


--날짜 사이의 간격 (일단위)
SELECT TRUNC(SYSDATE - TO_DATE('2019-02-21')) "날짜 사이의 간격"
    FROM DUAL;


--날짜 사이의 간격 (일단위)
SELECT TRUNC(SYSDATE) - TO_DATE('2019-02-21') "날짜 사이의 간격"
    FROM DUAL;
    

--평년(2013) 확인
SELECT TO_DATE('2013-03-01') - TO_DATE('2013-02-27') "날짜 사이의 간격"
    FROM DUAL;
--2

--윤년(2012) 확인
SELECT TO_DATE('2012-03-01') - TO_DATE('2012-02-27') "날짜 사이의 간격"
    FROM DUAL;
--3




----------------------------------------
--Conversion Functions

--TO_CHAR : TO_CHAR (datetime) converts a datetime or interval value of DATE, TIMESTAMP, TIMESTAMP WITH TIME ZONE, TIMESTAMP WITH LOCAL TIME ZONE, INTERVAL DAY TO SECOND, or INTERVAL YEAR TO MONTH data type to a value of VARCHAR2 data type in the format specified by the date format fmt. 
--TO_CHAR : TO_CHAR (number) converts n to a value of VARCHAR2 data type, using the optional number format fmt.
--TO_NUMBER : TO_NUMBER converts expr to a value of NUMBER data type. 
--TO_DATE : TO_DATE converts char of CHAR, VARCHAR2, NCHAR, or NVARCHAR2 data type to a value of DATE data type.

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "NOW"
     FROM DUAL;
--2018-08-16

SELECT TO_CHAR(SYSDATE, 'YYYY-MM') "NOW"
     FROM DUAL;
--2018-08

SELECT TO_CHAR(SYSDATE, 'YYYY') "NOW"
     FROM DUAL;
--2018

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI') "NOW"
     FROM DUAL;
--2018-08-16 09:23


SELECT TO_CHAR(TO_DATE('20180816'), 'YYYY-MM-DD') "FORMAT"
     FROM DUAL;
--2018-08-16

SELECT TO_CHAR(TO_DATE('900816'), 'YYYY-MM-DD') "FORMAT"
     FROM DUAL;
--1990-08-16

SELECT '10' + 20 FROM DUAL;
--30

SELECT TO_NUMBER('10') + 20 FROM DUAL;
--30


SELECT employee_id, first_name, last_name
    , TO_CHAR(hire_date, 'YYYY') "HIRE_DATE_YEAR"
     FROM hr.employees
     ORDER BY "HIRE_DATE_YEAR";


--문제23) hr 계정(소유자)의 employees 테이블의 정보에서 
--입사년도(hire_date)가 2005년도인 경우만 출력하는 쿼리 작성.
--출력시 입사년월일 순으로 출력되도록 한다.
--TO_CHAR() 함수 사용

SELECT  employee_id, first_name, hire_date
    FROM HR.employees
    WHERE TO_CHAR(hire_date, 'YYYY') IN ('2005')
    ORDER BY hire_date;




---------------------------------------
--NULL-Related Functions
--NVL : NVL lets you replace null (returned as a blank) with a string in the results of a query. 
--NVL2 : NVL2 lets you determine the value returned by a query based on whether a specified expression is null or not null.


--산술적 연산의 결과가 NULL이 된다
SELECT NULL + 10 FROM DUAL;
SELECT NULL * 10 FROM DUAL;
SELECT TO_CHAR(NULL) FROM dual;
SELECT NULL, 'null' FROM DUAL;

SELECT employee_id, first_name, last_name
    , commission_pct
    , NVL(commission_pct, 0) commission_pct_
    , NVL(TO_CHAR(commission_pct), 'Not Applicable') commission
    , department_id
  FROM hr.employees;
  
  
  
SELECT employee_id, first_name, last_name, salary
    , commission_pct
    , salary + (salary * NVL(commission_pct, 0)) income
  FROM hr.employees; 
  
  
SELECT employee_id, first_name, last_name, salary
    , commission_pct
    , NVL2(commission_pct
        , salary + (salary * commission_pct)
        , salary) income
  FROM hr.employees;  
  

--문제24) hr 계정(소유자)의 employees 테이블의 정보에서 
--department_id가 null이 아닌 경우 department_id를 출력하고,
--department_id가 null인 경우 '부서없음'으로 출력하는 쿼리 작성. NVL() 함수 사용.

SELECT employee_id, first_name, last_name
    , department_id
    , NVL(TO_CHAR(department_id), '부서없음') department_id_
    FROM hr.employees;





-------------------------------
--Encoding and Decoding Functions

--DECODE : DECODE compares expr to each search value one by one. If expr is equal to a search, then Oracle Database returns the corresponding result. 

/*
40	Human Resources
50	Shipping
60	IT
*/

SELECT employee_id, first_name
    , department_id
    , DECODE(department_id
                    , 40, 'Human Resources'
                    , 50, 'Shipping'
                    , 60, 'IT') "department_name"
    FROM hr.employees
    ORDER BY department_id;
   
   
SELECT employee_id, first_name
    , department_id
    , DECODE(department_id
                , 40, 'Human Resources'
                , 50, 'Shipping'
                , 60, 'IT'
                , 'etc.') "department_name"
    FROM hr.employees
    ORDER BY department_id; 
    
    
SELECT employee_id, first_name
    , department_id
    , DECODE(department_id
                , 40, 'Human Resources'
                , 50, 'Shipping'
                , 60, 'IT') "department_name"
    FROM hr.employees
    WHERE department_id BETWEEN 40 AND 60
    ORDER BY department_id;
    
    

--문제25) hr 계정(소유자)의 employees 테이블의 정보에서 
--salary 컬럼의 값을 3개의 등급으로 구분해서 출력하는 쿼리 작성. 
--DECODE() 함수 사용.
--출력시 salary가 많은 직원을 먼저 출력하도록 한다. 
--'10000미만' -> '10000달러미만'
--'10000이상~20000미만' -> '10000달러대'
--'20000이상' -> '20000달러대'

SELECT employee_id, first_name, salary
        , DECODE(TRUNC(salary, -4)
                    , 10000, '10000달러대'
                    , 20000, '20000달러대'
                    , '10000달러미만') AS "SALARY 등급" 
        FROM hr.employees 
        ORDER BY salary DESC;



------------------------------
--CASE ~ END 구문
--프로그램에서 if ~ else if ~ else 역할을 하는 구문
--형식1
/*
    CASE 수식 
        WHEN 값1 THEN 반환값1
        WHEN 값2 THEN 반환값2
        WHEN 값3 THEN 반환값3
        ELSE 반환값4
    END
*/
SELECT employee_id, first_name, salary
        , CASE TRUNC(salary, -4)
            WHEN 20000 THEN '20000달러대'
            WHEN 10000 THEN '10000달러대'
            ELSE '10000달러미만'
          END "SALARY 등급" 
        FROM hr.employees 
        ORDER BY salary DESC;
        
        
--형식2
/*
    CASE  
        WHEN 조건식1 THEN 반환값1
        WHEN 조건식2 THEN 반환값2
        WHEN 조건식3 THEN 반환값3
        ELSE 반환값4
    END
*/

SELECT employee_id, first_name, salary
        , CASE
            WHEN salary >= 20000 THEN '20000달러대'
            WHEN salary >= 10000 THEN '10000달러대'
            ELSE '10000달러미만'
          END "SALARY 등급" 
        FROM hr.employees 
        ORDER BY salary DESC;



---------------------------------------------------------------------
--Aggregate function
--Aggregate functions return a single result row based on groups of rows, rather than on single rows

--주의) Aggregate function은 단독 실행해야 한다. 다른 함수(Single-Row Functions)와 같이 사용할 수 없다.

--COUNT : COUNT returns the number of rows returned by the query.
--SUM : SUM returns the sum of values of expr. 
--AVG : AVG returns average value of expr.
--RANK : RANK calculates the rank of a value in a group of values. 1, 2, 2, 4
--DENSE_RANK  : DENSE_RANK calculates the rank of a value in a group of values.  1, 2, 2, 3
--주의) null 값은 집계 함수 연산에 참여하지 않는다.

SELECT employee_id, first_name, COUNT(*) "count"
    FROM hr.employees;
--ORA-00937: not a single-group group function

SELECT COUNT(*) "count"
    FROM hr.employees;
--107

SELECT COUNT(*) "count"
    FROM hr.employees
    WHERE manager_id IS NULL;
--1

SELECT COUNT(*) "count"
    FROM hr.employees
    WHERE department_id IS NULL;
--1


SELECT COUNT(employee_id) "count"
    FROM hr.employees;
--PK 제약이 있는 컬럼을 대상으로 COUNT() 함수 사용시 전체 카운팅
--107

SELECT COUNT(commission_pct) "count"
    FROM hr.employees;
--null이 있는 컬럼을 대상으로 COUNT() 함수 사용시 일부 카운팅. null 값은 카운팅 제외.
--35

SELECT COUNT(department_id) "count"
    FROM hr.employees;
--106


--문제26)  hr 계정(소유자)의 employees 테이블의 정보에서 
--commission_pct가 없는(값이 null인) 직원의 수를 출력하는 쿼리 작성. COUNT() 함수 사용.
SELECT COUNT(*) "count"
    FROM hr.employees
    WHERE commission_pct IS NULL;
--72


추가문제) hr 계정(소유자)의 employees 테이블의 정보에서 
--부하직원이 있는 직원의 수를 출력하는 쿼리 작성. COUNT() 함수 사용.
--DISTINCT 키워드는 중복 제거 역할



----------------------------------------------
SELECT SUM(salary) "Total"
     FROM hr.employees;
     
SELECT SUM(salary) "Total"
     FROM hr.employees
     WHERE department_id = 100;
     

SELECT ROUND(AVG(salary),2) "Total"
     FROM hr.employees;
     
SELECT ROUND(AVG(salary)) "Total"
     FROM hr.employees
     WHERE department_id = 100;     
     
     
--문제027) hr 계정(소유자)의 employees 테이블의 정보에서 
--특정 직위(job_id)를 가진 직원의 급여 합 및 평균 출력하는 쿼리 작성.
--'CLERK'으로 끝나는 직위를 가진 직원 대상. SUBSTR() 함수 사용.
--SH_CLERK, ST_CLERK, PU_CLERK




--------------------------------
SELECT department_id, last_name, salary,
       RANK() OVER (ORDER BY salary DESC) "RANK"
  FROM hr.employees;

SELECT department_id, last_name, salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) "DENSE_RANK"
  FROM hr.employees;


--문제028) hr 계정(소유자)의 employees 테이블의 정보에서 
--입사년월일(hire_date)가 빠른 순으로 등수 부여 출력하는 쿼리 작성.
--RANK() OVER() 함수 사용



--------------------------------------------------------
--SQL GROUP BY Clause
--Specify the GROUP BY clause if you want the database to group the selected rows based on the value of expr(s) for each row and return a single row of summary information for each group.
/*
SELECT column_name1, SUM(column_name2), ...
FROM   table_name
GROUP BY column_name1;
*/
--주의) GROUP BY 키워드에 사용하는 컬럼은 중복된 자료가 있는 컬럼(FK 제약이 있는 컬럼) 선정. PK, UK 제약이 있는 컬럼은 적절한 대상이 아니다.

SELECT department_id, COUNT(*), SUM(salary)
    FROM  hr.employees
    GROUP BY department_id
    ORDER BY department_id;

SELECT MIN(salary), MAX(salary)
    FROM hr.employees;

SELECT department_id, MIN(salary), MAX(salary)
    FROM hr.employees
    GROUP BY department_id
    ORDER BY department_id;
   
SELECT job_id, COUNT(*) "COUNT", AVG(salary)
    FROM hr.employees
    GROUP BY job_id
    ORDER BY job_id;
    
SELECT department_id, job_id, COUNT(*)
    FROM hr.employees
    GROUP BY department_id, job_id
    ORDER BY department_id, job_id;    
   
     
--문제029) hr 계정(소유자)의 employees 테이블의 정보에서 
--특정 직위(job_id)별 직원의 급여 합 및 평균 출력하는 쿼리 작성.
--'CLERK'으로 끝나는 직위를 가진 직원 대상. SUBSTR() 함수 사용.
--SH_CLERK, ST_CLERK, PU_CLERK



------------------------------------
--SQL HAVING Clause
/*
SELECT column_name1, SUM(column_name2), ...
FROM   table_name
GROUP BY column_name1
HAVING (arithematic function condition);
*/
--HAVING 키워드는 GROUP BY 키워드가 같이 사용한다. 단독 실행 가능.
--HAVING 키워드에는 조건식 작성시 집계함수를 사용한다.

SELECT department_id, COUNT(*) "COUNT", SUM(salary)
    FROM  hr.employees
    GROUP BY department_id
    ORDER BY "COUNT";

SELECT department_id, COUNT(*) "COUNT", SUM(salary)
    FROM  hr.employees
    GROUP BY department_id
    HAVING COUNT(*) >= 10
    ORDER BY "COUNT";

--문제030) hr 계정(소유자)의 employees 테이블의 정보에서 
--'CLERK'으로 끝나는 직위를 가진 직원 대상. SUBSTR() 함수 사용. WHERE 구문
--특정 직위(job_id)별 직원의 급여 합 및 평균 출력하는 쿼리 작성. GROUP BY 구문.
--급여 평균이 일정 기준(???) 이상인 경우만 출력. HAVING 구문.



---------------------------------------------------------
--분석 함수 사용시 특정 그룹을 만든 후에 함수 적용
--PARTITION BY 키워드 사용

SELECT department_id, last_name, salary,
       RANK() OVER (PARTITION BY department_id  ORDER BY salary DESC) "RANK"
  FROM hr.employees;

SELECT department_id, last_name, salary,
       DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) "DENSE_RANK"
  FROM hr.employees;
  
  
----------------------------------------------------------
