-- Prevenindo que usuários sigam a si próprios.

DELIMITER $$

CREATE TRIGGER preventSelfFollows
BEFORE INSERT ON follows FOR EACH ROW
    BEGIN
        IF NEW.followerId = NEW.followedId
            THEN
                SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = "Can't follow yourself";
        END IF;
    END;
$$

DELIMITER ;

-- Registrando os Unfollows

DELIMITER $$

CREATE TRIGGER unfollowsLog
AFTER DELETE ON follows FOR EACH ROW
    BEGIN
        INSERT INTO unfollows
        SET followerId = OLD.followerId,
            followedId = OLD.followedId;
    END;
$$

DELIMITER ;