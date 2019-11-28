#案例1：查询女神名和对应的男神名
SELECT b.name,bo.boyName
FROM beauty b,boys bo
WHERE b.boyfriend_id=bo.id;

#案例2：查询员工名和对应的部门名

SELECT last_name,department_name
FROM employees,departments
WHERE employees.`department_id`=departments.`department_id`;


#查询员工名、工种号、工种名

SELECT e.last_name,e.job_id,j.job_title
FROM employees e,jobs j
WHERE e.job_id=j.job_id;

#案例：查询有奖金的员工名、部门名


SELECT e.last_name,d.department_name,e.commission_pct
FROM employees e,departments d
WHERE e.`department_id`=d.`department_id`
AND e.`commission_pct` IS NOT NULL;

#案例2：查询城市名中第二个字符为o的部门名和城市名

SELECT d.department_name,l.city
FROM departments d,locations l
WHERE d.location_id=l.location_id AND l.city LIKE'_o%';


#案例1：查询每个城市的部门个数
SELECT COUNT(*),city
FROM departments d,locations l
WHERE d.location_id=l.location_id;
GROUP BY city;



#案例2：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资

SELECT d.department_name,d.manager_id,MIN(salary)
FROM departments d,employees e
WHERE e.department_id=e.`department_id` AND commission_pct IS NOT NULL
GROUP BY department_name,d.manager_id;


#案例：查询每个工种的工种名和员工的个数，并且按员工个数降序

SELECT j.job_title,COUNT(*)
FROM employees e,jobs j
WHERE e.job_id=j.`job_id`
GROUP BY job_title
ORDER BY COUNT(*) DESC;


#案例：查询员工名、部门名和所在的城市

SELECT last_name,department_name,city
FROM employees e,departments d,locations l
WHERE e.department_id=d.department_id AND d.location_id=l.location_id;


#案例1：查询员工的工资和工资级别


SELECT salary,grade_level
FROM employees e,job_grades j
WHERE salary BETWEEN j.lowest_sal AND j.`highest_sal` AND j.grade_level='A';


SELECT * FROM job_grades;
CREATE TABLE job_grades
(grade_level VARCHAR(3),
 lowest_sal  INT,
 highest_sal INT);




#3、自连接



#案例：查询 员工名和上级的名称

SELECT e.employee_id,e.last_name,m.employee_id,m.last_name
FROM employees e,employees m
WHERE e.`manager_id`=m.`employee_id`;
