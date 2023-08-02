CREATE TABLE employees (
    ID int AUTO_INCREMENT PRIMARY KEY,
    lastName varchar(100) not null,
    firstName varchar(100) not null,
    middleName varchar(100),
    age int not null,
    currentStatus varchar(100) not null DEFAULT 'employed'
);