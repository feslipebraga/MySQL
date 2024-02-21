create database trigger_demo;
use trigger_demo;

CREATE TABLE users(
    username VARCHAR(100),
    age INT
);

-- TRIGGER
DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;

-- Testing
INSERT INTO users VALUES ("booby", 23);

INSERT INTO users VALUES ("juan", 13); -- ERROR
