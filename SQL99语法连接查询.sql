#一、查询编号>3 的女神的男朋友信息，如果有则列出详细，如果没有，用 null 填充
SELECT b.id,b.name,bo.*
FROM beauty b
LEFT OUTER JOIN boys bo
ON b.`boyfriend_id`=bo.`id` 
WHERE b.id>3;
#二、查询哪个城市没有部门
SELECT city,d.*
FROM departments d
RIGHT OUTER JOIN locations l
ON d.location_id=l.`location_id`
WHERE d.`department_id` IS NULL;

#三、查询部门名为 SAL 或 IT 的员工信息
SELECT department_name,e.*
FROM departments d
LEFT OUTER JOIN employees e
ON d.`department_id`=e.`department_id`
WHERE d.department_name IN('SAL','IT');