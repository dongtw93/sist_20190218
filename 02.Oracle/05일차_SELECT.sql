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



---------------------------------------------------------------------
--Aggregate function
--Aggregate functions return a single result row based on groups of rows, rather than on single rows

--주의) Aggregate function은 단독 실행해야 한다. 다른 함수(Single-Row Functions)와 같이 사용할 수 없다.

--COUNT : COUNT returns the number of rows returned by the query.
--SUM
--AVG
--RANK
--DENSE_RANK
--주의) null 값은 집계 함수 연산에 참여하지 않는다.



------------------------------
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
--DISTINCT 키워드는 중복 제거 역할






-----------------------------------
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
-->SH_CLERK, ST_CLERK, PU_CLERK





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
-->SH_CLERK, ST_CLERK, PU_CLERK






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
--급여 평균이 일정 기준(3000) 이상인 경우만 출력. HAVING 구문.





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
/*
JOIN : 두 개 이상의 테이블을 결합해서 조회하는 명령

1. INNER JOIN : returns rows when there is a match in both tables.
2. LEFT JOIN : returns all rows from the left table, even if there are no matches in the right table.
3. RIGHT JOIN : returns all rows from the right table, even if there are no matches in the left table.
4. FULL JOIN : returns rows when there is a match in one of the tables.
5. SELF JOIN : is used to join a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement.
6. CARTESIAN JOIN : returns the Cartesian product of the sets of records from the two or more joined tables.
*/



/*
INNER JOIN : = (같음을 비교하는 연산자)를 이용한 조인 조건 설정
주의) PK, FK 제약을 지정한 컬럼을 대상으로 조인 조건 지정

ANSI [American National Standards Institute] 표기법
    SELECT table1.column1, table2.column2...
    FROM table1
    INNER JOIN table2
    ON table1.common_field = table2.common_field;
    --WHERE 조건식

Oracle 표기법
    SELECT table1.column1, table2.column2...
    FROM table1, table2
    WHERE table1.common_field = table2.common_field;
    --AND 조건식

*/

--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments INNER JOIN hr.employees
    ON hr.departments.department_id = hr.employees.department_id;

--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments, hr.employees
    WHERE hr.departments.department_id = hr.employees.department_id;
    
--Alias 적용
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id = e.department_id;
    
    
--hr.jobs, hr.employees 
SELECT employee_id, first_name, last_name, job_title
    FROM hr.jobs j, hr.employees e
    WHERE j.job_id = e.job_id
    ORDER BY employee_id;
    
--hr.jobs, hr.employees, hr.departments
SELECT employee_id, first_name, last_name, job_title, department_name
    FROM hr.jobs j 
    INNER JOIN hr.employees e ON j.job_id = e.job_id
    INNER JOIN hr.departments d ON e.department_id = d.department_id
    --WHERE 일반조건식
    ORDER BY employee_id;
    
    
--hr.jobs, hr.employees, hr.departments
SELECT employee_id, first_name, last_name, job_title, department_name
    FROM hr.jobs j, hr.employees e, hr.departments d
    WHERE j.job_id = e.job_id
    AND e.department_id = d.department_id
    --AND 일반조건식
    ORDER BY employee_id;


--문제031) hr 계정(소유자)의 employees, departments 테이블의 정보에서 
--부서아이디, 부서명 및 부서장의 개인정보(직원아이디, 이름)를 같이 출력하는 쿼리 작성. INNER JOIN 사용.

--ANSI 표기법

    
--Oracle 표기법



--문제032) hr 계정(소유자)의 employees, departments, locations, countries, regions 테이블의 정보에서 
--직원 정보(직원아이디, 이름, 부서명, 부서위치)를 출력하는 쿼리 작성. INNER JOIN 사용.

--ANSI 표기법

    
--Oracle 표기법



------------------------