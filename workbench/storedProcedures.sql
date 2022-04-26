USE FINAL;

-- STORED PROCEDURE DEFINITION
DELIMITER //
CREATE PROCEDURE addPlayer(
	IN  id  INT,	username VARCHAR(64),    mmr INT,    wins INT,    losses INT,    mph INT
)
BEGIN

	INSERT INTO player VALUES 
	(id,username);
	INSERT INTO player_stats VALUES
	(id, mmr, wins, losses, mph);
        
END;
