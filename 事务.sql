#1.创建一个表，里面有 id 为主键，stuname 唯一键，seat 座位号，要求将 id 设置成自增
CREATE TABLE dept3(
	id INT PRIMARY KEY AUTO_INCREMENT,
	stuname VARCHAR(20) NOT NULL UNIQUE,
	seat INT 
);
DESC  dept3;
#2.要求用事务的方式插入 3 行数据
SET autocommit=0; #开启事务

INSERT INTO dept3(id,stuname,seat)
VALUES(1,'haha',20);

COMMIT;#结束事务
#3.要求用事务的方式删除数据，并回滚
SET autommit=0; #开启事务
DELETE FROM dept3;
SELECT * FROM dept3;
ROLLBACK;