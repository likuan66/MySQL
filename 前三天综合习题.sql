#一，查询每个专业的学生人数
SELECT majorid,COUNT(*)
FROM student
GROUP BY majorid
#二，查询参加考试的学生中，每个学生的平均分，最高分
SELECT AVG(score),MAX(score),studentno
FROM result
GROUP BY studentno;
#三，查询姓张的每个学生的最低分大于60的学号，姓名
SELECT s.studentno,s.studentname,MIN(score)
FROM student s,result r
WHERE s.`studentno`=r.`studentno`
AND s.`studentname` LIKE '张%'
GROUP BY s.studentno
HAVING MIN(score)>60;
#四，查询每个专业生日在“1998-1-1”后的学生的姓名，专业名称
SELECT studentname,majorname
FROM student s
JOIN major m
ON s.`majorid`=m.`majorid`
WHERE DATEDIFF(borndate,'1998-1-1')>0;
#五，查询每个专业的男生人数和女生人数分别是多少
方式一：
SELECT COUNT(*),sex,majorid
FROM student
GROUP BY sex,majorid;
方式二
SELECT majorid,
(SELECT COUNT(*) FROM student WHERE sex='男' AND majorid=s.majorid) 男,
(SELECT COUNT(*) FROM student WHERE sex='女' AND majorid=s.majorid) 女
FROM student s
GROUP BY majorid;
#六，查询专业和张翠山一样的学生的最低分
#①查询张翠山的专业编号
SELECT majorid
FROM student
WHERE studentname='张翠山'
#查询等于①相同的所有学生的专业编号
SELECT studentno
FROM student
WHERE majorid=(
	SELECT majorid
	FROM student
	WHERE studentname='张翠山'
)
#查询最低分数
SELECT MIN(score)
FROM result
WHERE studentno IN (
	SELECT studentno
	FROM student
	WHERE majorid=(
		SELECT majorid
		FROM student
		WHERE studentname='张翠山'
	)
);
#七，查询大于60分的学生的姓名，密码，专业名
SELECT studentname,loginpwd,majorname,score
FROM major m,student s,result r
WHERE m.`majorid`=s.`majorid`
AND r.`studentno`=s.`studentno`
AND score>60;

#八，按邮箱位数分组，查询每组学生个数
SELECT COUNT(*),LENGTH(email)
FROM student
GROUP BY LENGTH(email)
#九，查询学生号，专业号，分数
SELECT studentname,m.majorname,score
FROM student s,major m,result r
WHERE m.majorid=s.majorid 
AND r.studentno=s.studentno;
#十，查询那个专业没有学生，分别用左连接和右连接实现
#左
SELECT m.majorname,m.majorid,s.studentno
FROM major m
LEFT OUTER JOIN student s
ON s.majorid=m.`majorid` 	
WHERE s.`studentno` IS NULL;
#右
SELECT m.majorname,m.majorid,s.studentno
FROM student s
RIGHT OUTER JOIN major m
ON s.majorid=m.`majorid` 	
WHERE s.`studentno` IS NULL;

#查询没有成绩的学生人数
SELECT COUNT(*),r.score
FROM student s
LEFT JOIN result r
ON r.`studentno`=s.`studentno`
WHERE r.score IS NULL;











