
SELECT dname, COUNT(ssn)
FROM employee, department
WHERE dno=dnumber GROUP by dno having avg(salary)>30000;


SELECT dname, COUNT(*)
FROM employee, department
WHERE department.dnumber=employee.dno
AND sex='M' AND salary>30000
GROUP BY dname;


SELECT fname, lname
FROM employee
WHERE dno IN(SELECT dno
FROM employee
WHERE salary=(SELECT MAX(salary)
FROM employee));


SELECT *
FROM employee
WHERE super_ssn='888665555';


SELECT fname, lname
FROM employee
WHERE salary>10000 + (SELECT MIN(salary) FROM employee);