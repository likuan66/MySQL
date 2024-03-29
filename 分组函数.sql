#1.查询公司员工工资的最大值，最小值，平均值，总和

SELECT MAX(salary) 最大值,MIN(salary) 最小值,ROUND(AVG(salary),2) 平均值,SUM(salary) 和
FROM employees;

#2.查询员工表中的最大入职时间和最小入职时间的相差天数 （DIFFRENCE）
SELECT MAX(hiredate) 最大,MIN(hiredate) 最小,ROUND((MAX(hiredate)-MIN(hiredate))/1000/3600/24) DIFFRENCE
FROM employees;

SELECT MAX(hiredate) 最大,MIN(hiredate) 最小,DATEDIFF(MAX(hiredate),MIN(hiredate)) DIFFRENCE
FROM employees;

#3.查询部门编号为90的员工个数
SELECT COUNT(*)
FROM employees
WHERE department_id=90;


