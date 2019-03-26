/*
JOIN : 두 개 이상의 테이블을 결합해서 조회하는 명령

1. INNER JOIN : returns rows when there is a match in both tables.
2. LEFT JOIN : returns all rows from the left table, even if there are no matches in the right table.
3. RIGHT JOIN : returns all rows from the right table, even if there are no matches in the left table.
4. FULL JOIN : returns rows when there is a match in one of the tables.
5. SELF JOIN : is used to join a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement.
6. CARTESIAN JOIN : returns the Cartesian product of the sets of records from the two or more joined tables.
*/



------------------------
/*
SELF JOIN : Alias 지정 필수

ANSI 표기법
    SELECT a.column_name, b.column_name...
    FROM table1 a INNER JOIN table1 b
    ON a.common_field = b.common_field;


Oracle 표기법
    SELECT a.column_name, b.column_name...
    FROM table1 a, table1 b
    WHERE a.common_field = b.common_field;
*/


--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1 INNER JOIN hr.employees e2
    ON e1.salary = e2.salary
    WHERE e1.first_name='David' AND e1.last_name='Austin';

--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1, hr.employees e2
    WHERE e1.salary = e2.salary
    AND e1.first_name='David' AND e1.last_name='Austin';
    
    
    
--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1 INNER JOIN hr.employees e2
    ON e1.department_id = e2.department_id
    WHERE e1.first_name='David' AND e1.last_name='Austin';    
    
--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1, hr.employees e2
    WHERE e1.department_id = e2.department_id
    AND e1.first_name='David' AND e1.last_name='Austin';


--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1, hr.employees e2
    WHERE e1.department_id = e2.department_id
    AND e1.hire_date <= e2.hire_date
    AND e1.first_name='Valli' AND e1.last_name='Pataballa';


--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1, hr.employees e2
    WHERE e1.hire_date <= e2.hire_date
    AND e1.first_name='Valli' AND e1.last_name='Pataballa';


--문제039)  hr 계정(소유자)의 employees 테이블의 정보에서 
--first_name 'Donald', last_name 'OConnell'과 직위아이디(job_id)가 같은 직원 정보 출력하는 쿼리 작성. SELF JOIN 사용.

--ANSI 표기법
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.job_id 
    FROM hr.employees e1 INNER JOIN hr.employees e2 ON e1.job_id = e2.job_id 
    WHERE e1.first_name = 'Donald' AND e1.last_name = 'OConnell';

--Oracle 표기법
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.job_id 
    FROM hr.employees e1, hr.employees e2
    WHERE e1.job_id = e2.job_id AND e1.first_name = 'Donald' AND e1.last_name = 'OConnell';
    

--문제040)  hr 계정(소유자)의 employees, jobs 테이블의 정보에서 
--first_name 'Donald', last_name 'OConnell'과 직위명(job_title)가 같은 직원 정보 출력하는 쿼리 작성. SELF JOIN 사용.

--ANSI 표기법
SELECT e2.employee_id, e2.first_name, e2.last_name, j.job_title
    FROM hr.employees e1
        INNER JOIN hr.jobs j ON e1.job_id = j.job_id
        INNER JOIN hr.employees e2 ON e1.job_id = e2.job_id
    WHERE e1.first_name = 'Donald' AND e1.last_name = 'OConnell';


--Oracle 표기법
SELECT e2.employee_id, e2.first_name, e2.last_name, j.job_title
    FROM hr.employees e1, hr.employees e2, hr.jobs j 
    WHERE e1.job_id = j.job_id 
        AND e1.job_id = e2.job_id 
        AND e1.first_name = 'Donald' AND e1.last_name = 'OConnell';



----------------------
/*
CARTESIAN JOIN(or CROSS JOIN)

ANSI 표기법
    SELECT table1.column1, table2.column2...
    FROM  table1 CROSS JOIN table2;

Oracle 표기법
    SELECT table1.column1, table2.column2...
    FROM  table1, table2;

*/

--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments CROSS JOIN hr.employees;


--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments, hr.employees;
    
    
    
    
----------------------
/*
FULL JOIN

ANSI 표기법
    SELECT table1.column1, table2.column2...
    FROM table1 FULL JOIN table2
    ON table1.common_field = table2.common_field;

주의) Oracle 표기법에서는 FULL JOIN 지원 안함
*/

--ANSI 표기법
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d FULL JOIN hr.employees e
    ON d.department_id = e.department_id;
    
--ORA-01468: a predicate may reference only one outer-joined table 
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id(+) = e.department_id(+);



--------------------------
--문제041) hr 계정(소유자)의 employees 테이블의 정보에서  
--first_name 'Steven', last_name 'King' 직원의 부하 직원 출력. 


--문제042) hr 계정(소유자)의 employees, jobs, job_history 테이블의 정보에서  
--employee_id가 101인 직원의 잡히스토리(first_name, last_name, start_date, end_date, job_title) 출력.


--문제043) hr 계정(소유자)의 employees 테이블의 정보에서 
--부하 직원이 없는 직원 출력.


--문제044) hr 계정(소유자)의 employees 테이블의 정보에서 
--first_name 'Gerald', last_name 'Cambrault'의 salary보다 급여를 더 많이 받는 직원 정보 출력.






---------------------------------------
/*
Sub Query : A Subquery or Inner query or a Nested query is a query within another SQL query and embedded within the WHERE clause.

1. 서브쿼리는 () 안에 표기해야 한다.
2. 메인쿼리는 SELECT, INSERT, UPDATE, DELETE 등의 쿼리 사용 가능하지만, 
서브쿼리는 SELECT만 사용 가능.
3. 형식
SELECT column_list, ... , (서브쿼리) alias
    FROM table_source;
    
SELECT column_list, ... 
    FROM (서브쿼리) alias;

SELECT column_list, ... 
    FROM table_source
    WHERE column operator (서브쿼리);
*/

--JOIN
SELECT e.employee_id, first_name, last_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id = e.department_id
    AND department_name = 'Executive';
    
--Sub Query
SELECT  employee_id, first_name, last_name
    FROM hr.employees
    WHERE department_id = ??;

SELECT  employee_id, first_name, last_name
    FROM hr.employees
    WHERE department_id = (SELECT department_id FROM hr.departments 
                        WHERE department_name = 'Executive');


--SELF JOIN    
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.salary
    FROM hr.employees e1, hr.employees e2
    WHERE e1.salary = e2.salary
    AND e1.first_name='David' AND e1.last_name='Austin';
    
--Sub Query    
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT salary FROM hr.employees
                        WHERE first_name='David' AND last_name='Austin');
    
    
--주의) Sub Query 사용시 연산자가 = 인 경우는 Sub Query 결과가 단일 결과여야 한다.
--> 연산자 IN 사용하면 가능
SELECT salary FROM hr.employees
                        WHERE first_name='David';

SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT salary FROM hr.employees
                        WHERE first_name='David');
-->ORA-01427: single-row subquery returns more than one row

SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary IN (SELECT salary FROM hr.employees
                        WHERE first_name='David');
    


--복수개의 컬럼, 결과값을 동시 비교 가능    
SELECT salary, department_id FROM hr.employees
                        WHERE first_name='David' AND last_name='Austin';    
SELECT  employee_id, first_name, last_name, salary, department_id
    FROM hr.employees
    WHERE (salary, department_id) IN (SELECT salary, department_id FROM hr.employees
                        WHERE first_name='David' AND last_name='Austin');


--집계 함수의 결과값을 가지고 조건식 작성
SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary >= (SELECT AVG(salary)
                        FROM hr.employees);
                        
                        
--문제045) hr 계정(소유자)의 employees 테이블의 정보에서 급여(salary)가 가장 적은 직원 출력. Sub Query 사용.

                        
--문제046) hr 계정(소유자)의 employees 테이블의 정보에서 급여(salary)가 가장 많은 직원 출력. Sub Query 사용.

                        
--문제047) hr 계정(소유자)의 employees 테이블의 정보에서  
--first_name이 'Donald', last_name이 'OConnell'인 직원의 급여(salary)와 같은 급여 받는 직원 정보 출력.  Sub Query 사용.

                        
--문제048) hr 계정(소유자)의 employees 테이블의 정보에서 
--first_name 'Gerald', last_name 'Cambrault'의 salary보다 급여를 더 많이 받는 직원 정보 출력. Sub Query 사용.

                        
                        
--문제049) hr 계정(소유자)의 employees 테이블의 정보에서  
--first_name이 'Donald', last_name이 'OConnell'인 직원의 입사일(hire_date)와 같은 입사일인 직원 정보 출력.  Sub Query 사용.

                       
--문제050) hr 계정(소유자)의 employees 테이블의 정보에서  
--first_name 'Steven', last_name 'King' 직원의 부하 직원 출력.  Sub Query 사용.

                       
                  
                  
-----------------------------------
--연관성 있는 서브쿼리 : 메인쿼리의 값이 서브쿼리에 참여하고, 서브쿼리의 값이 메인쿼리에 참여하는 형태
--형식
/*
SELECT column_list, ... , (서브쿼리) alias
    FROM table_source alias;
*/

SELECT employee_id
    , (SELECT first_name FROM hr.employees
        WHERE employee_id = jh.employee_id) first_name
    , (SELECT last_name FROM hr.employees
        WHERE employee_id = jh.employee_id) last_name
    , start_date, end_date
    , (SELECT job_title FROM hr.jobs
        WHERE job_id = jh.job_id) job_title
    , (SELECT department_name FROM hr.departments
        WHERE department_id = jh.department_id) department_name
    FROM hr.job_history jh
    ORDER BY employee_id;




--집계함수와 일반 컬럼을 같이 출력하는 서브 쿼리 작성
SELECT employee_id, first_name, last_name, salary
    , (SELECT ROUND(AVG(salary)) FROM hr.employees
        WHERE department_id = 60) avg_salary
    FROM hr.employees
    WHERE department_id = 60;


--문제051)  hr 계정(소유자)의 employees 테이블의 정보에서 
--직원정보 출력시 직위명(hr.jobs 테이블의 job_title 컬럼)을 같이 출력. Sub Query 사용.

--JOIN

--SUB QUERY



--문제052)  hr 계정(소유자)의 departments 테이블의 정보에서 
--부서명(department_name), 부서장(manager)이름(first_name, last_name) 출력.  Sub Query 사용.




--문제053) hr 계정(소유자)의 jobs 테이블의 정보에서 
--직무(job_id)별 최고급여액(max_salary 컬럼의 값) 받는 직원 정보 출력. 
--직무이름(job_title)을 같이 출력할 것.  Sub Query 사용.

                        
    


--문제054) hr 계정(소유자)의 employees 테이블의 정보에서  
--부서별 최고 급여를 받는 직원의 정보 출력. 
--부서 이름(department_name) 같이 출력. Sub Query 사용.






-------------------------------------------
--추가문제) hr 계정(소유자)의 employees 테이블의 정보에서 
--부하 직원이 없는 직원 출력. Sub Query 사용.

--JOIN


--SUB QUERY





--------------------------------
--인라인뷰(Inline View)
--형식
/*
SELECT column_list, ... 
    FROM (서브쿼리) alias;
*/

SELECT department_id, COUNT(*) "count"
       FROM hr.employees
       GROUP BY department_id
       HAVING COUNT(*) >= 5;
        

SELECT department_id, "count"
    FROM (SELECT department_id, COUNT(*) "count"
            FROM hr.employees
            GROUP BY department_id) a
    WHERE "count" >= 5;



------------------------
--hr 계정(소유자)의 employees 테이블의 정보에서  
--부서별 최고 급여를 받는 직원의 정보 출력. 
--부서 이름(department_name) 같이 출력.

--Sub Query
SELECT employee_id, first_name, last_name, salary, department_id 
    , (SELECT department_name  FROM hr.departments 
        WHERE department_id=e.department_id) department_name 
    FROM hr.employees e
    WHERE (department_id, salary) IN (SELECT department_id, MAX(salary) 
                    FROM hr.employees GROUP BY department_id) 
    ORDER BY employee_id;

--Inline View
SELECT department_id, first_name, last_name, salary
    , (SELECT department_name  FROM hr.departments 
        WHERE department_id=e.department_id) department_name 
FROM (SELECT department_id, first_name, last_name, salary,
       RANK() OVER(PARTITION BY department_id  ORDER BY salary DESC) "RANK"
  FROM hr.employees) e
  WHERE "RANK" = 1;


--Inline View + JOIN
SELECT e.department_id, first_name, last_name, salary
    , department_name
FROM (SELECT department_id, first_name, last_name, salary,
       RANK() OVER(PARTITION BY department_id  ORDER BY salary DESC) "RANK"
  FROM hr.employees) e, hr.departments d
  WHERE e.department_id = d.department_id
  AND "RANK" = 1;


--hr 계정(소유자)의 employees, jobs 테이블의 정보에서 
--first_name 'Donald', last_name 'OConnell'과 
--직위명(job_title)이 같은 직원 정보 출력하는 쿼리 작성.
SELECT 컬럼리스트
    FROM 가상테이블1 a, 가상테이블2 b
    WHERE a.job_title = b.job_title;

--가상테이블1    
SELECT employee_id, first_name, last_name
    , job_title
    FROM hr.employees e1, hr.jobs j
    WHERE e1.job_id = j.job_id
    AND first_name='Donald' AND last_name='OConnell';

--가상테이블2    
SELECT  job_title, employee_id, first_name, last_name
    FROM hr.jobs j, hr.employees e2
    WHERE j.job_id = e2.job_id;

--Inline View + JOIN    
SELECT b.employee_id, b.first_name, b.last_name, b.job_title
    FROM (SELECT employee_id, first_name, last_name, job_title
        FROM hr.employees e1, hr.jobs j
        WHERE e1.job_id = j.job_id
        AND first_name='Donald' AND last_name='OConnell') a
    , (SELECT  job_title, employee_id, first_name, last_name
        FROM hr.jobs j, hr.employees e2
        WHERE j.job_id = e2.job_id) b
    WHERE a.job_title = b.job_title;



--문제055) hr 계정(소유자)의 employees 테이블의 정보에서 
--급여(salary) 순위가 높은 순으로 10명의 직원 출력. RANK() OVER() 함수 사용.

    

--문제056) hr 계정(소유자)의 employees 테이블의 정보에서 
--입사일(hire_date) 순위가 높은 순으로 10명의 직원 출력. RANK() OVER() 함수 사용.

    

--문제057) hr 계정(소유자)의 employees 테이블의 정보에서 
--급여(salary) 순위가 높은 순으로 두 번째 직원 출력. RANK() OVER() 함수 사용.



--문제058) hr 계정(소유자)의 employees 테이블의 정보에서 
--직원 개개인의 급여와 부서별 평균 급여와의 차이 출력. AVG() OVER() 함수 사용.



--문제059) hr 계정(소유자)의 employees 테이블의 정보에서
--부서별 급여의 합 출력. 
--각 개인의 급여가 부서 전체의 급여 합에서 차지하는 비중 출력. SUM() OVER() 함수 사용.
--비중 계산은 ROUND((개인의 급여 / 부서 전체 급여 합) * 100) 로 한다.

