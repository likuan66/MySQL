#1.查询工资最低的员工信息：last_name,salary
#①查询最低的工资
SELECT MIN(salary)
FROM employees
#查询last_name,salary，要求salary=①
SELECT last_name,salary
FROM employees
WHERE salary=(
	SELECT MIN(salary)
	FROM employees
)

#2.查询平均工资最低的部门信息
#①查询各部门的平均最低工资
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY AVG(salary)
LIMIT 1
#②查询各部门信息
SELECT *
FROM departments 
WHERE department_id=(
	SELECT department_id
	FROM employees
	GROUP BY department_id
	ORDER BY AVG(salary)
	LIMIT 1
);

#3.查询平均工资最低的部门信息和该部门的平均工资
#①查询平均成绩最低的部门编号
SELECT AVG(salary),department_id
FROM employees
GROUP BY department_id
ORDER BY AVG(salary)
LIMIT 1
#②查询①的部门信息和平均成绩
SELECT d.*,ag
FROM departments d
JOIN (
	SELECT AVG(salary) ag,department_id
	FROM employees
	GROUP BY department_id
	ORDER BY AVG(salary)
	LIMIT 1
) av_dep
ON d.department_id=av_dep.department_id

#4，查询平均工资最高的job的信息
#①查询平均工资最高的job_id
SELECT job_id
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC
LIMIT 1
#②查询①的信息
SELECT *
FROM jobs 
WHERE job_id=(
	SELECT job_id
	FROM employees
	GROUP BY job_id
	ORDER BY AVG(salary) DESC
	LIMIT 1
);

#5,查询平均工资高于公司平均工资的部门有那些
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary)>(
	SELECT AVG(salary)
	FROM employees
);

#6,查询出公司所有manager的详细信息
#①查询公司所有manager_id
SELECT DISTINCT manager_id
FROM employees
#②查询详细信息满足，employee_id=①
SELECT *
FROM employees
WHERE employee_id=ANY(
	SELECT DISTINCT manager_id
	FROM employees
);

#7，各个部门中，最高工资中最低的那个部门的，最低工资是多少

#①查询各部门的最高工资中最低的那个部门
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY MAX(salary) ASC
LIMIT 1

#查询department_id=①的最低工资
SELECT MIN(salary)
FROM employees
WHERE department_id=(
	SELECT department_id
	FROM employees
	GROUP BY department_id
	ORDER BY MAX(salary) ASC
	LIMIT 1
);

#8，查询平均工资最高的部门的，manager的详细信息：last_name,department_id,email,salary
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1

SELECT last_name,d.department_id,email,salary
FROM employees e
INNER JOIN departments d
ON d.manager_id=e.employee_id
WHERE d.department_id=(

	SELECT department_id
	FROM employees
	GROUP BY department_id
	ORDER BY AVG(salary) DESC
	LIMIT 1
);























