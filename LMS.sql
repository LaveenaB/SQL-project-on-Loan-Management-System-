create database LMS;
use LMS;

create table Authors 
 (author_id INT primary KEY,
 author_name varchar(30) NOT NULL);

create table Authors 
 (author_id INT primary KEY,
 author_name varchar(30) NOT NULL);

create table Books(
 book_id int Primary key,
 title varchar(30) not null,
 isbn varchar(30) not null,
 author_id int,
 published_year int,
 available_copies int,
 foreign key (author_id) REFERENCES Authors(author_id));

create table Members(
 member_id int primary Key,
 member_name varchar(30) not null,
 contact_number varchar(40));
 
 create table Loans (
 loan_id INT Primary key,
 book_id INT,
 member_id INT,
 loan_date DATE not null,
 return_date DATE,
 foreign key (book_id) REFERENCES Books(book_id),
 foreign key (member_id) references Members(member_id));
 
 #// Data Loading//#
 
 insert into Authors Values 
 (1, 'John Doe'),
 (2, 'Jane Smith');

insert into Books values
 (1, 'Book1', '123456789', 1, 2020, 5),
 (2, 'Book2', '234567890', 2, 2019, 4);
 
insert into Members values
(1, 'Rohit Chawla', 9839292349),
(2, 'Nikhil Raj', 8939220232); 

insert into Loans values
(1, 1, 2, '2019-02-25', '2019-03-10'),
(2, 1, 1, '2021-07-18', '2021-09-19'),
(3, 2, 1, '2022-03-10', '2022-05-15');
 
 
select * from authors;
select * from books;
select * from Members;
select * from Loans;
 
#// Data analysis//#

#/ define the data or describing the data/#

desc authors;
desc books;
describe Members;
desc Loans;

#/ count rows in a table/#

select count(loan_id) from Loans;

#/ Basic statistics using aggregate functions/#

select min(loan_id), max(loan_id), avg(member_id), std(loan_id) from Loans;

#/ getting disctinct values from table/#

select distinct book_id from loans;

#/ identify missing values/#

select count(*) from books
where published_year is NULL;

#/ data analysis: Borrowing a book and updating its copies/#

insert into loans values
(4, 2, 2, '2023-06-24', NULL);

update Books 
set available_copies = available_copies-1
where book_id = 2;

select * from books;


#/ Returning a book/#

UPDATE loans
set return_date = '2023-07-10'
where loan_id = 4;

update books
set available_copies = available_copies+1
where book_id = 2;

select datediff(return_date, loan_date) as loan_duration from loans
where loan_id =3;


select * from loans;
