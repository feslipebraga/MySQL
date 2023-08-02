-- specify columns 

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

-- add values to all columns in a sequence  

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

-- To view all rows in our table:

SELECT * FROM table_name;

-- NOT NULL

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int);

-- CREAT A NOT NULL CONSTRAINT WHEN THE COLUMN IS ALREADY CREATED

ALTER TABLE Persons
MODIFY COLUMN Age int NOT NULL;

-- Adding DEFAULT Values

CREATE TABLE cats (    
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99);

-- Introducing Primary Keys

CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL);

-- Working With AUTO_INCREMENT

CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id));

