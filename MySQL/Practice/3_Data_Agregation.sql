#use needed database
use gringotts;
#1
SELECT count(*) AS count FROM wizzard_deposits;
#2
SELECT MAX(magic_wand_size) FROM wizzard_deposits;
#3
SELECT deposit_group, max(magic_wand_size) AS longest_magic_wand FROM wizzard_deposits GROUP BY deposit_group
ORDER BY longest_magic_wand , deposit_group;
#4
SELECT deposit_group FROM wizzard_deposits GROUP BY deposit_group 
ORDER BY avg(magic_wand_size) ASC LIMIT 1;
#5
SELECT deposit_group, sum(deposit_amount) AS total_sum FROM wizzard_deposits 
GROUP BY deposit_group ORDER BY total_sum;
#6
SELECT deposit_group,  sum(deposit_amount) AS total_sum FROM wizzard_deposits 
WHERE magic_wand_creator="Ollivander family" GROUP BY deposit_group   
ORDER BY deposit_group;
#7
SELECT deposit_group,  sum(deposit_amount) AS total_sum FROM wizzard_deposits 
WHERE magic_wand_creator="Ollivander family" 
GROUP BY deposit_group HAVING total_sum<150000 ORDER BY total_sum DESC;
#8
SELECT deposit_group, magic_wand_creator, min(deposit_charge) FROM wizzard_deposits
GROUP BY deposit_group, magic_wand_creator
ORDER BY  magic_wand_creator, deposit_group;
#9
CREATE TABLE groups_w AS SELECT '[0-10]', COUNT(*) AS wizzard_count FROM wizzard_deposits WHERE age BETWEEN 0 AND 10
union
SELECT '[11-20]', COUNT(*) AS w FROM wizzard_deposits WHERE age BETWEEN 11 AND 20
union
SELECT '[21-30]', COUNT(*) FROM wizzard_deposits WHERE age BETWEEN 21 AND 30
union
SELECT '[31-40]', COUNT(*) FROM wizzard_deposits WHERE age BETWEEN 31 AND 40
union
SELECT '[41-50]', COUNT(*) FROM wizzard_deposits WHERE age BETWEEN 41 AND 50
union
SELECT '[51-60]', COUNT(*) FROM wizzard_deposits WHERE age BETWEEN 51 AND 60
union
SELECT '[61+]', COUNT(*) FROM wizzard_deposits WHERE age>=61;
SELECT * FROM groups_w WHERE wizzard_count>0;
#10
SELECT left(first_name,1) AS first_letter FROM wizzard_deposits
WHERE deposit_group like "Troll Chest"
GROUP BY first_letter ORDER BY first_letter;
#11
SELECT deposit_group, is_deposit_expired , avg(deposit_interest) AS average_interest
FROM wizzard_deposits
WHERE deposit_start_date>'1985-01-01'
GROUP BY deposit_group,is_deposit_expired
ORDER BY deposit_group DESC, is_deposit_expired;
#use needed database
use soft_uni2;
#12
SELECT department_id, min(salary) FROM employees
WHERE (department_id=2 OR department_id=5 OR department_id=7) AND hire_date>'2000-01-01'
GROUP BY department_id ORDER BY department_id;
#13
CREATE TABLE new_tab AS SELECT * FROM employees WHERE salary>30000;
DELETE FROM new_tab WHERE manager_id=42;
UPDATE new_tab SET salary=salary+5000 WHERE department_id=1;
SELECT department_id , avg(salary) FROM new_tab
GROUP BY department_id 
ORDER BY department_id;
#14
SELECT department_id, max(salary) AS max_salary FROM employees
GROUP BY department_id HAVING max_salary NOT Between 30000 AND 70000
ORDER BY department_id;
#15
SELECT count(*) as '' from employees WHERE manager_id is null;
#16
CREATE TABLE Q1 AS Select DISTINCT 1, salary as third_max_salary FROM employees WHERE department_id=1 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q2 AS Select DISTINCT 2, salary as third_max_salary FROM employees WHERE department_id=2 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q3 AS Select DISTINCT 3, salary as third_max_salary FROM employees WHERE department_id=3 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q4 AS Select DISTINCT 4, salary as third_max_salary FROM employees WHERE department_id=4 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q5 AS Select DISTINCT 5, salary as third_max_salary FROM employees WHERE department_id=5 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q6 AS Select DISTINCT 6, salary as third_max_salary FROM employees WHERE department_id=6 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q7 AS Select DISTINCT 7, salary as third_max_salary FROM employees WHERE department_id=7 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q8 AS Select DISTINCT 8, salary as third_max_salary FROM employees WHERE department_id=8 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q9 AS Select DISTINCT 9, salary as third_max_salary FROM employees WHERE department_id=9 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q10 AS Select DISTINCT 10, salary as third_max_salary FROM employees WHERE department_id=10 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q11 AS Select DISTINCT 11, salary as third_max_salary FROM employees WHERE department_id=11 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q12 AS Select DISTINCT 12, salary as third_max_salary FROM employees WHERE department_id=12 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q13 AS Select DISTINCT 13, salary as third_max_salary FROM employees WHERE department_id=13 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q14 AS Select DISTINCT 14, salary as third_max_salary FROM employees WHERE department_id=14 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q15 AS Select DISTINCT 15, salary as third_max_salary FROM employees WHERE department_id=15 ORDER BY salary DESC LIMIT 1 OFFSET 2;
CREATE TABLE Q16 AS Select DISTINCT 16, salary as third_max_salary FROM employees WHERE department_id=16 ORDER BY salary DESC LIMIT 1 OFFSET 2;

SELECT  * from Q1 UNION SELECT  * from Q2 UNION SELECT  * from Q3 UNION SELECT  * from Q4 UNION
SELECT  * from Q5 UNION SELECT  * from Q6 UNION SELECT  * from Q7 UNION SELECT  * from Q8 UNION
SELECT  * from Q9 UNION SELECT  * from Q10 UNION SELECT  * from Q11 UNION SELECT  * from Q12 UNION
SELECT  * from Q13 UNION SELECT  * from Q14 UNION SELECT  * from Q15 UNION SELECT  * from Q16 
WHERE third_max_salary IS NOT NULL;
#17
SELECT first_name, last_name , department_id FROM employees 
LEFT JOIN 
(SELECT department_id as id, avg(salary) as avg_s from employees 
GROUP BY department_id) AS Q1 
ON department_id=id 
WHERE salary>avg_s ORDER BY department_id, employee_id LIMIT 10;
#18
SELECT department_id, sum(salary) AS total_salary from employees
GROUP BY department_id ORDER BY department_id;