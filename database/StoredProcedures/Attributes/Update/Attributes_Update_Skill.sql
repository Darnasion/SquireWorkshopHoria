DROP PROCEDURE IF EXISTS Attributes_Update_Skill;

DELIMITER ;;
CREATE PROCEDURE Attributes_Update_Skill(
    IN attributeId INT UNSIGNED,
    IN userId MEDIUMINT UNSIGNED,
    IN attributeName VARCHAR(45),
    IN attributeDescription VARCHAR(1000),
    IN abilityId INT UNSIGNED
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

        UPDATE skills
        SET ability_id = abilityId
        WHERE attribute_id = attributeId;
    END IF;

    COMMIT;

    SELECT valid AS valid_request;
END;;

DELIMITER ;

# CALL Attributes_Update_Skill(1, 1, 'test-changed', 'test-changed-desc', 'ab');
