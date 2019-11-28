#1. 显示所有员工的姓名，部门号和部门名称。
SELECT last_name,d.department_id,department_name
FROM departments d,employees e
WHERE d.`department_id`=e.`department_id`;

#2. 查询 90 号部门员工的 job_id 和 90 号部门的 location_id
SELECT job_id,location_id
FROM employees e,departments d
WHERE e.`department_id`=d.`department_id`
AND e.`department_id`=90;

#3. 选择所有有奖金的员工的last_name , department_name , location_id , city

SELECT last_name , department_name , d.location_id , city
FROM employees e,departments d,locations l
WHERE e.`department_id`=d.`department_id`
AND d.`location_id`=l.`location_id`
AND e.`commission_pct`IS NOT NULL;

#4. 选择city在Toronto工作的员工的last_name , job_id , department_id , department_name 
SELECT last_name , job_id , d.department_id , department_name
FROM employees e,departments d,locations l
WHERE e.`department_id`=d.department_id
AND d.`location_id`=l.`location_id`
AND l.city='Toronto';

#5.查询每个工种、每个部门的部门名、工种名和最低工资
SELECT department_name,job_title,MIN(salary)
FROM employees e,jobs j,departments d
WHERE e.`job_id`=j.`job_id`
AND e.`department_id`=d.`department_id`
GROUP BY department_name,job_title;

#6.查询每个国家下的部门个数大于 2 的国家编号
SELECT country_id,COUNT(*)
FROM locations l,departments d
WHERE l.`location_id`=d.`location_id`
GROUP BY country_id
HAVING COUNT(*)>2;



#7、选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格式
employees	Emp#	manager	Mgr#
kochhar		101	king	100

SELECT e.last_name employees,e.employee_id "Emp#",m.last_name manager,m.employee_id "Mgr#"
FROM employees e,employees m
WHERE e.manager_id=m.employee_id
AND e.last_name='kochhar';












