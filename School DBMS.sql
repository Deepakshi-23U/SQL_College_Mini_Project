REM   Script: Session 01
REM   School DBMS

create table student( 
    id int, 
    name varchar(20), 
    dept_id varchar(5), 
    class int, 
    age int,  
    PRIMARY KEY(id));

INSERT INTO student VALUES(1,'Deepakshi','pcm',12,17);
INSERT INTO student VALUES(2,'Devansh','pcm',12,17);
INSERT INTO student VALUES(3,'Saba','com',12,18);
INSERT INTO student VALUES(4,'Tanisha','med',12,18);
INSERT INTO student VALUES(5, 'Ishan', 'arts', 12, 17);
INSERT INTO student VALUES(6, 'Kartikey', 'arts', 12, 18);
INSERT INTO student VALUES(7, 'Sarthak', 'arts', 12, 17);

alter table student 
add dob varchar(8);

create table teacher( 
    Tid varchar(9), 
    Tname varchar(20), 
    dept_id varchar(5), 
    PRIMARY KEY(Tid) 
);

INSERT INTO teacher VALUES('p1252','Bhavna','pcm');
INSERT INTO teacher VALUES('p1329','Sangeeta','pcm');
INSERT INTO teacher VALUES('c2020','Virrapan','com');
INSERT INTO teacher VALUES('c2132','Sunny','com');
INSERT INTO teacher VALUES('m4783', 'Tarun', 'med');
INSERT INTO teacher VALUES('m3969', 'Vasu', 'med');
INSERT INTO teacher VALUES('a1837', 'Hemant', 'arts');
INSERT INTO teacher VALUES('a9876', 'Tanav', 'arts');

create table subject( 
    sub_id varchar(6), 
    sub_name varchar(10), 
	Tid varchar(9), 
	PRIMARY KEY(sub_id), 
    FOREIGN KEY(Tid) REFERENCES teacher(Tid));

INSERT INTO subject VALUES('PHY','PHYSICS','p1252');
INSERT INTO subject VALUES('MA','MATHS','c2020');
INSERT INTO subject VALUES('CHEM','CHEMISTRY','p1329');
INSERT INTO subject VALUES('BIO','BIOLOGY','m3969');
INSERT INTO subject VALUES('ZOO','ZOOLOGY','m4783');
INSERT INTO subject VALUES('HIS','HISTORY','a1837');
INSERT INTO subject VALUES('PSY','PSYCHOLOGY','a9876');
INSERT INTO subject VALUES('ACC','ACCOUNTS','c2132');
INSERT INTO subject VALUES('ECO','ECONOMICS','c2020');

create table marks( 
    id int, 
    sub_id varchar(6), 
    marks int, 
    PRIMARY KEY(id,sub_id), 
    FOREIGN KEY(id) REFERENCES student(id), 
    FOREIGN KEY(sub_id) REFERENCES subject(sub_id) 
);

INSERT INTO marks VALUES(1,'PHY', 95);
INSERT INTO marks VALUES(1,'CHEM', 90);
INSERT INTO marks VALUES(1,'MA', 98);
INSERT INTO marks VALUES(2,'PHY', 94);
INSERT INTO marks VALUES(2,'CHEM', 89);
INSERT INTO marks VALUES(2,'MA', 99);
INSERT INTO marks VALUES(3,'MA', 93);
INSERT INTO marks VALUES(3,'ACC', 97);
INSERT INTO marks VALUES(3,'ECO', 90);
INSERT INTO marks VALUES(4,'PHY', 89);
INSERT INTO marks VALUES(4,'CHEM', 79);
INSERT INTO marks VALUES(4,'BIO', 87);
INSERT INTO marks VALUES(4,'ZOO', 90);
INSERT INTO marks VALUES(5,'PSY', 78);
INSERT INTO marks VALUES(5,'HIS', 92);
INSERT INTO marks VALUES(6,'PSY', 98);
INSERT INTO marks VALUES(6,'HIS', 85);
INSERT INTO marks VALUES(7,'PSY', 94);
INSERT INTO marks VALUES(7,'HIS', 88);

create table enrolled( 
    id int, 
    sub_id varchar(6), 
    PRIMARY KEY(id, sub_id), 
    FOREIGN KEY(id) REFERENCES student(id), 
    FOREIGN KEY(sub_id) REFERENCES subject(sub_id) 
);

INSERT INTO enrolled VALUES(1,'PHY');
INSERT INTO enrolled VALUES(1,'CHEM');
INSERT INTO enrolled VALUES(1,'MA');
INSERT INTO enrolled VALUES(2,'PHY');
INSERT INTO enrolled VALUES(2,'CHEM');
INSERT INTO enrolled VALUES(2,'MA');
INSERT INTO enrolled VALUES(3,'MA');
INSERT INTO enrolled VALUES(3,'ECO');
INSERT INTO enrolled VALUES(3,'ACC');
INSERT INTO enrolled VALUES(4,'PHY');
INSERT INTO enrolled VALUES(4,'CHEM');
INSERT INTO enrolled VALUES(4,'BIO');
INSERT INTO enrolled VALUES(4,'ZOO');
INSERT INTO enrolled VALUES(5,'PSY');
INSERT INTO enrolled VALUES(5,'HIS');
INSERT INTO enrolled VALUES(6,'PSY');
INSERT INTO enrolled VALUES(6,'HIS');
INSERT INTO enrolled VALUES(7,'PSY');
INSERT INTO enrolled VALUES(7,'HIS');

create table fees( 
   id int, 
   money_due int, 
   PRIMARY KEY(id), 
   FOREIGN KEY(id) REFERENCES student(id) 
);

INSERT INTO fees VALUES(1,10000);
INSERT INTO fees VALUES(2,20000);
INSERT INTO fees VALUES(3,40000);
INSERT INTO fees VALUES(4,4000);
INSERT INTO fees VALUES(5,100);
INSERT INTO fees VALUES(6,0);
INSERT INTO fees VALUES(7,3000);

create table security( 
    id int, 
    password varchar(20), 
    PRIMARY KEY(id), 
    FOREIGN KEY(id) REFERENCES student(id) 
);

INSERT INTO security VALUES(1,'abd234');
INSERT INTO security VALUES(2,'agd264');
INSERT INTO security VALUES(3,'abf2y4');
INSERT INTO security VALUES(4,'cbd2q4');
INSERT INTO security VALUES(5,'bbd2w4');
INSERT INTO security VALUES(6,'dbd2l4');
INSERT INTO security VALUES(7,'qbd294');

select *from security;

truncate table security
drop table security;


UPDATE student 
SET dob = '23-09-02' 
WHERE id=1;

UPDATE student 
SET dob = '09-01-03' 
WHERE id=2;

UPDATE student 
SET dob = '13-02-02' 
WHERE id=3;

UPDATE student 
SET dob = '12-12-01' 
WHERE id=4;

UPDATE student 
SET dob = '25-10-02' 
WHERE id=5;

UPDATE student 
SET dob = '11-04-01' 
WHERE id=6;

UPDATE student 
SET dob = '26-11-02' 
WHERE id=7;


SELECT  
*FROM fees 
INNER JOIN student ON fees.id=student.id;

SELECT  
*FROM fees 
NATURAL JOIN student;

SELECT  
*FROM fees 
LEFT OUTER JOIN student ON fees.id=student.id;

SELECT  
*FROM fees 
RIGHT OUTER JOIN student ON fees.id=student.id;

SELECT 
*FROM enrolled 
FULL OUTER JOIN fees ON(enrolled.id=fees.id);

SELECT sub_id, MAX(marks) from marks GROUP BY sub_id;

SELECT MIN(marks) from;

SELECT id,AVG(marks) from marks GROUP BY id;

SELECT SUM(money_due) from fees;

SELECT sub_id, COUNT(id) from enrolled GROUP BY sub_id;

SELECT dept_id, COUNT(id) from student GROUP BY dept_id;

SELECT COUNT(DISTINCT Tid) from teacher;


create table security( 
    id int, 
    password varchar(20), 
    PRIMARY KEY(id), 
    FOREIGN KEY(id) REFERENCES student(id) 
);

INSERT INTO security VALUES(1,'sdfr2');
INSERT INTO security VALUES(2,'ert3');
INSERT INTO security VALUES(3,'#rtfd');

create table security2( 
    id int, 
    password varchar(20), 
    PRIMARY KEY(id), 
    FOREIGN KEY(id) REFERENCES student(id) 
);

create table fees2( 
    id int, 
    money_due int, 
    PRIMARY KEY(id), 
    FOREIGN KEY(id) REFERENCES student(id) 
);

create table marks2( 
    id int, 
    sub_id varchar(6), 
    marks int, 
    PRIMARY KEY(id,sub_id), 
    FOREIGN KEY(id) REFERENCES student(id), 
    FOREIGN KEY(sub_id) REFERENCES subject(sub_id) 
);

create or replace trigger security2 
before insert on security 
for each row  
begin  
insert into security2 values(:new.id,:new.password);  
end; 
 
INSERT INTO security VALUES(4,'#er45'); 
select *from security2; 
select *from security; 
 
create or replace trigger fees2 
before delete on fees 
for each row  
begin  
insert into fees2 values(:old.id,:old.money_due);  
end; 
 
create or replace trigger marks2 
after update on marks 
for each row  
begin  
insert into marks2 values(:old.id,:old.sub_id,:old.marks);  
end;
/

