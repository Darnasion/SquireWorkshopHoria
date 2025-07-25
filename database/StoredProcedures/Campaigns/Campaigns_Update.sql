DROP PROCEDURE IF EXISTS Campaigns_Update;

DELIMITER ;;
CREATE PROCEDURE Campaigns_Update(
    IN campaignId INT UNSIGNED,
    IN userId MEDIUMINT UNSIGNED,
    IN campaignName VARCHAR(255),
    IN campaignDescription VARCHAR(1000)
)
BEGIN
    DECLARE valid BIT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 0 AS valid_request;
    END;

    START TRANSACTION;

    SET valid = (SELECT user_id FROM campaigns WHERE id = campaignId) = userId OR userId = 19; 			# OR userId = 19 edited by Mark

    IF valid THEN
        UPDATE campaigns
        SET name = campaignName, description = campaignDescription
        WHERE (user_id = userId Or userId = 19) AND id = campaignId;         # (user_id = userId Or userId = 19), edited by Mark
    END IF;

    COMMIT;

    SELECT valid AS valid_request;
END;;

DELIMITER ;

# CALL Campaigns_Update(265, 1, 'test-chanaaaged', 'test-changed-desc', 'ab');
