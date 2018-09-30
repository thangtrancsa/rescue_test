# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.21-MariaDB)
# Database: rescue_test
# Generation Time: 2018-09-30 08:37:47 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(200) NOT NULL,
  `is_publish` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;

INSERT INTO `modules` (`id`, `created`, `modified`, `name`, `is_publish`, `user_id`)
VALUES
	(1,'0000-00-00 00:00:00','0000-00-00 00:00:00','frontend',1,1);

/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pokemons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pokemons`;

CREATE TABLE `pokemons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

LOCK TABLES `pokemons` WRITE;
/*!40000 ALTER TABLE `pokemons` DISABLE KEYS */;

INSERT INTO `pokemons` (`id`, `name`, `type`)
VALUES
	(1,'Bulbasaur','[\"poison\",\"grass\"]'),
	(2,'Ivysaur','[\"poison\",\"grass\"]'),
	(3,'Venusaur','[\"poison\",\"grass\"]'),
	(4,'Charmander','[\"fire\"]'),
	(5,'Charmeleon','[\"fire\"]'),
	(6,'Charizard','[\"flying\",\"fire\"]'),
	(7,'Squirtle','[\"water\"]'),
	(8,'Wartortle','[\"water\"]'),
	(9,'Blastoise','[\"water\"]'),
	(10,'Caterpie','[\"bug\"]'),
	(11,'Metapod','[\"bug\"]'),
	(12,'Butterfree','[\"flying\",\"bug\"]'),
	(13,'Weedle','[\"poison\",\"bug\"]'),
	(14,'Kakuna','[\"poison\",\"bug\"]'),
	(15,'Beedrill','[\"poison\",\"bug\"]'),
	(16,'Pidgey','[\"flying\",\"normal\"]'),
	(17,'Pidgeotto','[\"flying\",\"normal\"]'),
	(18,'Pidgeot','[\"flying\",\"normal\"]'),
	(19,'Rattata','[\"normal\"]'),
	(20,'Raticate','[\"normal\"]'),
	(21,'Spearow','[\"flying\",\"normal\"]'),
	(22,'Fearow','[\"flying\",\"normal\"]'),
	(23,'Ekans','[\"poison\"]'),
	(24,'Arbok','[\"poison\"]'),
	(25,'Pikachu','[\"electric\"]'),
	(26,'Raichu','[\"electric\"]'),
	(27,'Sandshrew','[\"ground\"]'),
	(28,'Sandslash','[\"ground\"]'),
	(29,'Nidoran-f','[\"poison\"]'),
	(30,'Nidorina','[\"poison\"]'),
	(31,'Nidoqueen','[\"ground\",\"poison\"]'),
	(32,'Nidoran-m','[\"poison\"]'),
	(33,'Nidorino','[\"poison\"]'),
	(34,'Nidoking','[\"ground\",\"poison\"]'),
	(35,'Clefairy','[\"fairy\"]'),
	(36,'Clefable','[\"fairy\"]'),
	(37,'Vulpix','[\"fire\"]'),
	(38,'Ninetales','[\"fire\"]'),
	(39,'Jigglypuff','[\"fairy\",\"normal\"]'),
	(40,'Wigglytuff','[\"fairy\",\"normal\"]'),
	(41,'Zubat','[\"flying\",\"poison\"]'),
	(42,'Golbat','[\"flying\",\"poison\"]'),
	(43,'Oddish','[\"poison\",\"grass\"]'),
	(44,'Gloom','[\"poison\",\"grass\"]'),
	(45,'Vileplume','[\"poison\",\"grass\"]'),
	(46,'Paras','[\"grass\",\"bug\"]'),
	(47,'Parasect','[\"grass\",\"bug\"]'),
	(48,'Venonat','[\"poison\",\"bug\"]'),
	(49,'Venomoth','[\"poison\",\"bug\"]'),
	(50,'Diglett','[\"ground\"]'),
	(51,'Dugtrio','[\"ground\"]'),
	(52,'Meowth','[\"normal\"]'),
	(53,'Persian','[\"normal\"]'),
	(54,'Psyduck','[\"water\"]'),
	(55,'Golduck','[\"water\"]'),
	(56,'Mankey','[\"fighting\"]'),
	(57,'Primeape','[\"fighting\"]'),
	(58,'Growlithe','[\"fire\"]'),
	(59,'Arcanine','[\"fire\"]'),
	(60,'Poliwag','[\"water\"]'),
	(61,'Poliwhirl','[\"water\"]'),
	(62,'Poliwrath','[\"fighting\",\"water\"]'),
	(63,'Abra','[\"psychic\"]'),
	(64,'Kadabra','[\"psychic\"]'),
	(65,'Alakazam','[\"psychic\"]'),
	(66,'Machop','[\"fighting\"]'),
	(67,'Machoke','[\"fighting\"]'),
	(68,'Machamp','[\"fighting\"]'),
	(69,'Bellsprout','[\"poison\",\"grass\"]'),
	(70,'Weepinbell','[\"poison\",\"grass\"]'),
	(71,'Victreebel','[\"poison\",\"grass\"]'),
	(72,'Tentacool','[\"poison\",\"water\"]'),
	(73,'Tentacruel','[\"poison\",\"water\"]'),
	(74,'Geodude','[\"ground\",\"rock\"]'),
	(75,'Graveler','[\"ground\",\"rock\"]'),
	(76,'Golem','[\"ground\",\"rock\"]'),
	(77,'Ponyta','[\"fire\"]'),
	(78,'Rapidash','[\"fire\"]'),
	(79,'Slowpoke','[\"psychic\",\"water\"]'),
	(80,'Slowbro','[\"psychic\",\"water\"]'),
	(81,'Magnemite','[\"steel\",\"electric\"]'),
	(82,'Magneton','[\"steel\",\"electric\"]'),
	(83,'Farfetchd','[\"flying\",\"normal\"]'),
	(84,'Doduo','[\"flying\",\"normal\"]'),
	(85,'Dodrio','[\"flying\",\"normal\"]'),
	(86,'Seel','[\"water\"]'),
	(87,'Dewgong','[\"ice\",\"water\"]'),
	(88,'Grimer','[\"poison\"]'),
	(89,'Muk','[\"poison\"]'),
	(90,'Shellder','[\"water\"]'),
	(91,'Cloyster','[\"ice\",\"water\"]'),
	(92,'Gastly','[\"poison\",\"ghost\"]'),
	(93,'Haunter','[\"poison\",\"ghost\"]'),
	(94,'Gengar','[\"poison\",\"ghost\"]'),
	(95,'Onix','[\"ground\",\"rock\"]'),
	(96,'Drowzee','[\"psychic\"]'),
	(97,'Hypno','[\"psychic\"]'),
	(98,'Krabby','[\"water\"]'),
	(99,'Kingler','[\"water\"]'),
	(100,'Voltorb','[\"electric\"]'),
	(101,'Electrode','[\"electric\"]'),
	(102,'Exeggcute','[\"psychic\",\"grass\"]'),
	(103,'Exeggutor','[\"psychic\",\"grass\"]'),
	(104,'Cubone','[\"ground\"]'),
	(105,'Marowak','[\"ground\"]'),
	(106,'Hitmonlee','[\"fighting\"]'),
	(107,'Hitmonchan','[\"fighting\"]'),
	(108,'Lickitung','[\"normal\"]'),
	(109,'Koffing','[\"poison\"]'),
	(110,'Weezing','[\"poison\"]'),
	(111,'Rhyhorn','[\"rock\",\"ground\"]'),
	(112,'Rhydon','[\"rock\",\"ground\"]'),
	(113,'Chansey','[\"normal\"]'),
	(114,'Tangela','[\"grass\"]'),
	(115,'Kangaskhan','[\"normal\"]'),
	(116,'Horsea','[\"water\"]'),
	(117,'Seadra','[\"water\"]'),
	(118,'Goldeen','[\"water\"]'),
	(119,'Seaking','[\"water\"]'),
	(120,'Staryu','[\"water\"]'),
	(121,'Starmie','[\"psychic\",\"water\"]'),
	(122,'Mr-mime','[\"fairy\",\"psychic\"]'),
	(123,'Scyther','[\"flying\",\"bug\"]'),
	(124,'Jynx','[\"psychic\",\"ice\"]'),
	(125,'Electabuzz','[\"electric\"]'),
	(126,'Magmar','[\"fire\"]'),
	(127,'Pinsir','[\"bug\"]'),
	(128,'Tauros','[\"normal\"]'),
	(129,'Magikarp','[\"water\"]'),
	(130,'Gyarados','[\"flying\",\"water\"]'),
	(131,'Lapras','[\"ice\",\"water\"]'),
	(132,'Ditto','[\"normal\"]'),
	(133,'Eevee','[\"normal\"]'),
	(134,'Vaporeon','[\"water\"]'),
	(135,'Jolteon','[\"electric\"]'),
	(136,'Flareon','[\"fire\"]'),
	(137,'Porygon','[\"normal\"]'),
	(138,'Omanyte','[\"water\",\"rock\"]'),
	(139,'Omastar','[\"water\",\"rock\"]'),
	(140,'Kabuto','[\"water\",\"rock\"]'),
	(141,'Kabutops','[\"water\",\"rock\"]'),
	(142,'Aerodactyl','[\"flying\",\"rock\"]'),
	(143,'Snorlax','[\"normal\"]'),
	(144,'Articuno','[\"flying\",\"ice\"]'),
	(145,'Zapdos','[\"flying\",\"electric\"]'),
	(146,'Moltres','[\"flying\",\"fire\"]'),
	(147,'Dratini','[\"dragon\"]'),
	(148,'Dragonair','[\"dragon\"]'),
	(149,'Dragonite','[\"flying\",\"dragon\"]'),
	(150,'Mewtwo','[\"psychic\"]'),
	(151,'Mew','[\"psychic\"]');

/*!40000 ALTER TABLE `pokemons` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
