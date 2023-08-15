-- UNIQUE (não pode 2 registros ter o mesmo valor na coluna)
CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

-- This insert would result in an error:
INSERT INTO
    contacts (name, phone)
VALUES
    ('billybob', '8781213455'),
    ('billybob', '8781213455');

-- CHECK 
CREATE TABLE users (
    username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

-- NAMED CONSTRAINTS
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);

-- Multiple Column Constraints
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name, address)
);

-- ALTER TABLE: Adding Columns
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

-- ALTER TABLE: Dropping Columns
ALTER TABLE companies DROP COLUMN phone;

--ALTER TABLE: Renaming
RENAME TABLE companies to suppliers;

ALTER TABLE companies
RENAME COLUMN name TO company_name;

-- ALTER TABLE: Modifying Columns
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';     -- modify: muda somente o tipo de dado.

ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);       -- change: muda o nome da coluna e o tipo de dado.

--  ALTER TABLE: Constraints
ALTER TABLE users 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

ALTER TABLE houses DROP CONSTRAINT positive_pprice;