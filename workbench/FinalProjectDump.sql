CREATE DATABASE  IF NOT EXISTS `final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `final`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: final
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abilities` (
  `hero_id` int NOT NULL,
  `skill1` varchar(64) DEFAULT NULL,
  `skill2` varchar(64) DEFAULT NULL,
  `skill3` varchar(64) DEFAULT NULL,
  `skill4` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`hero_id`),
  CONSTRAINT `abilities_ibfk_1` FOREIGN KEY (`hero_id`) REFERENCES `hero` (`hero_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
INSERT INTO `abilities` VALUES (1,'Mana Break','Blink','Counterspell','Mana Void'),(2,'Berzerker\'s Call','Battle Hunger','Counter Helix','Culling Blade'),(3,'Enfeeble','Brain Sap','Nightmare','Fiend\'s Grip'),(4,'Blood Rage','Blood Rite','Thirst','Rupture'),(5,'Crystal Nova','Frostbite','Arcane Aura','Freezing Field'),(6,'Frost Arrow','Gust','Multishot','Marksmanship'),(7,'Fissure','Enchant Totem','Aftershock','Echo Slam'),(8,'Blade Fury','Healing Ward','Blade Dance','Omnislash'),(9,'Starfall','Sacred Arrow','Leap','Moonlight'),(10,'Waveform','Adaptive Strike','Attribute Shift','Morph'),(11,'Shadow Raze','Necromastery','Presence','Requiem of Souls'),(12,'Phantom Strike','Doppleganger','Phantom Lance','Juxtapose'),(13,'Illusory Orb','Waning Rift','Phase Shift','Dream Coil'),(14,'Hook','Rot','Flesh Heap','Dismember'),(15,'Plasma Field','Static Link','Storm Surge','Eye of the Storm'),(16,'Borrow Strike','Sandstorm','Caustic Finaly','Epicenter'),(17,'Static Remanent','Electric Voltex','Overload','Ball Lighting'),(18,'Storm Hammer','Great Cleave','Warcry','God\'s Strength'),(19,'Avalance','Toss','Tree Grab','Grow'),(20,'Magic Missile','Wave of Terror','Vengance Aura','Nether Swap'),(21,'ShackleShot','Powershot','Windrun','Focus Fire'),(22,'Arc Lightning','Lightning Bolt','Heavenly Jump','Thundergod\'s Wrath'),(23,'Torrent','Tidebringer','X Mark','Ghost Ship'),(25,'Dragon Slave','Light Strike Array','Fiery Soul','Laguna Blade'),(26,'Earth Spike','Hex','Mana Drain','Finger of Death'),(27,'Ether Shock','Hex','Shackles','Serpant Wards'),(28,'Guardian Sprint','Slithereen Crush','Bash of the Deep','Corrosive Haze'),(29,'Gush','Kraken Shell','Anchor Smash','Ravage'),(30,'Cask','Maledict','Voodoo Restoration','Death Ward'),(31,'Frost Blast','Frost Shield','Sinister Gaze','Chain Frost'),(32,'Smoke Cloud','Blink Strike','Tricks of the Trade','Cloak and Dagger'),(33,'Malefice','Demonic Conversion','Midnight Pulse','Black Hole'),(34,'Laser','Missiles','Defense Matrix','Rearm'),(35,'Shrapnel','Headshot','Take Aim','Assassinate'),(36,'Death Pulse','Shroud','Heartstopper Aura','Reaper\'s Scyth'),(37,'Shadow Word','Fatal Bonds','Upheaval','Chaotic Offering'),(38,'Wild Axes','Call of the Wild','Inner Beast','Primal Roar'),(39,'Shadow Strike','Blink','Scream of Pain','Sonic Wave'),(40,'Venemous Gale','Poison Sting','Ward','Poison Nova'),(41,'Time Walk','Time Dialation','Time Lock','Chronosphere'),(42,'Wraithfire Blast','Vampiric Spirit','Mortal Strike','Reincarnation'),(43,'Crypt Swarm','Silence','Spirit Syphon','Exorcism'),(44,'Stifling Dagger','Blink Strike','Blur','Coup De Grace'),(45,'Nether Blast','Decrepify','Nether Ward','Life Drain'),(46,'Refraction','Meld','Psi Blades','Psionic Trap'),(47,'Poison Attack','Nethertoxin','Corrosive Skin','Viper Strike'),(48,'Lucent Beam','Moon Glaves','Lunar Blessing','Eclipse'),(49,'Breathe Fire','DragonTail','Dragon\'s Blood','Elder Dragon Form'),(50,'Poison Touch','Shallow Grave','Shadow Wave','Bad Juju'),(51,'Battery Assault','Rocket Flare','Power Cogs','Hookshot'),(52,'Earth Split','Diabolic Edict','Lightning Storm','Pulse Nova'),(53,'Sprout','Teleportation','Nature\'s Call','Wrath of Nature'),(54,'Rage','Lifesteal','Open Wounds','Infest'),(55,'Vaccum','Ion Shell','Surge','Wall'),(56,'Burning Barrage','Searing Arrows','Skeleton Walk','Death Pact'),(57,'Purification','Heavenly Grace','Degen Aura','Guardian Angel'),(58,'Impetus','Enchant','Nature\'s Attendants','Untouchable'),(59,'Inner Fire','Burning Spear','Berserker\'s Blood','Life Break'),(60,'Void','Crippling Fear','Hunter in the Night','Dark Ascension'),(61,'Silken Bola','Spin Web','Insatiable Hunger','Spawn Spiderlings'),(62,'Shuriken Toss','Kinada','Shadow Walk','Track'),(63,'Swarm','Shukushi','Geminate Attack','Time Lapse'),(64,'Dual Breath','Liquid Fire','Ice Path','Macropyre'),(65,'Napalm','Flamebreak','Firefly','Flaming Lasso'),(66,'Test of Faith','Penitence','Divine Favor','Hand of God'),(67,'Spectral Dagger','Desolate','Dispersion','Haunt'),(68,'Cold Feet','Ice Vortex','Chilling Touch','Ice Blast'),(69,'Devour','Infernal Blade','Scorched Earth','Doom'),(70,'Earthshock','Overpower','Fury Swipers','Enrage'),(71,'Charge of Darkness','Greater Bash','Bulldoze','Nether Strike'),(72,'Rocket Barrage','Homing Missile','Flak Cannon','Calldown'),(73,'Acid Spray','Unstable Concoction','Greevil\'s Greed','Chemical Rage'),(74,'Quas','Wex','Exort','Invoke'),(75,'Arcane Curse','Glaives of Wisdom','Last Word','Global Silence'),(77,'Summon Wolves','Howl','Feral Impulse','Shapeshift'),(78,'Thunder Clap','Cinder Brew','Drunken Brawler','Primal Beast'),(79,'Disruption','Soul Catcher','Shadow Poison','Demonic Purge'),(80,'Summon Bear','Spirit Link','Savage Roar','True Form'),(81,'Chaos Bolt','Reality Rift','Chaos Strike','Phantasm'),(82,'Earthbind','poof','Ransack','Divided We Stand'),(83,'Nature\'s Grasp','Living Armor','Leech Seed','Overgrowth'),(84,'Fireblast','Ignite','Bloodlust','Multicast'),(85,'Decay','Soul Rip','Tombstone','Flesh Golem'),(86,'Telekenisi','Fade Bolt','Arcane Supremacy','Spell Steal'),(87,'Thunder Strike','Glimpse','Kinetic Field','Static Storm'),(88,'Impale','Mana Burn','Carapice','Vendetta'),(89,'Mirror Image','Ensnare','Rip Tide','Song of the Siren'),(90,'Illuminate','Chakra Magic','Solar Bind','Spirit Form'),(91,'Tether','Spirits','Overcharge','Relocate'),(92,'Grave Chill','Soul Assumption','Gravekeeper\'s Cloak','Summon Familiars'),(93,'Dark Pact','Pounce','Essence Shift','Shadow Dance'),(94,'Split Shot','Mystic Snake','Mana Shield','Stone Gaze'),(95,'Berzserker\'s Rage','Whirling Axes','Fervor','Battle Trance'),(96,'Hoof Stomp','Double Edge','Return','Stampede'),(97,'Shockwave','Empower','Skewer','Reverse Polarity'),(98,'Whirling Death','Timber Chain','Reactive Armor','Chakram'),(99,'Goo','Quill Spray','Bristleback','Warpath'),(100,'Ice Shard','Snowball','Tag Team','Walrus Punch'),(101,'Arcane Bolt','Concussive Shot','Ancient Seal','Mystic Flare'),(102,'Mist Coil','Aphotic Shield','Curse of Avernus','Borrowed Time'),(103,'Echo Stomp','Astral Spirit','Natural Order','Earth Splitter'),(104,'Overwhelming Odds','Press the Attack','Moment of Courage','Duel'),(105,'Proximity Mines','Stasis Trap','Blast Off!','Remote Mines'),(106,'Searing Chains','Sleight of Fist','Flame Guard','Fire Remanent'),(107,'Boulder Smash','Rolling Boulder','Geomagnetic Grip','Magnetize'),(108,'Firestorm','Pit of Malice','Atrophy Aura','Dark Rift'),(109,'Reflection','Conjure Image','Metamorphosis','Sunder'),(110,'Icarus Dive','Firespirits','Sunray','Supernova'),(111,'Fortune\'s End','Fate\'s Edict','Purifying Flames','False Promise'),(112,'Arctic Burn','Cold Embrace','Splinter Blast','Winter\'s Curse'),(113,'Flux','Magnetic Field','Spark Wraith','Tempest Double'),(114,'Boundless Strike','Tree Dance','Jingu Mastery','Wukong\'s Command'),(119,'Bramble Maze','Shadow Realm','Cursed Crown','Bedlam'),(120,'Swashbuckle','Shield Crash','Lucky Shot','Rolling Thunder'),(121,'Stroke of Fate','Phantom\'s Embrace','Ink Swell','Soulbind');
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('admin','admin'),('jaguilars','DBsarefun'),('senya','ILOVEDOTA2');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero`
--

DROP TABLE IF EXISTS `hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hero` (
  `hero_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `attack_type` varchar(64) DEFAULT NULL,
  `lore` text,
  PRIMARY KEY (`hero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero`
--

LOCK TABLES `hero` WRITE;
/*!40000 ALTER TABLE `hero` DISABLE KEYS */;
INSERT INTO `hero` VALUES (1,'Anti-Mage','Melee',NULL),(2,'Axe','Melee',NULL),(3,'Bane','Ranged',NULL),(4,'Bloodseeker','Melee',NULL),(5,'Crystal Maiden','Ranged',NULL),(6,'Drow Ranger','Ranged',NULL),(7,'Earthshaker','Melee',NULL),(8,'Juggernaut','Melee',NULL),(9,'Mirana','Ranged',NULL),(10,'Morphling','Ranged',NULL),(11,'Shadow Fiend','Ranged',NULL),(12,'Phantom Lancer','Melee',NULL),(13,'Puck','Ranged',NULL),(14,'Pudge','Melee',NULL),(15,'Razor','Ranged',NULL),(16,'Sand King','Melee',NULL),(17,'Storm Spirit','Ranged',NULL),(18,'Sven','Melee',NULL),(19,'Tiny','Melee',NULL),(20,'Vengeful Spirit','Ranged',NULL),(21,'Windranger','Ranged',NULL),(22,'Zeus','Ranged',NULL),(23,'Kunkka','Melee',NULL),(25,'Lina','Ranged',NULL),(26,'Lion','Ranged',NULL),(27,'Shadow Shaman','Ranged',NULL),(28,'Slardar','Melee',NULL),(29,'Tidehunter','Melee',NULL),(30,'Witch Doctor','Ranged',NULL),(31,'Lich','Ranged',NULL),(32,'Riki','Melee',NULL),(33,'Enigma','Ranged',NULL),(34,'Tinker','Ranged',NULL),(35,'Sniper','Ranged',NULL),(36,'Necrophos','Ranged',NULL),(37,'Warlock','Ranged',NULL),(38,'Beastmaster','Melee',NULL),(39,'Queen of Pain','Ranged',NULL),(40,'Venomancer','Ranged',NULL),(41,'Faceless Void','Melee',NULL),(42,'Wraith King','Melee',NULL),(43,'Death Prophet','Ranged',NULL),(44,'Phantom Assassin','Melee',NULL),(45,'Pugna','Ranged',NULL),(46,'Templar Assassin','Ranged',NULL),(47,'Viper','Ranged',NULL),(48,'Luna','Ranged',NULL),(49,'Dragon Knight','Melee',NULL),(50,'Dazzle','Ranged',NULL),(51,'Clockwerk','Melee',NULL),(52,'Leshrac','Ranged',NULL),(53,'Nature\'s Prophet','Ranged',NULL),(54,'Lifestealer','Melee',NULL),(55,'Dark Seer','Melee',NULL),(56,'Clinkz','Ranged',NULL),(57,'Omniknight','Melee',NULL),(58,'Enchantress','Ranged',NULL),(59,'Huskar','Ranged',NULL),(60,'Night Stalker','Melee',NULL),(61,'Broodmother','Melee',NULL),(62,'Bounty Hunter','Melee',NULL),(63,'Weaver','Ranged',NULL),(64,'Jakiro','Ranged',NULL),(65,'Batrider','Ranged',NULL),(66,'Chen','Ranged',NULL),(67,'Spectre','Melee',NULL),(68,'Ancient Apparition','Ranged',NULL),(69,'Doom','Melee',NULL),(70,'Ursa','Melee',NULL),(71,'Spirit Breaker','Melee',NULL),(72,'Gyrocopter','Ranged',NULL),(73,'Alchemist','Melee',NULL),(74,'Invoker','Ranged',NULL),(75,'Silencer','Ranged',NULL),(77,'Lycan','Melee',NULL),(78,'Brewmaster','Melee',NULL),(79,'Shadow Demon','Ranged',NULL),(80,'Lone Druid','Ranged',NULL),(81,'Chaos Knight','Melee',NULL),(82,'Meepo','Melee',NULL),(83,'Treant Protector','Melee',NULL),(84,'Ogre Magi','Melee',NULL),(85,'Undying','Melee',NULL),(86,'Rubick','Ranged',NULL),(87,'Disruptor','Ranged',NULL),(88,'Nyx Assassin','Melee',NULL),(89,'Naga Siren','Melee',NULL),(90,'Keeper of the Light','Ranged',NULL),(91,'Io','Ranged',NULL),(92,'Visage','Ranged',NULL),(93,'Slark','Melee',NULL),(94,'Medusa','Ranged',NULL),(95,'Troll Warlord','Ranged',NULL),(96,'Centaur Warrunner','Melee',NULL),(97,'Magnus','Melee',NULL),(98,'Timbersaw','Melee',NULL),(99,'Bristleback','Melee',NULL),(100,'Tusk','Melee',NULL),(101,'Skywrath Mage','Ranged',NULL),(102,'Abaddon','Melee',NULL),(103,'Elder Titan','Melee',NULL),(104,'Legion Commander','Melee',NULL),(105,'Techies','Ranged',NULL),(106,'Ember Spirit','Melee',NULL),(107,'Earth Spirit','Melee',NULL),(108,'Underlord','Melee',NULL),(109,'Terrorblade','Melee',NULL),(110,'Phoenix','Ranged',NULL),(111,'Oracle','Ranged',NULL),(112,'Winter Wyvern','Ranged',NULL),(113,'Arc Warden','Ranged',NULL),(114,'Monkey King','Melee',NULL),(119,'Dark Willow','Ranged',NULL),(120,'Pangolier','Melee',NULL),(121,'Grimstroke','Ranged',NULL);
/*!40000 ALTER TABLE `hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero_stats`
--

DROP TABLE IF EXISTS `hero_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hero_stats` (
  `hero_id` int NOT NULL,
  `strength` int DEFAULT NULL,
  `agility` int DEFAULT NULL,
  `intelegence` int DEFAULT NULL,
  `movement_speed` int DEFAULT NULL,
  `damage` int DEFAULT NULL,
  `armor` int DEFAULT NULL,
  PRIMARY KEY (`hero_id`),
  CONSTRAINT `hero_stats_ibfk_1` FOREIGN KEY (`hero_id`) REFERENCES `hero` (`hero_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero_stats`
--

LOCK TABLES `hero_stats` WRITE;
/*!40000 ALTER TABLE `hero_stats` DISABLE KEYS */;
INSERT INTO `hero_stats` VALUES (1,2,2,1,51,0,1),(2,5,2,3,49,4,1),(3,2,2,2,58,0,1),(4,2,2,3,57,0,1),(5,2,3,2,40,0,1),(6,2,1,2,44,0,1),(7,3,2,3,49,3,1),(8,2,1,2,48,0,1),(9,2,2,2,43,0,1),(10,2,1,2,33,0,1),(11,2,2,2,35,0,1),(12,3,2,2,51,0,1),(13,2,2,2,53,0,1),(14,2,2,4,59,4,1),(15,2,2,3,45,0,1),(16,2,2,3,47,3,1),(17,2,3,2,46,0,1),(18,2,1,3,66,3,1),(19,2,2,4,74,5,1),(20,2,2,3,39,0,1),(21,2,3,3,42,0,1),(22,2,3,2,53,0,1),(23,2,2,3,50,4,1),(25,2,3,2,46,0,1),(26,2,3,2,47,0,1),(27,2,3,2,73,0,1),(28,2,2,3,51,3,1),(29,2,2,3,47,3,1),(30,2,3,2,51,0,1),(31,2,3,2,42,0,1),(32,3,1,2,41,0,1),(33,2,3,2,42,0,1),(34,2,2,2,52,0,1),(35,2,3,2,36,0,1),(36,2,3,3,46,0,1),(37,2,3,3,46,0,1),(38,2,2,3,64,3,1),(39,2,3,2,45,0,1),(40,2,2,2,38,0,1),(41,2,2,2,56,0,1),(42,2,2,3,61,3,1),(43,2,3,3,47,0,1),(44,2,1,2,46,0,1),(45,2,5,2,43,0,1),(46,2,2,2,53,0,1),(47,2,2,2,44,0,1),(48,2,2,2,38,0,1),(49,2,2,3,50,3,1),(50,2,3,2,47,0,1),(51,2,1,3,50,4,1),(52,2,3,2,41,0,1),(53,2,3,2,52,0,1),(54,2,2,3,52,4,1),(55,2,3,3,54,0,1),(56,2,2,2,37,0,1),(57,2,2,3,53,3,1),(58,2,3,1,49,0,1),(59,2,2,3,40,3,1),(60,4,2,3,61,3,1),(61,2,2,3,41,0,1),(62,2,2,2,45,0,1),(63,3,2,2,50,0,1),(64,2,3,3,53,0,1),(65,4,3,3,38,0,1),(66,2,3,2,48,0,1),(67,2,2,2,46,0,1),(68,2,3,2,44,0,1),(69,2,2,4,53,4,1),(70,2,2,3,42,0,1),(71,2,2,3,60,4,1),(72,2,2,2,37,0,1),(73,2,2,2,49,4,1),(74,2,4,2,35,0,1),(75,2,3,3,43,0,1),(77,2,1,3,55,4,1),(78,2,1,3,52,3,1),(79,2,3,2,50,0,1),(80,2,1,2,42,0,1),(81,2,1,3,51,3,1),(82,2,2,2,43,0,1),(83,2,2,4,87,4,1),(84,6,2,4,58,0,1),(85,2,3,2,57,3,1),(86,2,2,2,44,0,1),(87,2,3,2,49,0,1),(88,5,2,2,46,0,1),(89,3,2,3,44,0,1),(90,2,3,2,43,0,1),(91,2,2,2,39,3,1),(92,2,3,3,45,0,1),(93,4,2,2,54,0,1),(94,2,2,1,44,0,1),(95,2,1,3,38,0,1),(96,2,2,4,63,4,1),(97,2,2,3,55,3,1),(98,2,2,2,47,3,1),(99,2,3,2,44,3,1),(100,2,2,3,50,3,1),(101,2,4,2,39,0,1),(102,2,2,3,55,3,1),(103,2,2,3,47,4,1),(104,2,2,3,61,4,1),(105,2,3,2,29,0,1),(106,2,2,2,52,0,1),(107,2,2,4,46,3,1),(108,2,3,3,62,4,1),(109,2,2,2,48,0,1),(110,2,2,3,45,3,1),(111,2,4,2,39,0,1),(112,2,3,2,38,0,1),(113,2,3,3,46,0,1),(114,3,2,3,51,0,1),(119,2,3,2,45,0,1),(120,2,2,3,47,0,1),(121,2,3,2,50,0,1);
/*!40000 ALTER TABLE `hero_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `player_id` int NOT NULL,
  `username` varchar(64) NOT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `team_name_idx` (`team_name`),
  CONSTRAINT `team_name` FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (20469625,'Moff','Dragons'),(31139074,'Martiros','MongoOG'),(85408102,'jimmy',NULL),(112787027,'Datu','Huskies'),(121004411,'woozi','Star'),(124576733,'ZSG','DBS'),(150977187,'Smiley','Liquid'),(170890464,'BowIE',NULL),(869601827,'Meechy','Ddragons'),(1005635181,'miracle',NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `teamAvgMmr_after_player_update` AFTER UPDATE ON `player` FOR EACH ROW BEGIN
Declare newmmr int;
select averagemmr(OLD.team_name) into newmmr;
update team set avg_mmr = newmmr where team_name = OLD.team_name;
select averagemmr(NEW.team_name) into newmmr;
update team set avg_mmr = newmmr where team_name = NEW.team_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `teamAvgMmr_after_player_delete` AFTER DELETE ON `player` FOR EACH ROW BEGIN
Declare newmmr int;
select averagemmr(OLD.team_name) into newmmr;
update team set avg_mmr = newmmr where team_name = OLD.team_name;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `player_stats`
--

DROP TABLE IF EXISTS `player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_stats` (
  `player_id` int NOT NULL,
  `mmr` int NOT NULL,
  `wins` int DEFAULT NULL,
  `losses` int DEFAULT NULL,
  `most_played_hero` int DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `most_played_hero` (`most_played_hero`),
  CONSTRAINT `player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_stats_ibfk_2` FOREIGN KEY (`most_played_hero`) REFERENCES `hero` (`hero_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_stats`
--

LOCK TABLES `player_stats` WRITE;
/*!40000 ALTER TABLE `player_stats` DISABLE KEYS */;
INSERT INTO `player_stats` VALUES (20469625,3188,4833,4752,25),(31139074,3228,1277,1226,14),(85408102,3143,784,644,53),(112787027,3169,469,502,101),(121004411,1940,415,332,90),(124576733,3379,782,763,9),(150977187,3211,1430,1499,8),(170890464,2934,2086,2083,86),(869601827,2283,0,1,60),(1005635181,1957,812,808,14);
/*!40000 ALTER TABLE `player_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_name` varchar(64) NOT NULL,
  `captain` int DEFAULT NULL,
  `avg_mmr` int DEFAULT NULL,
  PRIMARY KEY (`team_name`),
  KEY `captain` (`captain`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`captain`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('DBS',124576733,3379),('Ddragons',869601827,2283),('Dragons',20469625,3188),('Huskies',112787027,3169),('Liquid',150977187,3211),('MongoOG',31139074,3228),('Star',121004411,1940);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'final'
--

--
-- Dumping routines for database 'final'
--
/*!50003 DROP FUNCTION IF EXISTS `averagemmr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `averagemmr`(teamName varchar(64)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN

    DECLARE result int;

   select avg(mmr) into result from player as p join player_stats as ps on p.player_id = ps.player_id where team_name = teamName group by team_name;

   RETURN result;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addPlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addPlayer`(
	IN  id  INT,	username VARCHAR(64),    mmr INT,    wins INT,    losses INT,    mph INT
)
BEGIN

	INSERT IGNORE INTO player VALUES 
	(id,username, Null);
	INSERT IGNORE INTO player_stats VALUES
	(id, mmr, wins, losses, mph);
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createTeam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createTeam`(
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
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 16:47:02
