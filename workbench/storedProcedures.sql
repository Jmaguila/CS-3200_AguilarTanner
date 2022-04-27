USE FINAL;

-- STORED PROCEDURE DEFINITION
DELIMITER //
CREATE PROCEDURE addPlayer(
	IN  id  INT,	username VARCHAR(64),    mmr INT,    wins INT,    losses INT,    mph INT
)
BEGIN

	INSERT IGNORE INTO player VALUES 
	(id,username, Null);
	INSERT IGNORE INTO player_stats VALUES
	(id, mmr, wins, losses, mph);
        
END;
DELIMITER --

-- STORED PROCEDURE DEFINITION
DELIMITER //
CREATE PROCEDURE createTeam(
	IN  t_name VARCHAR(64), c_name VARCHAR(64)
)
BEGIN
	
    DECLARE c_mmr INT;
    DECLARE c_id INT;
    
    SELECT player_id FROM player WHERE username = c_name into c_id;
    SELECT mmr FROM player_stats WHERE player_id = c_id INTO c_mmr;
    
	-- First create new team into db (Captain ID)
	INSERT IGNORE INTO team VALUES 
	(t_name, c_id, c_mmr);
	
    -- Update Captain team information
	UPDATE player SET team_name = t_name
	WHERE player_id = c_id;
        
END;
DELIMITER --

CALL createTeam("Huskies", "Datu");

