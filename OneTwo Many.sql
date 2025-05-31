CREATE DATABASE BookAutherDB;
Use BookAutherDB;

CREATE TABLE Authers(
	auther_id INT PRIMARY KEY,
    name VARCHAR(255),
    country VARCHAR(55)
    
);

CREATE TABLE Books(
	Book_id INT PRIMARY KEY,
    title VARCHAR(55),
    genre VARCHAR(55),
    auther_id INT ,
    foreign key (auther_id) references Authers (auther_id)

);

INSERT INTO Authers(auther_id,name,country) VALUES
(1, 'J.K. Rowling', 'UK'),
(2, 'George Orwell', 'UK'),
(3, 'Mark Twain', 'USA'),
(4, 'Haruki Murakami', 'Japan');


INSERT INTO Books(Book_id, title, genre, auther_id) VALUES
(101, 'Harry Potter and the Sorcerer’s Stone', 'Fantasy', 1),
(102, 'Harry Potter and the Chamber of Secrets', 'Fantasy', 1),
(103, '1984', 'Dystopian', 2),
(104, 'Animal Farm', 'Satire', 2),
(105, 'Adventures of Huckleberry Finn', 'Fiction', 3),
(106, 'Norwegian Wood', 'Romance', 4),
(107, 'Kafka on the Shore', 'Magical Realism', 4),
(108, 'The Wind-Up Bird Chronicle', 'Fiction', 4);

SELECT * from Books;
SELECT * from Authers;

 -- 1. How many books has each author written?
SELECT a.name , COUNT(b.book_id) As book_count
FROM Authers a 
JOIN Books b ON a.auther_id = b.auther_id
GROUP BY a.name;

-- 2. List the titles of books written by Haruki Murakami.

SELECT b.title
FROM Books b
JOIN Authers a ON b.auther_id = a.auther_id
WHERE a.name = "Haruki Murakami" ;

-- 3. Which authors have written more than one book?	
SELECT a.name
FROM Authers a
JOIN Books b ON a.auther_id = b.auther_id
GROUP BY a.name
Having COUNT(b.book_id) > 1;


-- 4. List all authors and the genres they have written.	
SELECT a.name,b.genre
FROM Authers a
JOIN Books b ON a.auther_id = b.auther_id
ORDER BY a.name;
	
 -- 5. How many different genres has each author written in?
 SELECT a.name, COUNT(DISTINCT b.genre) AS genre_count 
 FROM Authers a
 JOIN Books b ON a.auther_id = b.auther_id
 GROUP BY a.name;
 
-- 6. Which author has written the most books?
SELECT a.name, COUNT(b.book_id) AS book_count
FROM Authers a
JOIN Books b ON a.auther_id = b.auther_id
GROUP BY a.name
ORDER BY book_count DESC
LIMIT 1;


-- 7. List all books along with their author’s name and country.

SELECT b.title, a.name AS  auther, a.country
FROM Books b
JOIN Authers a ON b.auther_id = a.auther_id;

 -- 8. Which authors have written books in the genre ‘Fiction’?
 
 SELECT DISTINCT a.name
 FROM Authers a
 JOIN Books b ON a.auther_id= b.auther_id
 WHERE b.genre = 'Fiction';
 

