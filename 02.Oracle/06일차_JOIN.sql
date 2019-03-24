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
/*
LEFT JOIN (OUTER JOIN)

ANSI 표기법
    SELECT table1.column1, table2.column2...
    FROM table1
    LEFT JOIN table2
    ON table1.common_field = table2.common_field;
    
Oracle 표기법
    SELECT table1.column1, table2.column2...
    FROM table1, table2
    WHERE table1.common_field = table2.common_field(+);

*/

--ANSI 표기법
SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d LEFT JOIN hr.employees e
    ON d.department_id = e.department_id;

--Oracle 표기법
SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id = e.department_id(+);




SELECT  employee_id, first_name, last_name, d.department_id, department_name, d.manager_id
    FROM hr.employees e LEFT JOIN hr.departments d
    ON e.department_id = d.department_id;    

SELECT  employee_id, first_name, last_name, d.department_id, department_name, d.manager_id
    FROM hr.employees e, hr.departments d
    WHERE e.department_id = d.department_id(+);



SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d LEFT JOIN hr.employees e
    ON d.manager_id = e.employee_id;

SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d, hr.employees e
    WHERE d.manager_id = e.employee_id(+);


--문제033) hr 계정(소유자)의 jobs, employees 테이블의 정보에서 
--직위 정보를 기준으로 직원 정보를 같이 출력하는 쿼리 작성. LEFT JOIN 사용.

--ANSI 표기법


--Oracle 표기법




--문제034) hr 계정(소유자)의 employees, job_history 테이블의 정보에서 
--직원 정보를 기준으로 부서, 직위 변동 정보를 같이 출력하는 쿼리 작성. LEFT JOIN 사용.

--ANSI 표기법

    
    
--Oracle 표기법



----------------------------------
--문제035) hr 계정(소유자)의 employees, jobs 테이블의 정보에서  
--first_name 'Neena', last_name 'Kochhar' 직원의 직무명(job_title)까지 출력. INNER JOIN 사용.

--ANSI 표기법

    
--Oracle 표기법





--문제036)  hr 계정(소유자)의 employees, jobs 테이블의 정보에서 
--직위명(job_title)별 최소급여(min_salary)를 받는 직원 출력. INNER JOIN 사용.
--3명

--ANSI 표기법

    
--Oracle 표기법



--문제037) hr 계정(소유자)의 employees, jobs 테이블의 정보에서
--직위명(job_title)별 직원의 수 출력.  INNER JOIN 사용.

--ANSI 표기법

    
--Oracle 표기법


--문제038)  hr 계정(소유자)의 employees, departments 테이블의 정보에서 
--first_name 'David', last_name 'Austin' 직원이 속한 
--부서명(department_name), 부서장(manager)이름(first_name, last_name) 출력.  INNER JOIN 사용.

--ANSI 표기법


--Oracle 표기법

        


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



--문제039)  hr 계정(소유자)의 employees 테이블의 정보에서 
--first_name 'Donald', last_name 'OConnell'과 직위아이디(job_id)가 같은 직원 정보 출력하는 쿼리 작성. SELF JOIN 사용.

--ANSI 표기법


--Oracle 표기법


--문제040)  hr 계정(소유자)의 employees, jobs 테이블의 정보에서 
--first_name 'Donald', last_name 'OConnell'과 직위명(job_title)가 같은 직원 정보 출력하는 쿼리 작성. SELF JOIN 사용.

--ANSI 표기법


--Oracle 표기법


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
