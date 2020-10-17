select * from emp where sal between 500 and 1000  or sal BETWEEN 1000 AND 2000;

select sum(sal),count(empno) from emp where sal between 500 and 1000  or sal BETWEEN 1000 AND 2000;

SELECT sal,
CASE
  WHEN sal between 500 and 1000 THEN 'sal between 500 and 1000'
  WHEN sal BETWEEN 1000 AND 2000 THEN 'sal between 1000 and 2000' 
END as comments
FROM emp;