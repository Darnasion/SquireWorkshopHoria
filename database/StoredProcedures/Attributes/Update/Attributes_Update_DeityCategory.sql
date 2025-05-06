DROP PROCEDURE IF EXISTS Attributes_Update_DeityCategory;

DELIMITER ;;
CREATE PROCEDURE Attributes_Update_DeityCategory(
    IN attributeId INT UNSIGNED,
    IN userId MEDIUMINT UNSIGNED,
    IN attributeName VARCHAR(45),
    IN attributeDescription VARCHAR(1000)
)
BEGIN
    DECLARE valid BIT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 0 AS valid_request;
    END;

    START TRANSACTION;

    SET valid = (SELECT user_id FROM attributes WHERE id = attributeId) = userId OR userId = 19; 			# OR userId = 19 edited by Mark

    IF valid THEN
        UPDATE attributes
        SET name = attributeName, description = attributeDescription, version = version + 1
        WHERE (user_id = userId Or userId = 19) AND id = attributeId;         # (user_id = userId Or userId = 19), edited by Mark
    END IF;

    COMMIT;

    SELECT valid AS valid_request;
END;;

DELIMITER ;

# CALL Attributes_Update_DeityCategory(1, 1, 'test-changed', 'test-changed-desc', 'ab');
