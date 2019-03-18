/*
SQL is a language to operate databases; it includes database creation, deletion, fetching rows, modifying rows, etc. 

DDL - Data Definition Language
CREATE
ALTER
DROP

DML - Data Manipulation Language
SELECT
INSERT
UPDATE
DELETE

DCL - Data Control Language
GRANT
REVOKE


SELECT [컬럼명] FROM [테이블명]

특정 테이블의 자료 조회
컬럼명 나열시 *(와일드카드) 사용 가능

*/


--hr 계정의 employees 테이블에 대한 SELECT 쿼리 실행
SELECT * 
    FROM hr.employees;
    
