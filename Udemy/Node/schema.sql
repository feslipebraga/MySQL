CREATE TABLE users(
    email VARCHAR(255) primary key,
    createdAt timestamp default now()
);

INSERT INTO users (email) VALUES
('Katie34@yahoo.com'),
('Tunder@gmail.com');
