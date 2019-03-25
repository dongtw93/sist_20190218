/*
JOIN : �� �� �̻��� ���̺��� �����ؼ� ��ȸ�ϴ� ���

1. INNER JOIN : returns rows when there is a match in both tables.
2. LEFT JOIN : returns all rows from the left table, even if there are no matches in the right table.
3. RIGHT JOIN : returns all rows from the right table, even if there are no matches in the left table.
4. FULL JOIN : returns rows when there is a match in one of the tables.
5. SELF JOIN : is used to join a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement.
6. CARTESIAN JOIN : returns the Cartesian product of the sets of records from the two or more joined tables.
*/



------------------------
/*
SELF JOIN : Alias ���� �ʼ�

ANSI ǥ���
    SELECT a.column_name, b.column_name...
    FROM table1 a INNER JOIN table1 b
    ON a.common_field = b.common_field;


Oracle ǥ���
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



--����039)  hr ����(������)�� employees ���̺��� �������� 
--first_name 'Donald', last_name 'OConnell'�� �������̵�(job_id)�� ���� ���� ���� ����ϴ� ���� �ۼ�. SELF JOIN ���.

--ANSI ǥ���


--Oracle ǥ���


--����040)  hr ����(������)�� employees, jobs ���̺��� �������� 
--first_name 'Donald', last_name 'OConnell'�� ������(job_title)�� ���� ���� ���� ����ϴ� ���� �ۼ�. SELF JOIN ���.

--ANSI ǥ���


--Oracle ǥ���


----------------------
/*
CARTESIAN JOIN(or CROSS JOIN)

ANSI ǥ���
    SELECT table1.column1, table2.column2...
    FROM  table1 CROSS JOIN table2;

Oracle ǥ���
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

ANSI ǥ���
    SELECT table1.column1, table2.column2...
    FROM table1 FULL JOIN table2
    ON table1.common_field = table2.common_field;

����) Oracle ǥ��������� FULL JOIN ���� ����
*/

--ANSI ǥ���
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d FULL JOIN hr.employees e
    ON d.department_id = e.department_id;
    
--ORA-01468: a predicate may reference only one outer-joined table 
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id(+) = e.department_id(+);



--------------------------
--����041) hr ����(������)�� employees ���̺��� ��������  
--first_name 'Steven', last_name 'King' ������ ���� ���� ���. 


--����042) hr ����(������)�� employees, jobs, job_history ���̺��� ��������  
--employee_id�� 101�� ������ �������丮(first_name, last_name, start_date, end_date, job_title) ���.


--����043) hr ����(������)�� employees ���̺��� �������� 
--���� ������ ���� ���� ���.


--����044) hr ����(������)�� employees ���̺��� �������� 
--first_name 'Gerald', last_name 'Cambrault'�� salary���� �޿��� �� ���� �޴� ���� ���� ���.


