CREATE DATABASE Project_Library_Management;

USE Project_Library_Management;


-- 1
CREATE TABLE book_Categories(
category_id VARCHAR(20) PRIMARY KEY,
category_Name VARCHAR(20) NOT NULL
);

-- 2
CREATE TABLE department(
dept_id VARCHAR(10) PRIMARY KEY,
dept_Name VARCHAR(20),
dept_Head VARCHAR(20),
block_No VARCHAR(10)
);
DESC department;

INSERT INTO department(dept_id,dept_Name,dept_Head,block_No)
		VALUES('D1','CIVIL','Mahadev','1A'),
			  ('D2','CSE','Vishnu','2B'),
			  ('D3','EEE','Laxmi','3C'),
              ('D4','MECHANICAL','Jagannath','4D'),
              ('D5','ECE','Krishna','5E');

-- 3
CREATE TABLE student(
student_id VARCHAR(10) PRIMARY KEY,
student_Name VARCHAR(30) NOT NULL,
student_Email VARCHAR(40),
student_Number BIGINT UNIQUE,
dept_id VARCHAR(10),
CONSTRAINT FK_dept_id_student FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE CASCADE ON UPDATE CASCADE
);
DESC student;

INSERT INTO student(student_id,student_Name,student_Email,student_Number,dept_id)
		VALUES('S1','Venkat','venkatvarma@gmaiil.com',7989810101,'D1'),
			  ('S2','Phanindra','phanindras@gmail.com',9894121354,'D2'),
              ('S3','Shravani','shravanisagar@gmail.com',7989116423,'D5'),
              ('S4','Trisha','trishac@gmail.com',6543546746,'D3'),
              ('S5','Eswar','eswaraditya@gmail.com',8541135674,'D4'),
			  ('S6','Viswa','viswasai@gmail.com',9536819174,'D4'),
              ('S7','Krishna','krishnar@gmail.com',7989890004,'D5'),
			  ('S8','Ganapathi','ganapathi@gmail.com',7989890005,'D5');
              
INSERT INTO student(student_id,student_Name,student_Email,dept_id)
		VALUES('S9','Shiva','shivap@gmail.com','D1'),
			  ('S10','Vishnu','vishnul@gmail.com','D1'),
			  ('S11','Bramha','bramha@gmail.com','D1');

INSERT INTO book_Categories (category_id,category_Name)
		VALUES('C1','Ancient Story'),
		      ('C2','Novel'),
              ('C3','Fantasy Fiction');

-- 4
CREATE TABLE books(
book_id VARCHAR(10),
book_Name VARCHAR(200) PRIMARY KEY,
category_id VARCHAR(20),
student_id VARCHAR(10),
shelf_No VARCHAR(5),
book_Status VARCHAR(20) NOT NULL,
book_Edition VARCHAR(5),
actual_Copies INT(10),
current_Copies INT(10),
CONSTRAINT FK_category_id_books FOREIGN KEY (category_id) REFERENCES book_categories(category_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_student_id_books FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserting Data 

INSERT INTO books (book_id,book_Name,category_id,student_id,shelf_No,book_Status,book_Edition,actual_Copies,current_Copies)
		VALUES('B1',"Inside Chanakya's Mind",'C1','S1',1,'Available','NA',4,2), 
			  ('B2','Half Girlfriend','C2','S2',2,'Available','NA',4,1),  
			  ('B3',"Gulliver's Travels",'C3','S3',3,'Not Available','NA',1,0), 
              ('B4',"Harry Potter and the Philosopher's Stone",'C3','S4',4,'Available','Part1',4,3), 
			  ('B5',"Harry Potter and the Chamber of Secrets",'C3','S5',5,'Available','Part2',4,4),
			  ('B6',"Harry Potter and the Prisoner of Azkaban",'C3','S6',6,'Available','Part3',4,4),
			  ('B7',"Harry Potter and the Goblet of Fire",'C3','S7',7,'Available','Part4',4,4),
              ('B8',"Harry Potter and the Order of the Phoenix",'C3','S8',8,'Available','Part5',4,3),
              ('B9',"Harry Potter and the Half-Blood Prince",'C3','S9',9,'Available','Part6',2,2),
              ('B10',"Harry Potter and the Deathly Hallows",'C3','S10',10,'Not Available','Part7',1,0),
              ('B11',"Harry Potter and the Cursed Child",'C3','S11',11,'Available','Part7',4,3);


-- 5
CREATE TABLE publications(
publication_id VARCHAR(10) PRIMARY KEY,
publication_Name VARCHAR(40),
publication_Year YEAR,
publication_Contact INT(20)
);
DESC publications;

INSERT INTO publications (publication_id,publication_Name,publication_Year,publication_Contact)
		VALUES('P1','Penguin Random House India','2017',116666),
              ('P2','Rupa & Co.','2014',226666),
			  ('P3','Bloomsbury','1997',336666);
-- year takes values range from 1901- 2155
INSERT INTO publications (publication_id,publication_Name,publication_Year)
		VALUES('P4','Benjamin Motte','1926'); -- 1726

-- 6
CREATE TABLE author(
author_id varchar(10) PRIMARY KEY,
author_Name VARCHAR(30) NOT NULL,
author_Email VARCHAR(40),
book_Name VARCHAR(200),
publication_id VARCHAR(10),
CONSTRAINT FK_book_Name_author FOREIGN KEY (book_Name) REFERENCES books(book_Name) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_publication_id_author FOREIGN KEY (publication_id) REFERENCES publications(publication_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DESC author;


INSERT INTO author (author_id,author_Name,author_Email,book_Name,publication_id)
		VALUES('A1',"Dr.Radhakrishnan Pillai",'info@chanakya-aanvikshiki.com',"Inside Chanakya's Mind",'P1'),
              ('A2',"Chetan Bhagat",'chetan.bhagat@gmail.com','Half Girlfriend','P2'),
              ('A3',"Jonathan Swift",'NA',"Gulliver's Travels",'P3'),
              ('A4',"J.K.Rowling",'info@jkrowling.com',"Harry Potter and the Philosopher's Stone",'P4'),
			  ('A5',"J.K.Rowling",'info@jkrowling.com',"Harry Potter and the Chamber of Secrets",'P4'),
			  ('A6',"J.K.Rowling",'info@jkrowling.com',"Harry Potter and the Prisoner of Azkaban",'P4'),
              ('A7',"J.K.Rowling",'info@jkrowling.com',"Harry Potter and the Goblet of Fire",'P4'),
              ('A8',"J.K.Rowling",'info@jkrowling.com',"Harry Potter and the Order of the Phoenix",'P4'),
              ('A9',"J.K.Rowling",'info@jkrowling.com',"Harry Potter and the Half-Blood Prince",'P4'),
              ('A10',"J.K.Rowling",'info@jkrowling.com',"Harry Potter and the Deathly Hallows",'P4'),
              ('A11',"J.K.Rowling",'info@jkrowling.com',"Harry Potter and the Cursed Child",'P4');


        

-- 7
CREATE TABLE publication_Address(
publication_id VARCHAR(10),
p_City VARCHAR(20),
p_State VARCHAR(20),
p_Country VARCHAR(20),
p_Zipcode VARCHAR(20),
CONSTRAINT FK_publication_id_address FOREIGN KEY (publication_id) REFERENCES publications(publication_id) ON DELETE CASCADE ON UPDATE CASCADE
);
DESC publication_Address;

INSERT INTO publication_address(publication_id,p_City,p_State,p_Country,p_Zipcode)
		VALUES('P1','Gurugram','Haryana','India',122002),
			  ('P2','Darya Ganj','New Delhi','India',110002),
              ('P3','Bedford Avenue','London','England','WC1B-3DP'),
              ('P4','NA','London','England','NA');


-- 8
CREATE TABLE staff(
staff_id VARCHAR(10) PRIMARY KEY,
staff_Name VARCHAR(30) NOT NULL,
shift_type VARCHAR(20)
);
DESC staff;

INSERT INTO staff(staff_id,staff_Name,shift_type)
		VALUES('ST1','Atri','Morning'),
			  ('ST2','Bharadvaja','Morning'),
              ('ST3','Gautama','Morning'),
			  ('ST4','Jamadagni','Afternoon'),
			  ('ST5','Kashyapa','Afternoon'),
			  ('ST6','Vashista','Evening'),
              ('ST7','Vishwamitra','Evening');

-- 9
CREATE TABLE register(
reg_id VARCHAR(10) PRIMARY KEY,
login_time TIME,
logout_time TIME,
book_Name VARCHAR(200),
student_id VARCHAR(10),
issued_date DATE,
estimated_return_date DATE,
actual_return_date DATE,
issued_by VARCHAR(10),
prebook_id VARCHAR(10),
CONSTRAINT FK_book_Name_student FOREIGN KEY (book_Name) REFERENCES books(book_Name) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_student_id_register FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_issued_by_student FOREIGN KEY (issued_by) REFERENCES staff(staff_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DESC register;

INSERT INTO register(reg_id,student_id,login_time,logout_time,book_Name,issued_date,estimated_return_date,actual_return_date,issued_by)
		VALUES('R1','S1','09:00:00','09:30:00',"Inside Chanakya's Mind",'2023-04-09','2023-04-23','2023-04-18','ST1'),
			  ('R2','S2','10:00:00','12:00:00','Half Girlfriend','2023-04-10','2023-04-24','2023-04-20','ST2'),
              ('R3','S3','14:00:00','17:00:00',"Gulliver's Travels",'2023-04-19','2023-05-03','2023-05-02','ST3'),
              ('R4','S4','11:00:00','13:00:00',"Harry Potter and the Philosopher's Stone",'2023-04-09','2023-04-23','2023-04-24','ST4'),
              ('R5','S5','14:00:00','14:10:00',"Harry Potter and the Deathly Hallows",'2023-04-09','2023-04-23','2023-04-18','ST5'),
              ('R6','S3','10:00:00','12:10:00','Half Girlfriend','2023-05-03','2023-05-17','2023-05-16','ST6'),
			  ('R7','S6','13:00:00','15:10:00',"Harry Potter and the Cursed Child",'2023-05-03','2023-05-17','2023-05-21','ST7');        
			  
INSERT INTO register(reg_id,student_id,login_time,logout_time,book_Name,issued_date,estimated_return_date,issued_by,prebook_id)
		VALUES('R8','S3','10:00:00','12:00:00',"Inside Chanakya's Mind",'2023-04-23','2023-05-07','ST1','PB1'),
			  ('R9','S1','09:00:00','11:00:00','Half Girlfriend','2023-05-26','2023-06-09','ST7','PB2'),
              ('R10','S8','12:00:00','12:30:00',"Harry Potter and the Order of the Phoenix",'2023-04-09','2023-04-23','ST2','PB3');


-- 10
CREATE TABLE transaction(
transaction_id VARCHAR(10) PRIMARY KEY,
transaction_date DATE,
penalty_per_day INT,
total_due_days INT,
penalty_if_not_returned INT,
reg_id VARCHAR(10),
CONSTRAINT FK_reg_id_transaction FOREIGN KEY (reg_id) REFERENCES register(reg_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DESC transaction;



INSERT INTO transaction(transaction_id,transaction_date,penalty_per_day,total_due_days,reg_id)
		VALUES('T1','2023-04-24',10,1,'R4'),
			  ('T2','2023-05-24',10,4,'R7');
              
INSERT INTO transaction(transaction_id,transaction_date,penalty_if_not_returned,reg_id)
		VALUES('T3','2023-06-02',500,'R8'),
              ('T4','2023-06-21',500,'R9'),
              ('T5','2023-05-21',500,'R10');
              
SELECT * FROM books;
SELECT *  FROM book_categories;
SELECT *  FROM author;
SELECT *  FROM publications;
SELECT *  FROM publication_address;
SELECT *  FROM department;
SELECT *  FROM student;
SELECT *  FROM staff;
SELECT *  FROM register;
SELECT * FROM transaction;

-- Queries :

-- 1. Total No of books in Library ?
	
    SELECT COUNT(book_id) AS Total_Books_In_Library FROM books;
    
-- 2. Write a query to fetch the Books written by J.K.Rowling and also published by Penguin Random House India?

    SELECT a.author_Name,a.book_Name,p.publication_Name FROM author AS a
    INNER JOIN publications AS p 
    ON a.publication_id = p.publication_id
    WHERE author_Name = 'J.K.Rowling' OR publication_Name = 'Penguin Random House India';

-- 3. Get student details who have taken more than or equal to 3 books?
	
    SELECT s.Student_Name,d.Dept_Name FROM register AS R 
    INNER JOIN student AS s 
    ON r.student_id = s.student_id
    INNER JOIN department AS d
    ON s.dept_id = d.dept_id
    GROUP BY r.student_id
    HAVING COUNT(r.student_id) >= 3;
    
-- 4. Write a Query to display student Name who haven't taken a single books from library ?
   
   SELECT s.student_Name FROM student AS S
   WHERE s.student_id NOT IN (SELECT r.student_id FROM register AS r);

-- 5. Student want a book that is currently not available he wants to know when that book will be available ?


	SELECT b.book_Name,b.book_Status,r.estimated_return_date AS Book_will_be_Available_on FROM books as b 
    INNER JOIN register as r 
    ON b.book_Name = r.book_Name
    WHERE b.book_Name = "Gulliver's Travels";
    
    SELECT b.book_Name,b.book_Status,r.estimated_return_date AS Book_will_be_Available_on FROM books as b 
    INNER JOIN register as r 
    ON b.book_Name = r.book_Name
    WHERE b.book_Status = 'Not Available';

-- Write a Query to Fetch the prebook id and the student who prebooked  ?
	
    SELECT s.student_Name,r.prebook_id FROM student AS s 
    LEFT JOIN register AS r 
    ON s.student_id = r.student_id
    WHERE r.prebook_id IS NOT NULL;

-- 6. Where exactly a particular book is placed and how many copies are available ?
	
	SELECT book_Name,shelf_No,book_status,current_copies FROM books;

-- 7. Identify the students who haven't returned the books in time and calculate the total amount they have to pay ?
    
    SELECT * FROM student;
    SELECT * FROM register;
    SELECT * FROM transaction;
    
    SELECT s.student_Name,t.penalty_if_not_returned AS Penalty FROM student AS s 
    INNER JOIN register AS r
    ON s.student_id = r.student_id
    INNER JOIN transaction AS t 
    ON r.reg_id = t.reg_id
    WHERE r.actual_return_date IS NULL AND t.penalty_if_not_returned IS NOT NULL;

-- 8. Identify the students who returned the books after the estimated date and calculate penalty ?
	
    SELECT s.student_Name,(t.penalty_per_day * t.total_due_days) AS Total_Penalty FROM student AS s 
    INNER JOIN register AS r
    ON s.student_id = r.student_id
    INNER JOIN transaction AS t
    ON r.reg_id = t.reg_id
    WHERE (t.penalty_per_day * t.total_due_days) IS NOT NULL 
    ORDER BY (t.penalty_per_day * t.total_due_days) DESC LIMIT 1;


-- 9. When did a student logged in and logged out and what are the books he have taken and who issued the books? 
	
	SELECT s.student_Name,r.login_time,r.logout_time,r.book_Name,st.staff_Name FROM student AS s
    INNER JOIN register AS r 
    ON s.student_id = r.student_id 
    INNER JOIN staff AS st 
    ON r.issued_by = st.staff_id;

-- 10. How many categories or generes of books are there in the library ? 
    
    SELECT bc.category_Name,COUNT(bc.category_id) AS Generes FROM book_categories AS bc
    INNER JOIN books AS b
    ON bc.category_id = b.category_id
    GROUP BY b.category_id;

-- 11. Do you have any Fiction Story Books if yes what are they ? 

	SELECT bc.category_Name,b.book_Name,b.book_Status FROM book_categories AS bc 
    INNER JOIN books AS b 
    ON bc.category_id = b.category_id 
    WHERE bc.category_Name = 'Fantasy Fiction';