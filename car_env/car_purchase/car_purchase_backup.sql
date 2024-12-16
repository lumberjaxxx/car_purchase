-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: car_purchase
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Jane','Smith','456 Oak Street','Updated customer'),(2,'Tyler','Shaw','565 Carlson Dam\nLake Sandra, TX 37155','Indeed point guess put.'),(3,'Billy','Jones','3963 Elizabeth Loop\nDanielborough, CO 13496','Staff theory for.'),(4,'Patricia','Arias','616 Matthew Lodge Suite 159\nNew Tylermouth, O','Specific well bag year federal.'),(5,'Justin','Tapia','539 Jason Key Suite 003\nEast Michellemouth, P','State property the yourself.'),(6,'Nathan','Fleming','0111 Robert Crossing\nEast Christopher, SC 506','For quite clear after see behavior.'),(7,'Donna','Nichols','15907 Samuel Canyon\nMichaelmouth, WI 32278','Customer mouth paper political common.'),(8,'Nicholas','Murphy','67339 Matthew Ranch Apt. 527\nRobinville, GA 4','Role term section statement many.'),(9,'Lisa','Henderson','4005 Melissa Orchard\nWest Kimberly, SD 11546','Eye expect city base.'),(10,'Jason','Crawford','173 Gonzales Lane\nPort Wayne, MS 95443','Challenge hold myself must.'),(11,'Wanda','Martinez','Unit 3681 Box 2258\nDPO AP 71286','Prove civil black build PM.'),(12,'Stacey','Dunn','10082 Lisa Loaf Apt. 961\nAndrewsport, SD 7389','Successful simple south like often could.'),(13,'Jacob','Nelson','922 Tran Tunnel\nNew Melvin, GU 62034','Parent all according question support.'),(14,'Russell','Oneal','Unit 9819 Box 5241\nDPO AE 92240','Score develop doctor risk.'),(15,'Cathy','Ortiz','27146 Scott Fort\nSouth Dennis, WA 71851','Plant exactly up include.'),(16,'Eric','Lewis','974 Lawrence Lock Apt. 935\nMooreview, FL 0193','Career three situation speak most expert.'),(17,'Tyrone','Hayes','15948 Cabrera Courts Suite 791\nLake Angela, W','Such inside watch able whole before best.'),(18,'Mark','Abbott','8193 Harrington Causeway\nNew Jenniferview, CT','Consumer now skin.'),(19,'Abigail','Anderson','9948 Deborah Prairie\nPort Michellehaven, VA 9','Middle yard some seek provide consider wife.'),(20,'Cristian','Salazar','47914 Bowman Plains Suite 388\nColonberg, MO 6','Here low part that.'),(21,'Michael','King','643 Farrell Island\nSouth Nicholas, WA 74247','Seem happen move trial.'),(22,'Angel','Terry','98759 Joshua Summit\nLake Allison, IL 05018','Discover authority senior occur word.'),(23,'Christopher','Williamson','110 Dixon Trace\nWest Keithborough, KY 61171','Media road address. Light media success.'),(24,'Samantha','Ortiz','Unit 0599 Box 1215\nDPO AE 39066','Thus soon month provide view model.'),(25,'Brittany','Avery','677 Woods Ports Suite 213\nBrennanland, MI 325','Success claim foreign up plan ball.'),(26,'Lorraine','George','029 Eugene Expressway Suite 002\nLauraburgh, M','Eye owner can oil notice.'),(27,'Emily','Gibbs','13061 Brian Locks\nSanchezside, HI 66849','Process paper official story movement.'),(28,'Donna','Foster','61531 Fowler Prairie\nRogersville, IN 21272','Minute service manage like hour do again.'),(29,'Chelsea','Murphy','3214 Hahn Overpass\nWilliamtown, UT 17027','That be street.'),(30,'Mark','Nguyen','9395 Clark Islands\nNorth Heatherstad, NJ 9438','Institution summer gun want pattern.'),(31,'Richard','Smith','1848 Wilkerson Village\nJosephmouth, DC 68988','Part think soon energy.'),(32,'Jennifer','Austin','4635 Jonathan Plaza\nVictorhaven, RI 99789','Walk she message everything picture.'),(33,'William','Kennedy','240 Ortiz Pine\nWest Brandytown, HI 00976','Case top year analysis president rate.'),(34,'Jeremy','Khan','21953 Michael Flats Suite 304\nSouth Kimberly,','Mother focus responsibility discussion.'),(35,'Erin','Hayes','0885 Vega Inlet Apt. 786\nEast Christinahaven,','Same pressure would standard image room.'),(36,'Michael','Reyes','987 Angela Skyway\nPort Kimberly, MS 92857','Wife bad issue example.'),(37,'Christopher','Pope','5531 Hill Springs\nWest Bobbyside, LA 52062','By have spend.'),(38,'Jorge','Pham','8236 Andrea Expressway Apt. 185\nStevenshire, ','Sea score approach side.'),(39,'Dawn','Sanchez','3239 Benjamin Ferry\nLake Michael, AZ 76148','Without pull house lose most us often.'),(40,'Sean','Edwards','662 Hester Freeway Apt. 376\nJefferymouth, VI ','Take its trial hand.'),(41,'Frederick','Barajas','314 Davis Extensions\nJoshuaberg, MN 66560','Maintain into attention.'),(42,'Anna','Smith','190 Shane Mews Apt. 419\nSouth Kimberlyville, ','Western card water him nice house true.'),(43,'Tyler','Mora','3161 Kayla Stravenue\nTimothyburgh, UT 39527','Back those newspaper within peace situation.'),(44,'Marie','Thomas','53920 Mary Well\nPort Brittany, MP 83696','Information church available model.'),(45,'Paul','Jordan','77411 Thompson Island Apt. 785\nYolandaberg, V','Knowledge boy resource outside.'),(46,'Adam','Zavala','879 Roberson Villages Apt. 009\nLake Noahberg,','Happy artist perform child something strong.'),(47,'Edwin','Wade','844 Curtis Union\nRodriguezhaven, ND 80572','Bring anything paper speak direction here.'),(48,'Theresa','Glass','84314 Brown Fall Suite 551\nStephenstad, IA 83','Idea big can.'),(49,'Peter','Mclean','34455 Gomez Hollow Apt. 704\nNorth Alexandria,','Fall certainly future.'),(51,'John','Doe','123 Elm Street','Preferred customer'),(52,'John','Doe','123 Elm Street','Preferred customer'),(53,'John','Doe','123 Elm Street','Preferred customer'),(54,'John','Doe','123 Elm Street','Preferred customer');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_status`
--

DROP TABLE IF EXISTS `item_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_status` (
  `item_code` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) NOT NULL,
  `item_quantity_available` int NOT NULL,
  `other_item_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_status`
--

LOCK TABLES `item_status` WRITE;
/*!40000 ALTER TABLE `item_status` DISABLE KEYS */;
INSERT INTO `item_status` VALUES (1,'effect',22,'Put kind relate support goal season.'),(2,'need',46,'South mind table agree we key.'),(3,'training',18,'Tell task whole black.'),(4,'man',32,'Lose simple foot.'),(5,'state',25,'Reason field attention late nation exactly.'),(6,'during',20,'Determine cost onto join improve.'),(7,'do',58,'List opportunity gun keep.'),(8,'although',35,'Song yeah personal son authority outside.'),(9,'care',43,'Any them ahead simply ready they.'),(10,'such',90,'Color industry begin one including billion.'),(11,'figure',76,'Approach middle kind specific our.'),(12,'whole',25,'Deal whom court maintain population.'),(13,'today',16,'Sport practice police goal.'),(14,'move',3,'Forward yeah prove name many whether.'),(15,'until',76,'Short fly hot forget operation spring.'),(16,'share',92,'Woman law front feel.'),(17,'best',88,'Term build open music.'),(18,'put',37,'Way hard imagine affect bill.'),(19,'establish',48,'Individual even stage child.'),(20,'Brake Pad Updated',450,NULL),(21,'information',20,'Quickly design section.'),(22,'yard',80,'Watch oil also director himself.'),(23,'prove',44,'Health even next recently.'),(24,'for',81,'This they likely focus.'),(25,'question',28,'Really lose gas thousand cut.'),(26,'any',17,'That market alone feeling break wish while.'),(27,'information',15,'Then report kid practice eye need.'),(28,'condition',52,'Him yet tough expect machine.'),(29,'know',61,'Car shake remain whole per there.'),(30,'these',45,'Across brother story until bill.'),(31,'space',13,'Be better air save between crime.'),(32,'wall',48,'History career hair you doctor trip.'),(33,'best',87,'Off face game court.'),(34,'wear',1,'Team quickly film character.'),(35,'nature',73,'Technology budget fire.'),(36,'political',18,'Foreign others member time section may.'),(37,'us',27,'City gun drive suffer move matter.'),(38,'consider',25,'Exactly it happen imagine institution.'),(39,'moment',26,'Skill effect foot low executive thus fill.'),(40,'hope',60,'He better rate eye ability.'),(41,'Republican',97,'Prove amount claim policy baby.'),(42,'agent',99,'Over event fish speak represent rate theory.'),(43,'four',60,'Heart various how know.'),(44,'program',88,'Meet through chance box data wonder shake.'),(45,'discussion',44,'Artist court follow include.'),(46,'someone',34,'Off half quite no yard example natural.'),(47,'away',54,'Begin suffer man cell career bill.'),(48,'collection',53,'Institution set foot wall.'),(49,'difference',79,'Read short deal yes and.'),(50,'read',79,'President century worker else.'),(51,'Brake Pad',500,NULL),(52,'Brake Pad',500,NULL),(53,'Brake Pad',500,NULL),(54,'Brake Pad',500,NULL);
/*!40000 ALTER TABLE `item_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `purchase_id` int NOT NULL AUTO_INCREMENT,
  `date_of_purchase` datetime NOT NULL,
  `purchase_quatity` int NOT NULL,
  `Staff_Member_staff_code` int NOT NULL,
  `Client_client_id` int NOT NULL,
  `Item_status_item_code` int NOT NULL,
  `other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `fk_Purchase_Staff_Member_idx` (`Staff_Member_staff_code`),
  KEY `fk_Purchase_Client1_idx` (`Client_client_id`),
  KEY `fk_Purchase_Item_status1_idx` (`Item_status_item_code`),
  CONSTRAINT `fk_Purchase_Client1` FOREIGN KEY (`Client_client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Purchase_Item_status1` FOREIGN KEY (`Item_status_item_code`) REFERENCES `item_status` (`item_code`),
  CONSTRAINT `fk_Purchase_Staff_Member` FOREIGN KEY (`Staff_Member_staff_code`) REFERENCES `staff_member` (`staff_code`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (2,'2024-04-22 00:00:00',48,4,47,33,'Big student number fund.'),(3,'2024-10-28 00:00:00',37,25,22,13,'Game very voice me.'),(4,'2024-08-31 00:00:00',8,15,40,25,'Southern suffer agree land culture face.'),(5,'2024-11-01 00:00:00',46,46,16,35,'Personal better detail my ball blue foreign.'),(6,'2024-03-08 00:00:00',5,36,24,30,'He best large produce pay movement field.'),(7,'2024-09-07 00:00:00',19,23,33,44,'Oil base region eye simple few.'),(8,'2024-05-23 00:00:00',32,34,3,6,'Deep reality power door two page.'),(9,'2024-04-11 00:00:00',24,44,48,40,'Activity space stage floor above.'),(10,'2024-01-30 00:00:00',5,28,5,30,'Industry decide space.'),(11,'2024-05-06 00:00:00',13,28,5,30,'Better nature young real hotel manage.'),(12,'2024-06-17 00:00:00',37,9,42,42,'Purpose upon much party would.'),(13,'2024-07-24 00:00:00',32,9,25,14,'Site company value walk bring.'),(14,'2024-01-14 00:00:00',2,46,32,26,'Low animal chance join sound a institution.'),(15,'2024-05-05 00:00:00',43,24,11,39,'Poor hit pressure name.'),(16,'2024-08-29 00:00:00',44,34,10,46,'Establish cell seat.'),(18,'2024-02-23 00:00:00',32,28,46,44,'Red all quite leg answer soon think.'),(19,'2024-02-18 00:00:00',20,38,10,44,'White development discover since.'),(20,'2024-08-07 00:00:00',43,9,43,18,'Stuff over father hour.'),(21,'2024-05-29 00:00:00',47,20,37,29,'Growth agree exist can window.'),(22,'2024-03-09 00:00:00',14,50,48,25,'Continue assume herself see.'),(23,'2024-07-11 00:00:00',48,7,19,48,'Determine mind short phone choice.'),(24,'2024-05-15 00:00:00',3,21,26,4,'Front would church method.'),(25,'2024-04-07 00:00:00',10,36,34,46,'Reveal audience again into.'),(26,'2024-03-24 00:00:00',19,38,42,21,'Behavior its group opportunity.'),(27,'2024-12-14 00:00:00',50000,12,1,21,NULL),(28,'2024-12-14 00:00:00',50000,12,1,21,NULL),(29,'2024-12-14 00:00:00',50000,12,1,21,NULL),(30,'2024-12-14 00:00:00',50000,12,1,21,NULL);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_member`
--

DROP TABLE IF EXISTS `staff_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_member` (
  `staff_code` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staff_code`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_member`
--

LOCK TABLES `staff_member` WRITE;
/*!40000 ALTER TABLE `staff_member` DISABLE KEYS */;
INSERT INTO `staff_member` VALUES (1,'Justin','Flores','Close window as difference.'),(2,'Bryan','Martin','Five issue drive college.'),(3,'Jessica','Stewart','Else practice cut.'),(4,'Ronald','Collins','Tv recently piece create second exactly.'),(5,'Troy','Levine','Participant happen save hope.'),(6,'Casey','Boyer','Often history sound.'),(7,'Jamie','Walker','Save these effort.'),(8,'Amanda','Davis','Necessary include get region carry.'),(9,'Thomas','Sullivan','Election assume reach window church run.'),(10,'Daniel','Nelson','Spend trade national industry find moment.'),(11,'Kayla','Smith','Discover all total should down leader deal.'),(12,'Laura','Jenkins','Care lay ask.'),(13,'Jeffrey','Robertson','Sister short sense series resource.'),(14,'Pamela','Bryan','Let relate mission share.'),(15,'Christine','Decker','Bar think least easy mission type.'),(16,'Matthew','Collins','Development health our group drop so.'),(17,'Rachel','Gates','Yes want high manager.'),(18,'Devin','Mcdonald','Life idea on ready near factor long.'),(19,'Victoria','Howard','Early commercial guy foreign join energy.'),(20,'Alice Updated','Johnson',NULL),(21,'Jacob','Jensen','Argue consumer physical role on sport.'),(22,'Joshua','Ellis','Large color forget alone trade new.'),(23,'Jonathan','Berry','Care garden within.'),(24,'Susan','Lee','Would sport source charge available the.'),(25,'Cassandra','Navarro','According age nothing.'),(27,'Patricia','Rangel','Market until discuss show listen Democrat.'),(28,'Kimberly','Bowman','Door call change order add including box.'),(29,'Michael','Smith','Design you seat form.'),(30,'Allison','Strickland','Theory out table new trouble nation.'),(31,'Elizabeth','Michael','Research in bad short style young event.'),(32,'Vicki','Perez','Try laugh PM learn.'),(33,'Caitlin','Reyes','Relate eye respond.'),(34,'John','Patrick','Money ever open down.'),(35,'Summer','Ray','Adult group consider.'),(36,'James','Lambert','Eye recent watch boy never.'),(37,'Christopher','Morrison','Across either smile next check include you.'),(38,'Kristen','Stewart','Middle seem gun side we challenge.'),(39,'Sherri','Bridges','Worker card research order wait.'),(40,'Andrew','Lopez','Establish talk together culture.'),(41,'Darren','Stewart','Deep Republican success.'),(42,'Matthew','Le','Seem old catch himself relate should.'),(43,'Lisa','Stewart','My clear serious else there social painting.'),(44,'Kimberly','Braun','Must name couple front actually fact.'),(45,'Monica','Palmer','Arrive full camera air.'),(46,'Cristina','White','Respond edge ahead begin.'),(47,'Sandra','David','Month let project require.'),(48,'Jason','Vasquez','Range you anyone. Around today I why key.'),(49,'Jessica','Jones','Friend begin station pay.'),(50,'Edward','Jennings','Stuff always daughter happy thousand.'),(51,'Alice','Johnson',NULL),(52,'Alice','Johnson',NULL),(53,'Alice','Johnson',NULL),(54,'Alice','Johnson',NULL);
/*!40000 ALTER TABLE `staff_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-16 22:53:52
