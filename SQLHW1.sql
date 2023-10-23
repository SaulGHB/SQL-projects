# homework 1 #
select fname from employee, dependent where dependent_name = 'Alice' and employee.SSN=dependent.essn;
select fname from employee,department,project,works_on where dname = 'Research' and employee.Dno=department.dnumber and employee.SSN=works_on.essn and hours >10 and pname='ProductX';
select fname from employee, dependent where dependent.dependent_name = employee.Fname and employee.ssn=dependent.essn;
select fname from employee, department where employee.Dno=department.dnumber and employee.Super_ssn='333445555';