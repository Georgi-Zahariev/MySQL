#1
SELECT * FROM departments ORDER BY department_id, manager_id;
#2
SELECT name from departments ORDER by department_id, manager_id;
#3
SELECT first_name, last_name, salary FROM  employees ORDER BY employee_id;
#4
SELECT first_name, middle_name, last_name FROM  employees ORDER BY employee_id;
#5
SELECT  concat(first_name,'.',last_name, '@softuni.bg') as full_email_address From employees;
#6
SELECT salary From employees GROUP BY salary;
#7
SELECT * FROM employees WHERE job_title='Sales Representative' ORDER BY employee_id;
#8
SELECT first_name, last_name, job_title FROM employees WHERE salary BETWEEN 20000 AND 30000 ORDER BY employee_id;
#9
SELECT concat_ws(' ',first_name, middle_name, last_name) AS `Full Name` FROM employees 
WHERE salary=25000 or salary=14000 or salary=12500 or salary=23600;
#10
SELECT first_name , last_name FROM employees WHERE manager_id IS NULL;
#11
SELECT first_name, last_name , salary FROM employees WHERE salary>50000 ORDER BY salary DESC; 
#12
SELECT first_name, last_name FROM employees ORDER BY salary DESC LIMIT 5;
#13
SELECT first_name, last_name FROM employees WHERE department_id!=4;
#14
SELECT * FROM employees ORDER BY salary DESC, first_name , last_name DESC, middle_name;
#15
CREATE OR REPLACE VIEW v_employees_salaries AS SELECT first_name, last_name , salary FROM employees;
#16
CREATE OR REPLACE VIEW v_employees_job_titles AS SELECT 
Concat(first_name , if(middle_name IS NULL, '',concat(' ', middle_name)), ' ', last_name) AS full_name,
job_title FROM employees;
#17
SELECT job_title FROM employees GROUP BY job_title ORDER BY job_title;
#18
SELECT * FROM projects ORDER BY start_date, name, project_id LIMIT 10;
#19
SELECT first_name, last_name , hire_date FROM employees ORDER BY hire_date DESC LIMIT 7;
#20
UPDATE employees SET salary=salary*1.12 WHERE
department_id=1 OR department_id=2 OR department_id=4 OR department_id=11;
SELECT salary FROM employees;
#21
SELECT peak_name FROM peaks ORDER BY peak_name;
#22
SELECT country_name, population FROM countries WHERE continent_code='EU'
ORDER BY population DESC, country_name ASC LIMIT 30;
#23
use geography;
SELECT country_name, country_code, if(currency_code='EUR', 'Euro','Not Euro') AS currency
FROM countries ORDER BY country_name;
#24
USE diablo;
SELECT name from characters order by name;
