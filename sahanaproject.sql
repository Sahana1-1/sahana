
create table Publishers (Publisher_Id int,Publisher_Name varchar(30) NOT NULL,PRIMARY KEY(Publisher_Id));
create table Categories (Category_Id int,Category_Name varchar(30) NOT NULL UNIQUE,PRIMARY KEY(Category_Id));

insert into publishers values(101,'sahana'),(102,'sahitya');
insert into Publishers values(103,'sanu'),(104,'shivam'),(105,'suhas');
insert into Categories values(201,'ravi'),(203,'sonu');
insert into Categories values(202,'janu'),(204,'satya'),(205,'soniya');

CREATE TABLE Books (
    Book_Id INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    Publication_year INT NOT NULL,
    Publisher_Id INT,
    Category_Id INT,
    Author_Name VARCHAR(255),
    CONSTRAINT fk_publisher
        FOREIGN KEY (Publisher_Id) REFERENCES Publishers(Publisher_Id)
        ON DELETE CASCADE,
    CONSTRAINT fk_category
        FOREIGN KEY (Category_Id) REFERENCES Categories(Category_Id)
        ON DELETE CASCADE,
    CONSTRAINT chk_author_name
        CHECK (Author_Name IS NOT NULL)
);

insert into Books values(1,'story',200,2020,101,201,'sowmya');
insert into Books values(2,'poems',199,2021,102,202,'karthik'),(3,'mythological',198,2020,103,203,'janvi'),
(4,'history',197,2019,104,204,'sowmya'),(5,'ramayana',196,2018,105,205,'suhas');

create table Users (User_Id int PRIMARY KEY,User_Name varchar(20) NOT NULL,Email varchar(60) UNIQUE NOT NULL,Phone_number int UNIQUE NOT NULL);

create table Borrowings (Borrow_Id int PRIMARY KEY,User_Id int,CONSTRAINT fk_user FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE CASCADE, 
Book_Id int,CONSTRAINT fk_book FOREIGN KEY (Book_Id) REFERENCES Books(Book_Id) ON DELETE CASCADE,Borrow_Date date NOT NULL,Return_Date date NOT NULL);

insert into Users values(23,'rohith','rohith@gmail.com',345567),(24,'hari','hari@gmail.com',5677888);
insert into Users values(25,'rahul','rahul@gmail.com',789900),(26,'sahitya','sahitya@gmail.com',354356465),(27,'ram','ram@gmail.com',353323);

insert into Borrowings values(12,23,1,'2022-02-09','2023-05-6');
insert into Borrowings values(14,25,3,'2018-03-08','2019-04-09'),
(13,24,2,'2023-03-06','2024-04-07'),(15,26,4,'2015-02-01','2016-03-02'),(16,27,5,'2013-05-02','2014-06-03');

select * from Users;
select * from Borrowings;
select * from Books;
select * from Publishers;
select * from Categories;






