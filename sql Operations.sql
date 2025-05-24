show databases;
CREATE DATABASE student_management;
USE student_management;

CREATE TABLE student_profiles(
profile_id INT PRIMARY KEY,
student_id INT,
name VARCHAR(100),
city VARCHAR(100),
email VARCHAR(100),
gpa DECIMAL(3,1)
);

SELECT * FROM student_profiles;



show  tables;
UPDATE student_profiles
SET gpa = 4.0;
-- This will set GPA = 4.0 for EVERY student!




INSERT INTO student_profiles (profile_id , student_id,name, city, email,gpa) VALUES
(1, 1001, 'Alice', 'New York', 'alice@example.com', 3.8),
(2, 1002, 'Bob', 'Los Angeles', 'bob@example.com', 3.2),
(3, 1003, 'Charlie', 'New York', 'charlie@example.com', 3.6),
(4, 1004, 'Daisy', 'Chicago', 'daisy@example.com', 3.9),
(5, 1005, 'Eve', 'Boston', 'eve@example.com', 3.4),
(6, 1006, 'Frank', 'Chicago', 'frank@example.com', 2.9);


 -- Q1: Select all students who are from New York
SELECT * FROM student_profiles
WHERE city = 'New York';

 -- Q2: Get top 3 students with highest GPA
 SELECT * FROM student_profiles
ORDER BY gpa DESC
LIMIT 3;

 -- Q3: Count how many students are from each city
 
 SELECT city, COUNT(*) AS student_count
FROM student_profiles
GROUP BY city;

 -- Q4: Get student names along with their GPA
 
 SELECT name, gpa
FROM student_profiles;

 -- Q5: Get all students and their emails-- 
 
 SELECT name, email
FROM student_profiles;

 -- Q6: Find students with GPA greater than 3.5
SELECT * FROM student_profiles
WHERE gpa > 3.5;

 -- Q7: Find average GPA of students from each city
 SELECT city, AVG(gpa) AS average_gpa
FROM student_profiles
GROUP BY city;




 

 

 
