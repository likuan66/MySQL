#一、创建视图 emp_v1,要求查询电话号码以‘011’开头的员工姓名和工资、邮箱
CREATE OR REPLACE VIEW emp_v1
AS
SELECT last_name,salary,email,phone_number
FROM employees
WHERE phone_number LIKE '011%';

SELECT * FROM emp_v2;

#二、要求将视图 emp_v1 修改为查询电话号码以‘011’开头的并且邮箱中包含 e 字符的员工姓名和邮箱、电话号码
CREATE OR REPLACE VIEW emp_v1
AS
SELECT last_name,email,phone_number
FROM employees
WHERE phone_number LIKE '011%'
AND email LIKE '%e%';

#三、向 emp_v1 插入一条记录，是否可以？
INSERT INTO emp_v1 VALUES('张飞1133',7868,'Tencet');

#四、修改刚才记录中的电话号码为‘0119’

UPDATE emp_v1 SET pphone_number='0119'

五、删除刚才记录
#六、创建视图 emp_v2，要求查询部门的最高工资高于 12000 的部门信息
CREATE OR REPLACE VIEW emp_v2
AS
SELECT d.department_id,d.manager_id,d.location_id,MAX(salary)
FROM departments d
JOIN employees e
ON e.department_id=d.department_id
GROUP BY e.department_id
HAVING MAX(salary)>12000;

#或者
CREATE OR REPLACE VIEW emp_v2
AS
SELECT MAX(salary) mx_dep,department_id
FROM employees
GROUP BY department_id
HAVING MAX(salary)>12000;

SELECT d.*,m.mx_dep
FROM departments d
JOIN emp_v2 m
ON m.department_id=d.department_id;



#七、向 emp_v2 中插入一条记录，是否可以？
不可以，因为emp_v2中带有分组函数
#八、删除刚才的 emp_v2 和 emp_v1
DELETE VIEW emp_v2,emp_v1;