#1. 查询和 Zlotkey 相同部门的员工姓名和工资

#①查询Zlotkey的部门
SELECT department_id
FROM employees
WHERE last_name='Zlotkey ';

#②查询部门号=①的姓名和工资
SELECT 
  last_name,
  salary 
FROM
  employees 
WHERE department_id = 
  (SELECT 
    department_id 
  FROM
    employees 
  WHERE last_name = 'Zlotkey') ;


#2. 查询工资比公司平均工资高的员工的员工号，姓名和工资。

#①查询查询平均工资
SELECT AVG(salary)
FROM employees

#②查询工资大于①的员工的员工号， 姓名和工资。
SELECT last_name,salary,employee_id
FROM employees
WHERE salary>(
	SELECT AVG(salary)
	FROM employees
);


#3. 查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资

#①查询各部门平均工资
SELECT AVG(salary),department_id
FROM employees
GROUP BY department_id

#②连接①结果集和employees表，进行筛选
SELECT employee_id,last_name,salary,e.department_id
FROM employees e
INNER JOIN (
	SELECT AVG(salary) ag,department_id
	FROM employees
	GROUP BY department_id

) ag_dep
ON e.department_id = ag_dep.department_id
WHERE salary>ag_dep.ag


#4. 查询和姓名中包含字母 u 的员工在相同部门的员工的员工号和姓名
#①查询姓名中包含字母 u 的员工的部门
SELECT DISTINCT department_id
FROM employees
WHERE last_name LIKE '%u%'
#②查询部门号=①中的任意一个的员工号和姓名
SELECT employee_id,last_name
FROM employees
WHERE department_id IN (
	SELECT DISTINCT department_id
	FROM employees
	WHERE last_name LIKE '%u%'
);

#5. 查询在部门的 location_id 为 1700 的部门工作的员工的员工号

#①查询location_id为1700的部门
SELECT DISTINCT department_id
FROM departments
WHERE location_id=1700
#②查询部门号等于①的任意的一个员工号
SELECT employee_id
FROM employees
WHERE department_id IN(
	SELECT DISTINCT department_id
	FROM departments
	WHERE location_id=1700
);


#6. 查询管理者是 King 的员工姓名和工资
#①查询管理者是King的员工的编号
SELECT employee_id
FROM employees
WHERE last_name='King'

#②查询哪个员工的manager_id = ①
SELECT last_name,salary
FROM employees
WHERE manager_id IN(
	SELECT employee_id
	FROM employees
	WHERE last_name = 'K_ing'
);


#7. 查询工资最高的员工的姓名，要求 first_name 和 last_name 显示为一列，列名为 姓.名

#①查找最高工资
SELECT MAX(salary)
FROM employees

#②查询工资=①的姓名
SELECT CONCAT(first_name,last_name) "姓.名"
FROM employees
WHERE salary=(
	SELECT MAX(salary)
	FROM employees
);
















