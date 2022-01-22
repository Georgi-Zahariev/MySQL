#use needed database
use soft_uni;
#1
SELECT first_name , last_name FROM employees WHERE first_name LIKE "Sa%" ORDER BY employee_id;
#2
SELECT first_name , last_name FROM employees WHERE last_name LIKE "%ei%" ORDER BY employee_id;
#3
SELECT first_name FROM employees WHERE (department_id=3 OR department_id=10) 
AND YEAR(hire_date) BETWEEN 1995 AND 2005 ORDER BY employee_id;
#4
SELECT first_name , last_name FROM employees WHERE INSTR(job_title,"engineer")=0 
ORDER BY employee_id;
#5
SELECT name FROM towns WHERE LENGTH(name)=5 OR LENGTH(name)=6 ORDER BY name;
#6
SELECT town_id, name FROM towns WHERE (name Like "M%") OR (name Like "K%") OR
(name Like "B%") OR (name Like "E%") ORDER BY name;
#7
SELECT town_id, name FROM towns WHERE NOT((name Like "R%") OR (name Like "B%") OR
(name Like "D%") ) ORDER BY name;
#8
CREATE OR REPLACE VIEW v_employees_hired_after_2000 AS 
SELECT first_name , last_name FROM employees WHERE YEAR(hire_date)>2000;
SELECT * FROM  v_employees_hired_after_2000;
#9
SELECT first_name , last_name FROM employees WHERE LENGTH(last_name)=5;
#use needed database
use geography;
#10
SELECT country_name, iso_code FROM countries WHERE country_name Like "%a%a%a%" 
ORDER BY iso_code;
#11
SELECT peak_name , river_name , Concat(lower(peak_name),right(lower(river_name),length(river_name)-1)) AS mix FROM peaks,rivers 
WHERE right(peak_name,1)=left(river_name,1)
ORDER BY mix;
#use needed database
use diablo;
#12
SELECT name, left(start,10) AS start FROM games
WHERE YEAR(start)=2011 OR YEAR(start)=2012 ORDER BY start,name
LIMIT 50;
#13
SELECT user_name , right(email, (length(email)-locate("@",email))) as `email provider` FROM users
ORDER BY `email provider`, user_name;
#14
SELECT user_name , ip_address FROM users WHERE ip_address Like '___.1%.%.___' ORDER BY user_name;
#15
SELECT name, if(hour(start)>=0 AND hour(start)<12, "Morning",if(hour(start)<18, "Afternoon", "Evening")) AS `Part of the Day`,
if(duration<=3,"Extra Short", if(duration<=6,"Short", If(duration<=10,"Long","Extra Long"))) AS Duration FROM games;
#16
#no database for this query
SELECT product_name, order_date, date_add(order_date , INTERVAL 3 DAY) AS pay_due, 
date_add(order_date, INTERVAL 1 MONTH) AS deliver_due from orders ;
