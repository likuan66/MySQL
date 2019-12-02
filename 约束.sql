#1. 向表 emp2 的 id 列中添加 PRIMARY KEY 约束（my_emp_id_pk）
ALTER TABLE emp2 MODIFY COLUMN id INT PRIMARY KEY;
ALTER TABLE emp2 ADD CONSTRAINT my_emp_id_pk PRIMARY KEY;

#2. 向表 dept2 的 id 列中添加 PRIMARY KEY 约束（my_dept_id_pk）

ALTER TABLE dept2 MODIFY COLUMN id INT PRIMARY KEY;
ALTER TABLE dept2 ADD CONSTRAINT my_dept_id_pk PRIMARY KEY;



#3. 向表 emp2 中添加列 dept_id，并在其中定义 FOREIGN KEY 约束，与之相关联的列是dept2 表中的 id 列。
ALTER TABLE emp2 ADD COLUMN dept_id INT;
ALTER TABLE emp2 ADD CONSTRAINT fk_emp2_depts FOREIGN KEY (dept_id) REFERENCES dept2(id);



