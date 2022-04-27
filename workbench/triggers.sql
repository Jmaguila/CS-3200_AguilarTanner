use FINAL;

Delimiter //
Create Function averagemmr(teamName varchar(64))
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE result int;
   select avg(mmr) into result from player as p join player_stats as ps on p.player_id = ps.player_id where team_name = teamName group by team_name;
   RETURN result;
   END; //
Delimiter ;

Delimiter //
CREATE TRIGGER teamAvgMmr_after_player_update
AFTER Update ON player
FOR EACH ROW 
BEGIN
Declare newmmr int;
select averagemmr(OLD.team_name) into newmmr;
update team set avg_mmr = newmmr where team_name = OLD.team_name;
select averagemmr(NEW.team_name) into newmmr;
update team set avg_mmr = newmmr where team_name = NEW.team_name;
END; //
Delimiter ;

Delimiter //
CREATE TRIGGER teamAvgMmr_after_player_delete
AFTER Delete ON player
FOR EACH ROW 
BEGIN
Declare newmmr int;
select averagemmr(OLD.team_name) into newmmr;
update team set avg_mmr = newmmr where team_name = OLD.team_name;

END; //
Delimiter ;

Delimiter //
CREATE TRIGGER update_team
AFTER UPDATE ON team
FOR EACH ROW 
BEGIN

	DELETE FROM team WHERE team_name = NEW.team_name AND NEW.avg_mmr = NULL;

END; //
Delimiter ;

DROP TRIGGER update_team;
