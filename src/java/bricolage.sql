-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 04 Mai 2019 à 01:50
-- Version du serveur :  10.1.8-MariaDB
-- Version de PHP :  5.6.14

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bricolage`
--

-- --------------------------------------------------------

--
-- Structure de la table `carburant`
--

CREATE TABLE `carburant` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `carburant`
--

INSERT INTO `carburant` (`ID`, `NOM`) VALUES
(1, 'Diesel'),
(2, 'Essence');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`ID`, `NOM`) VALUES
(1, 'Service Nettoyage'),
(2, 'Demenagement & Stock'),
(3, 'Travaux de maison'),
(4, 'Gardiennage & Deratisation'),
(5, 'Evenmentiel'),
(6, 'Babysitters'),
(7, 'Photographie'),
(8, 'Voitures'),
(9, 'Formation');

-- --------------------------------------------------------

--
-- Structure de la table `childdemandebabysitting`
--

CREATE TABLE `childdemandebabysitting` (
  `ID` bigint(20) NOT NULL,
  `AGE` int(11) DEFAULT NULL,
  `DEMANDEBABYSITTING_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `EMAIL` varchar(255) NOT NULL,
  `ADRESSECOMPLEMENT` varchar(255) DEFAULT NULL,
  `BLOCKED` tinyint(1) DEFAULT '0',
  `NOM` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `TOKEN` varchar(255) DEFAULT NULL,
  `SECTEUR_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`EMAIL`, `ADRESSECOMPLEMENT`, `BLOCKED`, `NOM`, `PASSWORD`, `PHONE`, `PRENOM`, `TOKEN`, `SECTEUR_ID`) VALUES
('anas.the.creator@gmail.com', 'Saada 1 No 570', 0, 'Benchebani', 'walo', '0630247385', 'Mohamed Anas', NULL, 3),
('htakouit@gmail.com', 'Hay Chabab No 112', 0, 'Takouit', NULL, '0677352220', 'hamza', NULL, 5),
('newCustomer@gmail.com', 'no 12 hay salama', 0, 'Customer', 'newCustomer@gmail.com', '0679461382', 'new', NULL, 5),
('zouani.younes@gmail.com', 'BLOC 41', 0, 'ZOUANIIII', 'zouani.younes@gmail.com', '0625495187', 'Younes', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

CREATE TABLE `couleur` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `couleur`
--

INSERT INTO `couleur` (`ID`, `NOM`) VALUES
(1, 'Noir'),
(2, 'Blanc'),
(3, 'Rouge'),
(4, 'Gris'),
(5, 'Bleu');

-- --------------------------------------------------------

--
-- Structure de la table `cuisinedemandeevent`
--

CREATE TABLE `cuisinedemandeevent` (
  `ID` bigint(20) NOT NULL,
  `CUISINE_ID` bigint(20) DEFAULT NULL,
  `DEMANDEEVENT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cuisinedemandeevent`
--

INSERT INTO `cuisinedemandeevent` (`ID`, `CUISINE_ID`, `DEMANDEEVENT_ID`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 2, 2),
(4, 3, 2),
(5, 2, 3),
(6, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `cuisinetype`
--

CREATE TABLE `cuisinetype` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cuisinetype`
--

INSERT INTO `cuisinetype` (`ID`, `NOM`) VALUES
(1, 'Arabe'),
(2, 'Chinoix'),
(3, 'Mexican'),
(4, 'Other');

-- --------------------------------------------------------

--
-- Structure de la table `day`
--

CREATE TABLE `day` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `day`
--

INSERT INTO `day` (`ID`, `NOM`) VALUES
(1, 'Lundi'),
(2, 'Mardi'),
(3, 'Mercredi'),
(4, 'Jeudi'),
(5, 'Vendredi'),
(6, 'Samedi'),
(7, 'Dimanche');

-- --------------------------------------------------------

--
-- Structure de la table `demandebabysitting`
--

CREATE TABLE `demandebabysitting` (
  `ID` bigint(20) NOT NULL,
  `DETAIL` varchar(255) DEFAULT NULL,
  `FULLTIME` tinyint(1) DEFAULT '0',
  `NBRHEURES` decimal(38,0) DEFAULT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demandecleaning`
--

CREATE TABLE `demandecleaning` (
  `ID` bigint(20) NOT NULL,
  `BRINGEQUIPEMENT` tinyint(1) DEFAULT '0',
  `NBRCLEANER` decimal(38,0) DEFAULT NULL,
  `NBRHEURES` decimal(38,0) DEFAULT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandecleaning`
--

INSERT INTO `demandecleaning` (`ID`, `BRINGEQUIPEMENT`, `NBRCLEANER`, `NBRHEURES`, `DEMANDESERVICE_ID`) VALUES
(1, 0, '3', '2', 1),
(2, 1, '1', '1', 2),
(3, 0, '4', '2', 3),
(4, 0, '2', '4', 4),
(5, 0, '3', '4', 5),
(6, 0, '1', '1', 6),
(7, 0, '2', '2', 7),
(8, 1, '4', '5', 8),
(9, 1, '3', '2', 48),
(10, 1, '3', '2', 49),
(11, 1, '3', '2', 50),
(12, 1, '3', '3', 57),
(13, 1, '1', '2', 59),
(14, 0, '1', '2', 60);

-- --------------------------------------------------------

--
-- Structure de la table `demandeevent`
--

CREATE TABLE `demandeevent` (
  `ID` bigint(20) NOT NULL,
  `NBRINVITES` int(11) DEFAULT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL,
  `EVENTBUDGET_ID` bigint(20) DEFAULT NULL,
  `EVENTTYPE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandeevent`
--

INSERT INTO `demandeevent` (`ID`, `NBRINVITES`, `DEMANDESERVICE_ID`, `EVENTBUDGET_ID`, `EVENTTYPE_ID`) VALUES
(1, 0, 22, 1, 1),
(2, 2, 24, 2, 5),
(3, 60, 26, 2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `demandeformationpersonnel`
--

CREATE TABLE `demandeformationpersonnel` (
  `ID` bigint(20) NOT NULL,
  `ADOMICILE` tinyint(1) DEFAULT '0',
  `NBRPERSONNE` int(11) DEFAULT NULL,
  `FILIERE_ID` bigint(20) DEFAULT NULL,
  `MATIERE_ID` bigint(20) DEFAULT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandeformationpersonnel`
--

INSERT INTO `demandeformationpersonnel` (`ID`, `ADOMICILE`, `NBRPERSONNE`, `FILIERE_ID`, `MATIERE_ID`, `DEMANDESERVICE_ID`) VALUES
(1, 1, 5, NULL, NULL, 9),
(2, 0, 5, 7, 1, 41),
(3, 0, 5, 1, 4, 42),
(4, 1, 3, 2, NULL, 51);

-- --------------------------------------------------------

--
-- Structure de la table `demandeformationpro`
--

CREATE TABLE `demandeformationpro` (
  `ID` bigint(20) NOT NULL,
  `NBRHEURES` int(11) DEFAULT NULL,
  `NBRPERSONNE` int(11) DEFAULT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL,
  `FORMATEUR_EMAIL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demandegardening`
--

CREATE TABLE `demandegardening` (
  `ID` bigint(20) NOT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL,
  `GARDENINGTYPE_ID` bigint(20) DEFAULT NULL,
  `HOME_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demandehandyman`
--

CREATE TABLE `demandehandyman` (
  `ID` bigint(20) NOT NULL,
  `NBRHANDYMAN` decimal(38,0) DEFAULT NULL,
  `NBRHEURES` decimal(38,0) DEFAULT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL,
  `SERVICE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandehandyman`
--

INSERT INTO `demandehandyman` (`ID`, `NBRHANDYMAN`, `NBRHEURES`, `DEMANDESERVICE_ID`, `SERVICE_ID`) VALUES
(1, '2', '2', 27, 8),
(2, '1', '1', 38, 8),
(3, '1', '2', 58, 10),
(4, '2', '2', 61, 10);

-- --------------------------------------------------------

--
-- Structure de la table `demandemoving`
--

CREATE TABLE `demandemoving` (
  `ADRESSEARRIVE` varchar(255) DEFAULT NULL,
  `ADRESSEDEPART` varchar(255) DEFAULT NULL,
  `HANDYMAN` tinyint(1) DEFAULT '0',
  `ID` bigint(20) DEFAULT NULL,
  `STORAGE` tinyint(1) DEFAULT '0',
  `DEMANDESERVICE_ID` bigint(20) NOT NULL,
  `VILLEARRIVE_ID` bigint(20) DEFAULT NULL,
  `VILLEDEPART_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demandepainting`
--

CREATE TABLE `demandepainting` (
  `ID` bigint(20) NOT NULL,
  `DETAIL` varchar(255) DEFAULT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL,
  `PAINTING_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demandepestcontrol`
--

CREATE TABLE `demandepestcontrol` (
  `ID` bigint(20) NOT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL,
  `TYPEOFPESTCONTROL_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandepestcontrol`
--

INSERT INTO `demandepestcontrol` (`ID`, `DEMANDESERVICE_ID`, `TYPEOFPESTCONTROL_ID`) VALUES
(1, 25, 1);

-- --------------------------------------------------------

--
-- Structure de la table `demandephotographie`
--

CREATE TABLE `demandephotographie` (
  `ID` bigint(20) NOT NULL,
  `VIDEOGRAPHIE` tinyint(1) DEFAULT '0',
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL,
  `TYPEPHOTOGRAPHIE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandephotographie`
--

INSERT INTO `demandephotographie` (`ID`, `VIDEOGRAPHIE`, `DEMANDESERVICE_ID`, `TYPEPHOTOGRAPHIE_ID`) VALUES
(1, 1, 10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `demandeservice`
--

CREATE TABLE `demandeservice` (
  `ID` bigint(20) NOT NULL,
  `DATECONFIRMATION` date DEFAULT NULL,
  `DATEDERNIERMODIF` date DEFAULT NULL,
  `DATESUPPRESSION` date DEFAULT NULL,
  `DATEDEMANDE` date DEFAULT NULL,
  `DETAIL` varchar(255) DEFAULT NULL,
  `PRIXHT` decimal(38,0) DEFAULT NULL,
  `PRIXTTC` decimal(38,0) DEFAULT NULL,
  `CLIENT_EMAIL` varchar(255) DEFAULT NULL,
  `MANAGERCONFIRMATION_LOGIN` varchar(255) DEFAULT NULL,
  `PLANNING_ID` bigint(20) DEFAULT NULL,
  `SECTEUR_ID` bigint(20) DEFAULT NULL,
  `SERVICE_ID` bigint(20) DEFAULT NULL,
  `SERVICEPRICING_ID` bigint(20) DEFAULT NULL,
  `WORKER_LOGIN` varchar(255) DEFAULT NULL,
  `WORKERTYPE_ID` bigint(20) DEFAULT NULL,
  `TYPEDEMANDE_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandeservice`
--

INSERT INTO `demandeservice` (`ID`, `DATECONFIRMATION`, `DATEDERNIERMODIF`, `DATESUPPRESSION`, `DATEDEMANDE`, `DETAIL`, `PRIXHT`, `PRIXTTC`, `CLIENT_EMAIL`, `MANAGERCONFIRMATION_LOGIN`, `PLANNING_ID`, `SECTEUR_ID`, `SERVICE_ID`, `SERVICEPRICING_ID`, `WORKER_LOGIN`, `WORKERTYPE_ID`, `TYPEDEMANDE_ID`) VALUES
(1, '2018-05-28', NULL, '2018-04-23', '2018-03-23', 'please enter quietly because the kids are still sleeping ', '300', '300', 'anas.the.creator@gmail.com', 'benchebani', 1, 2, 1, 1, 'coitcleaners@gmail.com', 1, 'DemandeCleaning'),
(2, '2018-05-30', NULL, '2018-04-16', '2018-03-23', 'none', '50', '50', 'anas.the.creator@gmail.com', 'benchebani', 2, 2, 1, 1, 'merrymaids@gmail.com', 2, 'DemandeCleaning'),
(3, NULL, NULL, NULL, '2018-03-23', 'i left food in the kitchen if you would like to eat', '400', '400', 'htakouit@gmail.com', NULL, 3, 2, 1, 1, 'cleanharbors@gmail.com', 2, 'DemandeCleaning'),
(4, NULL, NULL, '2018-04-16', '2018-03-23', 'if you cloud please check to close the door before you leave thank you', '400', '400', 'newCustomer@gmail.com', 'ysn', 4, 5, 1, 1, 'cleanharbors@gmail.com', 2, 'DemandeCleaning'),
(5, NULL, NULL, NULL, '2018-03-31', 'this is just a test', '600', '600', 'anas.the.creator@gmail.com', NULL, 5, 2, 1, 1, 'coitcleaners@gmail.com', 1, 'DemandeCleaning'),
(6, NULL, NULL, NULL, '2018-03-31', 'test for cleaning', '50', '50', 'anas.the.creator@gmail.com', NULL, 6, 2, 1, 1, 'merrymaids@gmail.com', 2, 'DemandeCleaning'),
(7, NULL, NULL, NULL, '2018-03-31', 'none', '200', '200', 'anas.the.creator@gmail.com', NULL, 7, 2, 1, 1, 'cleanharbors@gmail.com', 2, 'DemandeCleaning'),
(8, NULL, NULL, NULL, '2018-03-31', 'please enter the house quietly ! ', '1000', '1000', 'anas.the.creator@gmail.com', NULL, 8, 3, 1, 1, 'merrymaids@gmail.com', 2, 'DemandeCleaning'),
(9, NULL, NULL, NULL, '2018-04-16', 'rah swaret te7t l7be9', '44', '66', 'newCustomer@gmail.com', NULL, 2, 2, 3, NULL, 'cleanharbors@gmail.com', 1, 'DemandeFormationPersonnel'),
(10, NULL, NULL, NULL, '2018-04-29', 'for a birthday', '500', '500', 'htakouit@gmail.com', NULL, 9, 5, 19, 6, 'MultiServices@gmail.com', 2, NULL),
(11, NULL, NULL, NULL, '2018-04-29', 'my birthday', NULL, NULL, 'htakouit@gmail.com', NULL, 10, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(12, NULL, NULL, NULL, '2018-04-29', 'birthday', NULL, NULL, 'htakouit@gmail.com', NULL, 11, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(13, NULL, NULL, NULL, '2018-04-29', '', NULL, NULL, 'htakouit@gmail.com', NULL, 12, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(14, NULL, NULL, NULL, '2018-04-29', '', NULL, NULL, 'htakouit@gmail.com', NULL, 13, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(15, NULL, NULL, NULL, '2018-04-29', '', NULL, NULL, 'htakouit@gmail.com', NULL, 14, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(16, NULL, NULL, NULL, '2018-04-29', '', NULL, NULL, 'htakouit@gmail.com', NULL, 15, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(17, NULL, NULL, NULL, '2018-04-29', 'My birthday', NULL, NULL, 'htakouit@gmail.com', NULL, 16, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(18, NULL, NULL, NULL, '2018-04-29', '', NULL, NULL, 'htakouit@gmail.com', NULL, 17, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(19, NULL, NULL, NULL, '2018-04-29', '', NULL, NULL, 'htakouit@gmail.com', NULL, 18, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(20, NULL, NULL, NULL, '2018-04-29', '', NULL, NULL, 'htakouit@gmail.com', NULL, 19, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(21, NULL, NULL, NULL, '2018-04-29', '', NULL, NULL, 'htakouit@gmail.com', NULL, 20, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(22, NULL, NULL, NULL, '2018-04-29', '', '150', '150', 'htakouit@gmail.com', NULL, 21, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(23, NULL, NULL, NULL, '2018-04-29', 'My birthday', NULL, NULL, 'htakouit@gmail.com', NULL, 22, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(24, NULL, NULL, NULL, '2018-04-29', 'My birthday', '150', '150', 'htakouit@gmail.com', NULL, 23, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(25, NULL, NULL, NULL, '2018-04-30', 'nothing', '179', '179', 'htakouit@gmail.com', NULL, 24, 5, 14, 2, 'MultiServices@gmail.com', 2, NULL),
(26, NULL, NULL, NULL, '2018-04-30', 'anniversaire', '150', '150', 'htakouit@gmail.com', NULL, 25, 5, 17, 7, 'MultiServices@gmail.com', 2, NULL),
(27, NULL, NULL, NULL, '2018-05-31', 'Rien de speciale', '880', '880', 'anas.the.creator@gmail.com', NULL, 26, 3, 8, 8, 'MultiServices@gmail.com', 2, NULL),
(28, NULL, NULL, NULL, '2018-06-03', 'test location', NULL, NULL, 'anas.the.creator@gmail.com', NULL, 27, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(29, NULL, NULL, NULL, '2018-06-03', 'nothiiiiiiiiiing', NULL, NULL, 'anas.the.creator@gmail.com', NULL, 28, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(30, NULL, NULL, NULL, '2018-06-03', 'just a test', NULL, NULL, 'anas.the.creator@gmail.com', NULL, 29, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(31, NULL, NULL, NULL, '2018-06-03', 'this is just a test', NULL, NULL, 'anas.the.creator@gmail.com', NULL, 30, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(32, NULL, NULL, NULL, '2018-06-03', 'this is just a test', NULL, NULL, 'anas.the.creator@gmail.com', NULL, 31, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(33, NULL, NULL, NULL, '2018-06-03', 'this is just a test', NULL, NULL, 'anas.the.creator@gmail.com', NULL, 32, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(34, NULL, NULL, NULL, '2018-06-03', 'test test test', NULL, NULL, 'anas.the.creator@gmail.com', NULL, 33, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(35, NULL, NULL, NULL, '2018-06-03', 'testtttt', NULL, NULL, 'anas.the.creator@gmail.com', NULL, 34, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(36, NULL, NULL, NULL, '2018-06-03', 'this is just a test', '1925', '1925', 'anas.the.creator@gmail.com', NULL, 35, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(37, NULL, NULL, NULL, '2018-06-03', 'please give me the best car you have', '600', '600', 'anas.the.creator@gmail.com', NULL, 36, 3, 21, NULL, 'MultiServices@gmail.com', 2, NULL),
(38, NULL, NULL, NULL, '2018-06-04', 'nooone', '220', '220', 'anas.the.creator@gmail.com', NULL, 37, 3, 8, 8, 'MultiServices@gmail.com', 0, NULL),
(39, NULL, NULL, NULL, '2018-06-04', NULL, NULL, NULL, 'anas.the.creator@gmail.com', NULL, 38, 3, 21, NULL, NULL, NULL, NULL),
(40, NULL, NULL, NULL, '2018-06-04', NULL, '1161', '1161', 'anas.the.creator@gmail.com', NULL, 39, 3, 21, NULL, 'MultiServices@gmail.com', NULL, NULL),
(41, NULL, NULL, NULL, '2018-06-05', 'un prof bien', '750', '750', 'anas.the.creator@gmail.com', NULL, 40, 3, 22, 12, 'MultiServices@gmail.com', NULL, NULL),
(42, '2018-06-06', NULL, NULL, '2018-06-06', 'un bon teacher', '750', '750', 'anas.the.creator@gmail.com', 'benchebani', 41, 3, 22, 12, 'MultiServices@gmail.com', NULL, NULL),
(43, NULL, NULL, NULL, '2018-06-09', NULL, NULL, NULL, 'anas.the.creator@gmail.com', NULL, 42, 3, 21, NULL, NULL, NULL, NULL),
(44, '2018-06-10', NULL, NULL, '2018-06-09', NULL, NULL, NULL, 'anas.the.creator@gmail.com', 'benchebani', 43, 3, 21, NULL, NULL, NULL, NULL),
(45, NULL, NULL, NULL, '2019-03-29', NULL, NULL, NULL, 'anas.the.creator@gmail.com', NULL, 44, 3, 21, NULL, NULL, NULL, NULL),
(46, NULL, NULL, NULL, '2019-03-29', NULL, NULL, NULL, 'anas.the.creator@gmail.com', NULL, 45, 3, 21, NULL, NULL, NULL, NULL),
(47, NULL, NULL, NULL, '2019-03-29', NULL, NULL, NULL, 'htakouit@gmail.com', NULL, 46, 5, 21, NULL, NULL, NULL, NULL),
(48, NULL, NULL, NULL, '2019-03-30', 'ffffffffffff', '300', '300', 'htakouit@gmail.com', NULL, 47, 5, 1, 1, 'top.sarl@gmail.com', 2, NULL),
(49, NULL, NULL, NULL, '2019-03-30', 'ffffffffffff', '300', '300', 'htakouit@gmail.com', NULL, 48, 5, 1, 1, 'top.sarl@gmail.com', 2, NULL),
(50, NULL, NULL, NULL, '2019-03-30', 'ffffffffffff', '300', '300', 'htakouit@gmail.com', NULL, 49, 5, 1, 1, 'top.sarl@gmail.com', 2, NULL),
(51, NULL, NULL, NULL, '2019-03-30', 'juuuuuu', '450', '450', 'zouani.younes@gmail.com', NULL, 50, 2, 22, 12, NULL, NULL, NULL),
(52, NULL, NULL, NULL, '2019-04-03', NULL, '3500', '4200', 'zouani.younes@gmail.com', NULL, 51, 2, 21, NULL, NULL, NULL, NULL),
(53, '2019-04-14', NULL, NULL, '2019-04-03', NULL, '800', '960', 'zouani.younes@gmail.com', 'ysn', 52, 2, 21, NULL, NULL, NULL, NULL),
(54, '2019-04-14', NULL, NULL, '2019-04-03', NULL, '3400', '4080', 'zouani.younes@gmail.com', 'ysn', 53, 2, 21, NULL, NULL, NULL, NULL),
(55, '2019-04-14', NULL, NULL, '2019-04-03', NULL, '5600', '6720', 'zouani.younes@gmail.com', 'ysn', 54, 2, 21, NULL, NULL, NULL, NULL),
(56, '2019-04-14', NULL, NULL, '2019-04-03', NULL, '14000', '16800', 'zouani.younes@gmail.com', 'ysn', 55, 2, 21, NULL, NULL, NULL, NULL),
(57, NULL, NULL, NULL, '2019-04-06', 'walooooooooooooooooooooooooooooooooo', '450', '450', 'zouani.younes@gmail.com', NULL, 56, 2, 1, 1, 'cleanharbors@gmail.com', NULL, NULL),
(58, NULL, NULL, NULL, '2019-04-06', 'kokoooooooooooooooooo', '240', '240', 'zouani.younes@gmail.com', NULL, 57, 2, 10, 9, NULL, NULL, NULL),
(59, NULL, NULL, NULL, '2019-04-09', 'naimaa mamaaaa', '100', '100', 'zouani.younes@gmail.com', NULL, 58, 2, 1, 1, NULL, NULL, NULL),
(60, NULL, NULL, NULL, '2019-04-09', 'naimaa ftoussaa', '100', '100', 'zouani.younes@gmail.com', NULL, 59, 2, 1, 1, NULL, NULL, NULL),
(61, NULL, NULL, NULL, '2019-04-09', 'maaaaamaaaa rimaaa', '480', '480', 'zouani.younes@gmail.com', NULL, 60, 2, 10, 9, NULL, NULL, NULL),
(62, NULL, NULL, NULL, '2019-04-18', NULL, '21600', '25920', 'zouani.younes@gmail.com', NULL, 61, 2, 21, NULL, NULL, NULL, NULL),
(63, NULL, NULL, NULL, '2019-04-18', NULL, NULL, NULL, 'zouani.younes@gmail.com', NULL, 62, 2, 21, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `demandeserviceconfirmationdetail`
--

CREATE TABLE `demandeserviceconfirmationdetail` (
  `ID` bigint(20) NOT NULL,
  `DATEACTION` date DEFAULT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL,
  `MANAGER_LOGIN` varchar(255) DEFAULT NULL,
  `TYPEACTION_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demandevoiture`
--

CREATE TABLE `demandevoiture` (
  `ID` bigint(20) NOT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandevoiture`
--

INSERT INTO `demandevoiture` (`ID`, `DEMANDESERVICE_ID`) VALUES
(1, 53),
(2, 54),
(3, 55),
(4, 56),
(5, 62),
(6, 63);

-- --------------------------------------------------------

--
-- Structure de la table `demandevoitureitem`
--

CREATE TABLE `demandevoitureitem` (
  `ID` bigint(20) NOT NULL,
  `DATEDEBUT` date DEFAULT NULL,
  `DATEFIN` date DEFAULT NULL,
  `PRIX` decimal(38,0) DEFAULT NULL,
  `QUANTITE` int(11) DEFAULT NULL,
  `NBRJOUR` int(11) DEFAULT '3',
  `CARBURANT_ID` bigint(20) DEFAULT NULL,
  `DEMANDEVOITURE_ID` bigint(20) DEFAULT NULL,
  `MODELE_ID` bigint(20) DEFAULT NULL,
  `WORKER_LOGIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandevoitureitem`
--

INSERT INTO `demandevoitureitem` (`ID`, `DATEDEBUT`, `DATEFIN`, `PRIX`, `QUANTITE`, `NBRJOUR`, `CARBURANT_ID`, `DEMANDEVOITURE_ID`, `MODELE_ID`, `WORKER_LOGIN`) VALUES
(1, '2019-04-03', '2019-04-05', '200', 1, 2, NULL, 1, NULL, 'MultiServices@gmail.com'),
(2, '2019-04-03', '2019-04-05', '600', 1, 2, 1, 1, 3, 'top.sarl@gmail.com'),
(3, '2019-04-03', '2019-04-05', '1600', 2, 2, 2, 2, 4, 'zsCar@gmail.com'),
(4, '2019-04-03', '2019-04-06', '1800', 3, 3, 1, 2, 2, 'zsCar@gmail.com'),
(5, '2019-04-04', '2019-04-18', '1400', 1, 14, 1, 3, 1, 'zsCar@gmail.com'),
(6, '2019-04-04', '2019-04-18', '4200', 1, 14, 1, 3, 3, 'top.sarl@gmail.com'),
(7, '2019-04-04', '2019-04-18', '5600', 1, 14, 1, 4, 4, 'sifo@gmail.com'),
(8, '2019-04-04', '2019-04-18', '8400', 1, 14, 1, 4, 6, 'sifo@gmail.com'),
(9, '2019-04-01', '2019-04-25', '7200', 3, 24, 1, 5, 1, 'MultiServices@gmail.com'),
(10, '2019-04-01', '2019-04-25', '14400', 3, 24, 1, 5, 2, 'sifo@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `device`
--

CREATE TABLE `device` (
  `ID` bigint(20) NOT NULL,
  `BLOCKED` tinyint(1) DEFAULT '0',
  `DATECONNECTION` date DEFAULT NULL,
  `DEVICECATEGORIE` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `NAVIGATEUR` varchar(255) DEFAULT NULL,
  `OS` varchar(255) DEFAULT NULL,
  `MANAGER_LOGIN` varchar(255) DEFAULT NULL,
  `WORKER_LOGIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `device`
--

INSERT INTO `device` (`ID`, `BLOCKED`, `DATECONNECTION`, `DEVICECATEGORIE`, `IP`, `NAVIGATEUR`, `OS`, `MANAGER_LOGIN`, `WORKER_LOGIN`) VALUES
(1, 0, '2018-04-10', 'Personal computer', '172.31.20.65', 'Firefox', 'Windows', 'manager', NULL),
(2, 0, '2018-04-23', 'Personal computer', '192.168.67.2', 'Firefox', 'Windows 8.1', 'ysn', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `eventbudget`
--

CREATE TABLE `eventbudget` (
  `ID` bigint(20) NOT NULL,
  `BUDGET` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `eventbudget`
--

INSERT INTO `eventbudget` (`ID`, `BUDGET`) VALUES
(1, '100dh par personne'),
(2, '150 dh par personne');

-- --------------------------------------------------------

--
-- Structure de la table `eventtype`
--

CREATE TABLE `eventtype` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `eventtype`
--

INSERT INTO `eventtype` (`ID`, `NOM`) VALUES
(1, 'Marriage'),
(2, 'Reception'),
(3, 'Reunion'),
(4, 'Soutenance'),
(5, 'Anniversaire'),
(6, 'other');

-- --------------------------------------------------------

--
-- Structure de la table `faq`
--

CREATE TABLE `faq` (
  `ID` bigint(20) NOT NULL,
  `CORPS` varchar(1000) DEFAULT NULL,
  `TITRE` varchar(255) DEFAULT NULL,
  `SERVICE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `faq`
--

INSERT INTO `faq` (`ID`, `CORPS`, `TITRE`, `SERVICE_ID`) VALUES
(0, 'Le prix d''une voiture dépend de son modèle/ De ce fait le prix totale c''est le nombre de jours de location * prix voiture * quantité ', 'Comment on calcule le prix?', 22),
(1, 'ceci est la reponse de la question numero 1 du service nettoyage', 'question numero 1 NM', 1),
(2, 'ceci est la reponse de la question numero 2 du service nettoyage', 'question numero 2 NM', 1),
(3, 'ceci est la reponse de la question numero 1 du service peinture', 'question numero 1 Peinture', 8),
(4, 'ceci est la reponse de la question numero 2 du service peinture', 'question numero 2 Peinture', 8),
(5, 'Une fois que vous faites votre demande, un email contenant votre login et mot de passe sera envoyé à votre boite. En cas de problème avec l''email on vous contacte par WhatsUp ou par téléphone. Dans un délai maximum de 2 jours on vous contacte pour vous proposer la meilleure offre possible.', 'Comment et quand vous allez me contacter?', 22),
(6, 'Notre systéme contient une base de données des différentes agencse de location de voiture dans l''ensemble des villes du Maroc avec les reviews des clients. De ce fait on a tous les moyens pour le faire :)', 'Comment vous allez choisir la meilleure offre pour ma demande?', 22),
(7, 'Comment je vais vous payer? ', 'Vous ne payer que l''agence de location :). Une fois votre demande est traitée on vas vous spécifier l''agence choisie', 22);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `NIVEAUSCOLAIRE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `filiere`
--

INSERT INTO `filiere` (`ID`, `NOM`, `NIVEAUSCOLAIRE_ID`) VALUES
(1, 'MIPC', 7),
(2, 'MIP', 7),
(3, 'BCG', 7),
(4, 'MIPC', 8),
(5, 'MIP', 8),
(6, 'BCG', 8),
(7, 'PC', 6),
(8, 'SVT', 6),
(9, 'Sc Math A', 6),
(10, 'Sc Math B', 6),
(11, 'Sc Exp', 5),
(12, 'Sc Math', 5),
(13, 'Sciences', 4);

-- --------------------------------------------------------

--
-- Structure de la table `formateurjob`
--

CREATE TABLE `formateurjob` (
  `ID` bigint(20) NOT NULL,
  `FORMATIONPROSUBTYPE_ID` bigint(20) DEFAULT NULL,
  `WORKER_LOGIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `formationprosubtype`
--

CREATE TABLE `formationprosubtype` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `FORMATIONPROTYPE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `formationprotype`
--

CREATE TABLE `formationprotype` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gardeningtype`
--

CREATE TABLE `gardeningtype` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `handymantype`
--

CREATE TABLE `handymantype` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `handymantype`
--

INSERT INTO `handymantype` (`ID`, `NOM`) VALUES
(1, 'electricite'),
(2, 'fourniture'),
(3, 'nettoyageClim'),
(4, 'rideaux'),
(5, 'plomberie'),
(6, 'AC Installation'),
(7, 'AC Repair');

-- --------------------------------------------------------

--
-- Structure de la table `home`
--

CREATE TABLE `home` (
  `ID` bigint(20) NOT NULL,
  `NOMBREPIECES` int(11) DEFAULT NULL,
  `HOMETYPE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `hometype`
--

CREATE TABLE `hometype` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `manager`
--

CREATE TABLE `manager` (
  `LOGIN` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `BLOCKED` tinyint(1) DEFAULT '0',
  `NOM` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `NBRCNX` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `manager`
--

INSERT INTO `manager` (`LOGIN`, `PASSWORD`, `BLOCKED`, `NOM`, `PHONE`, `PRENOM`, `NBRCNX`) VALUES
('benchebani', 'fcf14adafc27930476d5ae13443d9ef6d4689b4fc8f2811daba6615c6c6109c0', 0, 'benchebani', '0630247385', 'mohamed anas', 0),
('manager', '6ee4a469cd4e91053847f5d3fcb61dbcc91e8f0ef10be7748da4c4a1ba382d17', 0, '', '', '', 0),
('ysn', '61a278646d8a0b25eb0ac6661b05f345a478eeb5d3a88cdc5ab99d306ef55aae', 0, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `FILIERE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`ID`, `NOM`, `FILIERE_ID`) VALUES
(1, 'Math', 7),
(2, 'PC', 7),
(3, 'SVT', 7),
(4, 'Analyse', 1),
(5, 'Algebre', 1),
(6, 'Mecanique', 1),
(7, 'Chimie', 1);

-- --------------------------------------------------------

--
-- Structure de la table `menuformulaire`
--

CREATE TABLE `menuformulaire` (
  `ID` bigint(20) NOT NULL,
  `COMPANYTAB` tinyint(1) DEFAULT '0',
  `DETAILSTAB` tinyint(1) DEFAULT '0',
  `IMAGENAME` varchar(255) DEFAULT NULL,
  `INFOTAB` tinyint(1) DEFAULT '0',
  `PAYEMENTTAB` tinyint(1) DEFAULT '0',
  `SUMMARYTAB` tinyint(1) DEFAULT '0',
  `SERVICE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `menuformulaire`
--

INSERT INTO `menuformulaire` (`ID`, `COMPANYTAB`, `DETAILSTAB`, `IMAGENAME`, `INFOTAB`, `PAYEMENTTAB`, `SUMMARYTAB`, `SERVICE_ID`) VALUES
(1, 0, 1, 'nettoyageMaison', 1, 1, 0, 1),
(2, 0, 1, 'photographie', 1, 1, 0, 19),
(3, 0, 1, 'LocationVoiture', 1, 1, 0, 21),
(4, 0, 1, 'formationpersonnel', 1, 1, 0, 22),
(5, 0, 1, 'nan', 1, 1, 0, 17),
(6, 0, 1, 'deratisation', 0, 1, 0, 14),
(7, 0, 1, 'demenagement', 1, 1, 0, 5),
(8, 0, 1, 'peinture', 1, 1, 0, 8),
(9, 0, 1, 'plomberie', 1, 1, 0, 11),
(10, 0, 1, 'electricite', 1, 1, 0, 10),
(11, 0, 1, 'menuiserie', 1, 1, 0, 12);

-- --------------------------------------------------------

--
-- Structure de la table `niveauscolaire`
--

CREATE TABLE `niveauscolaire` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `niveauscolaire`
--

INSERT INTO `niveauscolaire` (`ID`, `NOM`) VALUES
(1, '1ère année College'),
(2, '2ème année College'),
(3, '3ème année College'),
(4, 'Tronc Commun'),
(5, '1ère année Bac'),
(6, '2ème année Bac'),
(7, '1ère année Universitaire'),
(8, '2ème année Universitaire');

-- --------------------------------------------------------

--
-- Structure de la table `packaging`
--

CREATE TABLE `packaging` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SERVICE_ID` bigint(20) DEFAULT NULL,
  `SERVICEPRICING_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `packaging`
--

INSERT INTO `packaging` (`ID`, `NAME`, `SERVICE_ID`, `SERVICEPRICING_ID`) VALUES
(1, 'cockroaches ', 14, 2),
(2, 'cockroaches ', 14, 3),
(3, 'cockroaches ', 14, 4),
(4, 'cockroaches ', 14, 4),
(5, 'bed bugs', 14, 2),
(6, 'bed bugs', 14, 3),
(7, 'bed bugs', 14, 3),
(8, 'bed bugs', 14, 5),
(9, 'ants ', 14, 2),
(10, 'ants ', 14, 3),
(11, 'ants ', 14, 4),
(12, 'ants ', 14, 5);

-- --------------------------------------------------------

--
-- Structure de la table `paintingtype`
--

CREATE TABLE `paintingtype` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TVA` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`ID`, `NAME`, `TVA`) VALUES
(1, 'Morocco', '20'),
(2, 'Spain', '30');

-- --------------------------------------------------------

--
-- Structure de la table `pestcontroltype`
--

CREATE TABLE `pestcontroltype` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `pestcontroltype`
--

INSERT INTO `pestcontroltype` (`ID`, `NOM`) VALUES
(1, 'cockroaches'),
(2, 'bed bugs'),
(3, 'ants'),
(4, 'general');

-- --------------------------------------------------------

--
-- Structure de la table `photographietype`
--

CREATE TABLE `photographietype` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `photographietype`
--

INSERT INTO `photographietype` (`ID`, `NOM`) VALUES
(1, 'Marriage'),
(2, 'Shooting');

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE `planning` (
  `ID` bigint(20) NOT NULL,
  `DATEDEBUT` date DEFAULT NULL,
  `DATEFIN` date DEFAULT NULL,
  `DATEONCE` date DEFAULT NULL,
  `TIMING_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `planning`
--

INSERT INTO `planning` (`ID`, `DATEDEBUT`, `DATEFIN`, `DATEONCE`, `TIMING_ID`) VALUES
(1, '2018-04-18', '2018-08-31', NULL, NULL),
(2, NULL, NULL, '2018-05-24', 1),
(3, '2018-07-25', '2018-11-29', NULL, NULL),
(4, '2018-03-23', '2019-02-20', NULL, NULL),
(5, NULL, NULL, '2018-03-31', 13),
(6, '2018-03-08', '2018-09-21', NULL, NULL),
(7, '2018-03-14', '2018-03-24', NULL, NULL),
(8, NULL, NULL, '2018-03-31', 5),
(9, NULL, NULL, '2018-05-01', 5),
(10, NULL, NULL, '2018-05-02', 1),
(11, NULL, NULL, '2018-05-01', 1),
(12, NULL, NULL, '2018-04-11', 4),
(13, NULL, NULL, NULL, NULL),
(14, NULL, NULL, NULL, NULL),
(15, NULL, NULL, NULL, NULL),
(16, NULL, NULL, '2018-05-02', 1),
(17, NULL, NULL, NULL, NULL),
(18, NULL, NULL, '2018-05-16', 1),
(19, NULL, NULL, '2018-04-30', 3),
(20, NULL, NULL, NULL, NULL),
(21, NULL, NULL, NULL, NULL),
(22, NULL, NULL, '2018-05-02', NULL),
(23, NULL, NULL, '2018-05-02', 2),
(24, NULL, NULL, NULL, NULL),
(25, NULL, NULL, '2018-05-02', 19),
(26, NULL, NULL, '2018-05-31', 15),
(27, '2018-06-03', '2018-06-10', NULL, NULL),
(28, '2018-06-03', '2018-06-10', NULL, NULL),
(29, '2018-06-03', '2018-06-21', NULL, NULL),
(30, '2018-06-14', '2018-06-20', NULL, NULL),
(31, '2018-06-16', '2018-06-20', NULL, NULL),
(32, '2018-06-16', '2018-06-20', NULL, NULL),
(33, '2018-06-15', '2018-06-20', NULL, NULL),
(34, '2018-06-16', '2018-06-23', NULL, NULL),
(35, '2018-06-03', '2018-06-10', NULL, NULL),
(36, '2018-06-03', '2018-06-05', NULL, NULL),
(37, NULL, NULL, '2018-06-07', 2),
(38, NULL, NULL, NULL, NULL),
(39, '2018-06-14', '2018-06-18', NULL, NULL),
(40, NULL, NULL, NULL, NULL),
(41, NULL, NULL, '2018-06-22', 3),
(42, NULL, NULL, NULL, NULL),
(43, NULL, NULL, NULL, NULL),
(44, NULL, NULL, NULL, NULL),
(45, NULL, NULL, NULL, NULL),
(46, NULL, NULL, NULL, NULL),
(47, NULL, NULL, NULL, NULL),
(48, NULL, NULL, NULL, NULL),
(49, NULL, NULL, NULL, NULL),
(50, NULL, NULL, '2019-03-12', 2),
(51, NULL, NULL, NULL, NULL),
(52, NULL, NULL, NULL, NULL),
(53, NULL, NULL, NULL, NULL),
(54, NULL, NULL, NULL, NULL),
(55, NULL, NULL, NULL, NULL),
(56, NULL, NULL, NULL, NULL),
(57, NULL, NULL, NULL, NULL),
(58, NULL, NULL, NULL, NULL),
(59, NULL, NULL, NULL, NULL),
(60, NULL, NULL, NULL, NULL),
(61, NULL, NULL, NULL, NULL),
(62, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `planningitem`
--

CREATE TABLE `planningitem` (
  `ID` bigint(20) NOT NULL,
  `NUMEROJOUR` int(11) DEFAULT NULL,
  `REPETITION` int(11) DEFAULT NULL,
  `DAY_ID` bigint(20) DEFAULT NULL,
  `PLANNING_ID` bigint(20) DEFAULT NULL,
  `TIMING_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `planningitem`
--

INSERT INTO `planningitem` (`ID`, `NUMEROJOUR`, `REPETITION`, `DAY_ID`, `PLANNING_ID`, `TIMING_ID`) VALUES
(1, 0, 1, 1, 6, 1),
(2, 0, 1, 3, 1, 5),
(3, 3, 2, NULL, 1, 9),
(4, 1, 2, NULL, 3, 15),
(5, 0, 1, 5, 3, 13),
(51, 7, 2, 1, 4, 1),
(52, 0, 1, 2, 4, 5),
(101, 0, 1, 1, 6, 1),
(151, 5, 2, NULL, 7, 1),
(152, 0, 1, 5, 7, 9);

-- --------------------------------------------------------

--
-- Structure de la table `profjob`
--

CREATE TABLE `profjob` (
  `ID` bigint(20) NOT NULL,
  `MATIERE_ID` bigint(20) DEFAULT NULL,
  `WORKER_EMAIL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `ID` bigint(20) NOT NULL,
  `CORPS` varchar(255) DEFAULT NULL,
  `DATEREVIEW` date DEFAULT NULL,
  `STARS` int(11) DEFAULT NULL,
  `SUJET` varchar(255) DEFAULT NULL,
  `WORKER_LOGIN` varchar(255) DEFAULT NULL,
  `CLIENT_EMAIL` varchar(255) DEFAULT NULL,
  `DEMANDESERVICE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `review`
--

INSERT INTO `review` (`ID`, `CORPS`, `DATEREVIEW`, `STARS`, `SUJET`, `WORKER_LOGIN`, `CLIENT_EMAIL`, `DEMANDESERVICE_ID`) VALUES
(1, 'cgenial', '2018-05-16', 4, 'Service magnifique', 'cleanharbors@gmail.com', 'anas.the.creator@gmail.com', 1),
(2, 'service tres rapide est professionnelle  mailleurs experience', '2018-05-23', 5, 'Service profesionnelle', 'cleanharbors@gmail.com', 'htakouit@gmail.com', 3),
(4, 'test commantaire ', '2018-05-30', 5, 'bon service', 'MultiServices@gmail.com', 'htakouit@gmail.com', 10),
(5, 'apreciet le service ', '2018-06-03', 4, 'etat extraordinaire', 'MultiServices@gmail.com', 'anas.the.creator@gmail.com', 37);

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `VILLE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `secteur`
--

INSERT INTO `secteur` (`ID`, `NOM`, `VILLE_ID`) VALUES
(1, 'Gueliz', 1),
(2, 'Daoudiate', 1),
(3, 'Massira', 1),
(4, 'Barnoussi', 2),
(5, 'Hay Hassani', 2),
(6, 'Mediouna', 2),
(7, 'Alonso Martínez', 3),
(8, 'Las Cortes', 3),
(9, 'Sant Martí', 4),
(10, 'Eixample', 4),
(11, 'Sidi Youssef', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '0');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `CATEGORIE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`ID`, `NOM`, `CATEGORIE_ID`) VALUES
(1, 'nettoyageMaison', 1),
(2, 'Nettoyage Complet', 1),
(3, 'Nettoyage Piscine', 1),
(4, 'Nettoyage Divers', 1),
(5, 'demenagement', 2),
(6, 'Demenagement international', 2),
(7, 'Stockage', 2),
(8, 'peinture', 3),
(9, 'Handyman', 3),
(10, 'electricite', 3),
(11, 'plomberie', 3),
(12, 'menuiserie', 3),
(13, 'Climatisation', 3),
(14, 'deratisation', 4),
(15, 'Gardiennage', 4),
(16, 'Restauration', 5),
(17, 'traiteur', 5),
(18, 'Babysitters', 6),
(19, 'photographie', 7),
(20, 'Videographie', 7),
(21, 'locationvoiture', 8),
(22, 'formationpersonnel', 9);

-- --------------------------------------------------------

--
-- Structure de la table `servicepricing`
--

CREATE TABLE `servicepricing` (
  `ID` bigint(20) NOT NULL,
  `DATEAPPLICATION` date DEFAULT NULL,
  `PRIX` decimal(38,0) DEFAULT NULL,
  `SERVICE_ID` bigint(20) DEFAULT NULL,
  `UNITE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `servicepricing`
--

INSERT INTO `servicepricing` (`ID`, `DATEAPPLICATION`, `PRIX`, `SERVICE_ID`, `UNITE_ID`) VALUES
(1, '2015-03-03', '50', 1, 1),
(2, '2018-03-01', '179', 14, 2),
(3, '2018-03-01', '300', 14, 3),
(4, '2018-03-01', '200', 14, 5),
(5, '2018-03-01', '370', 14, 4),
(6, '2018-04-29', '500', 19, 6),
(7, '2018-04-29', '150', 17, 7),
(8, '2017-05-23', '220', 8, 8),
(9, '2017-05-23', '120', 10, 8),
(10, '2017-06-18', '150', 11, 8),
(11, '2017-06-18', '120', 12, 8),
(12, '2016-06-13', '150', 22, 10);

-- --------------------------------------------------------

--
-- Structure de la table `serviceville`
--

CREATE TABLE `serviceville` (
  `ID` bigint(20) NOT NULL,
  `SERVICE_ID` bigint(20) DEFAULT NULL,
  `VILLE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `serviceville`
--

INSERT INTO `serviceville` (`ID`, `SERVICE_ID`, `VILLE_ID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 5, 1),
(4, 7, 1),
(5, 8, 1),
(6, 9, 1),
(7, 13, 1),
(8, 16, 1),
(9, 5, 2),
(10, 12, 2),
(11, 19, 2),
(12, 10, 2),
(13, 17, 2),
(14, 18, 2),
(15, 16, 2),
(17, 6, 3),
(18, 5, 3),
(19, 6, 4),
(20, 5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `supplementdemandeevent`
--

CREATE TABLE `supplementdemandeevent` (
  `ID` bigint(20) NOT NULL,
  `DEMANDEEVENT_ID` bigint(20) DEFAULT NULL,
  `SUPPLEMENTEVENT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `supplementdemandeevent`
--

INSERT INTO `supplementdemandeevent` (`ID`, `DEMANDEEVENT_ID`, `SUPPLEMENTEVENT_ID`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 2, 2),
(4, 3, 2),
(5, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `supplementevent`
--

CREATE TABLE `supplementevent` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `supplementevent`
--

INSERT INTO `supplementevent` (`ID`, `NOM`) VALUES
(1, 'Serveurs'),
(2, 'Tables et fournitures'),
(3, 'Decoration');

-- --------------------------------------------------------

--
-- Structure de la table `timing`
--

CREATE TABLE `timing` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALEUR` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `timing`
--

INSERT INTO `timing` (`ID`, `NAME`, `VALEUR`) VALUES
(1, '08:00', '8'),
(2, '08:30', '8'),
(3, '09:00', '9'),
(4, '09:30', '9'),
(5, '10:00', '10'),
(6, '10:30', '10'),
(7, '11:00', '11'),
(8, '11:30', '11'),
(9, '12:00', '12'),
(10, '12:30', '12'),
(11, '13:00', '13'),
(12, '13:30', '13'),
(13, '14:00', '14'),
(14, '14:30', '14'),
(15, '15:00', '15'),
(16, '15:30', '15'),
(17, '16:00', '16'),
(18, '16:30', '16'),
(19, '17:00', '17');

-- --------------------------------------------------------

--
-- Structure de la table `typeaction`
--

CREATE TABLE `typeaction` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typeaction`
--

INSERT INTO `typeaction` (`ID`, `NAME`) VALUES
(1, 'Confirmation'),
(2, 'Suppression');

-- --------------------------------------------------------

--
-- Structure de la table `typedemande`
--

CREATE TABLE `typedemande` (
  `ID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typedemande`
--

INSERT INTO `typedemande` (`ID`) VALUES
('DemandeBabySitting'),
('DemandeCleaning'),
('DemandeEvent'),
('DemandeFormationPersonnel'),
('DemandeGardening'),
('DemandeHandyMan'),
('DemandeMoving'),
('DemandePainting'),
('DemandePestControl'),
('DemandePhotographie'),
('DemandeVoiture');

-- --------------------------------------------------------

--
-- Structure de la table `unite`
--

CREATE TABLE `unite` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `unite`
--

INSERT INTO `unite` (`ID`, `NAME`) VALUES
(1, 'CleanerPerHour'),
(2, 'Studio'),
(3, '1 BR'),
(4, '2 BR'),
(5, '3 BR'),
(6, 'PhotographiePerHour'),
(7, 'EventPerHour'),
(8, 'HandyManPerHour'),
(9, 'VoitureParJour'),
(10, 'FormationParPersonne');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PAYS_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`ID`, `NOM`, `PAYS_ID`) VALUES
(1, 'Marrakesh', 1),
(2, 'Casablanca', 1),
(3, 'Madrid', 2),
(4, 'Barcelona', 2),
(5, 'Laayoune', 1),
(6, 'Dakhla', 1),
(7, 'Tanger', 1),
(8, 'Tafaya', 1),
(9, 'Boujdour', 1),
(10, 'TanTan', 1),
(11, 'Sidi Ifni', 1),
(12, 'Guelmim', 1),
(13, 'Essmara', 1),
(14, 'Tiznit', 1),
(15, 'Agadir', 1);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE `voiture` (
  `ID` bigint(20) NOT NULL,
  `QUANTITE` int(11) DEFAULT NULL,
  `CARBURANT_ID` bigint(20) DEFAULT NULL,
  `WORKER_LOGIN` varchar(255) DEFAULT NULL,
  `MODELE_ID` bigint(20) DEFAULT NULL,
  `PRIX` decimal(38,2) NOT NULL DEFAULT '0.00',
  `NOMBREPLACE` int(2) NOT NULL,
  `RATTING` decimal(2,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `voiture`
--

INSERT INTO `voiture` (`ID`, `QUANTITE`, `CARBURANT_ID`, `WORKER_LOGIN`, `MODELE_ID`, `PRIX`, `NOMBREPLACE`, `RATTING`) VALUES
(1, 2, 1, 'MultiServices@gmail.com', 1, '0.00', 0, '0.00'),
(2, 4, 2, 'MultiServices@gmail.com', 2, '0.00', 0, '0.00'),
(3, 1, 1, 'MultiServices@gmail.com', 3, '0.00', 0, '0.00'),
(4, 1, 2, 'MultiServices@gmail.com', 3, '0.00', 0, '0.00'),
(5, 2, 2, 'top.sarl@gmail.com', 5, '0.00', 0, '0.00'),
(6, 0, 2, 'zouani.younes@gmail.com', 1, '200.00', 0, '0.00'),
(7, 0, 1, 'zouani.younes@gmail.com', 3, '600.00', 0, '0.00'),
(8, 0, 1, 'zsCar@gmail.com', 1, '33.00', 0, '0.00'),
(9, 0, 2, 'zsCar@gmail.com', 3, '99.00', 0, '0.00'),
(11, 30, 2, 'sifo@gmail.com', 5, '22.00', 0, '0.00'),
(12, 600, 1, 'sifo@gmail.com', 2, '111.00', 0, '0.00'),
(13, 0, 2, 'kokogmail.com', 1, '344.00', 0, '0.00'),
(14, 0, 1, 'kokogmail.com', 3, '777.00', 0, '0.00'),
(15, 0, 2, 'kokogmail.com', 1, '100.00', 0, '0.00'),
(16, 0, 2, 'kokogmail.com', 2, '200.00', 0, '0.00'),
(17, 0, 1, 'kokogmail.com', 5, '300.00', 0, '0.00'),
(18, 0, 1, 'kokogmail.com', 5, '300.00', 0, '0.00'),
(19, 0, 1, 'kokogmail.com', 6, '5222.00', 0, '0.00'),
(20, 0, 1, 'sifo@gmail.com', 7, '300.00', 0, '0.00'),
(21, 55, 2, 'sifo@gmail.com', 1, '34.00', 0, '0.00'),
(22, 4, 2, 'sifo@gmail.com', 7, '333.00', 0, '0.00');

-- --------------------------------------------------------

--
-- Structure de la table `voiturecarburantcouleur`
--

CREATE TABLE `voiturecarburantcouleur` (
  `ID` bigint(20) NOT NULL,
  `CARBURANT_ID` bigint(20) DEFAULT NULL,
  `COULEUR_ID` bigint(20) DEFAULT NULL,
  `VOITURE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `voiturecarburantcouleur`
--

INSERT INTO `voiturecarburantcouleur` (`ID`, `CARBURANT_ID`, `COULEUR_ID`, `VOITURE_ID`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 1, 4, 3),
(4, 2, 3, 4),
(5, 2, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `voitureimage`
--

CREATE TABLE `voitureimage` (
  `ID` bigint(20) NOT NULL,
  `IMAGE` varchar(255) DEFAULT NULL,
  `VOITURE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `voituremarque`
--

CREATE TABLE `voituremarque` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `voituremarque`
--

INSERT INTO `voituremarque` (`ID`, `NOM`) VALUES
(1, 'Abarth'),
(2, 'Alfa Romeo'),
(3, 'Aston Martin'),
(4, 'Audi'),
(5, 'Bentley'),
(6, 'BMW'),
(7, 'Citroen'),
(8, 'Dacia'),
(9, 'DS'),
(10, 'Ferrari'),
(11, 'Fiat'),
(12, 'Ford'),
(13, 'Honda'),
(14, 'Hyundai'),
(15, 'Infiniti'),
(16, 'Jaguar'),
(17, 'Jeep'),
(18, 'KIA'),
(19, 'Lada'),
(20, 'Lamborghini'),
(21, 'Land Rover'),
(22, 'Lexus'),
(24, 'Lotus'),
(25, 'Maserati'),
(26, 'Mazda'),
(27, 'McLaren'),
(28, 'Mercedes'),
(29, 'MINI'),
(30, 'Mitsubishi'),
(31, 'Nissan'),
(32, 'Opel'),
(33, 'Peugeot'),
(34, 'Porsche'),
(35, 'Renault'),
(36, 'Rolls Royce'),
(37, 'Seat'),
(38, 'Skoda'),
(39, 'Smart'),
(40, 'SsangYong'),
(41, 'Subaru'),
(42, 'Suzuki'),
(43, 'Tesla'),
(44, 'Toyota'),
(45, 'Volkswagen'),
(46, 'Volvo');

-- --------------------------------------------------------

--
-- Structure de la table `voituremodele`
--

CREATE TABLE `voituremodele` (
  `ID` bigint(20) NOT NULL,
  `ANNEE` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `MARQUE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `voituremodele`
--

INSERT INTO `voituremodele` (`ID`, `ANNEE`, `NOM`, `MARQUE_ID`) VALUES
(1, '2016', 'Clio', 35),
(2, '2014', 'Fluence', 35),
(3, '2015', 'MÃ©gane', 35),
(4, '2016', 'Fiesta', 12),
(5, '2017', 'Focus', 12),
(6, '2014', 'Kuga', 12),
(7, '2010', 'Dacia Loan', 8),
(8, '2019', 'C220', 28),
(11, '2019', 'Giulia', 2),
(12, '2019', 'Giulietta', 2),
(13, '2019', 'Mito', 2),
(14, '2019', 'Stelvio', 2),
(15, '2019', 'A1', 4),
(16, '2019', 'A3', 4),
(17, '2019', 'A4', 4),
(18, '2019', 'A4 Allroad', 4),
(19, '2019', 'A5', 4),
(20, '2019', 'A6', 4),
(21, '2019', 'A7', 4),
(22, '2019', 'A8', 4),
(23, '2019', 'E-tron', 4),
(24, '2019', 'Q2', 4),
(25, '2019', 'Q3', 4),
(26, '2019', 'Q4', 4),
(27, '2019', 'Q5', 4),
(28, '2019', 'Q7', 4),
(29, '2019', 'Q8', 4),
(30, '2019', 'S1', 4),
(31, '2019', 'S3', 4),
(32, '2019', 'S6', 4),
(33, '2019', 'I3', 6),
(34, '2019', 'I8', 6),
(35, '2019', 'Serie 1', 6),
(36, '2019', 'Serie 2', 6),
(37, '2019', 'Serie 3', 6),
(38, '2019', 'Serie 3 Gt', 6),
(39, '2019', 'Serie 4', 6),
(40, '2019', 'Serie 5', 6),
(41, '2019', 'Serie 6', 6),
(42, '2019', 'Serie 7', 6),
(43, '2019', 'Serie 8', 6),
(44, '2019', 'X1', 6),
(45, '2019', 'X2', 6),
(46, '2019', 'X3', 6),
(47, '2019', 'X4', 6),
(48, '2019', 'X5', 6),
(49, '2019', 'X6', 6),
(50, '2019', 'X7', 6),
(51, '2019', 'Berlingo', 7),
(52, '2019', 'Burton', 7),
(53, '2019', 'C-elysee', 7),
(54, '2019', 'C-zero', 7),
(55, '2019', 'C1', 7),
(56, '2019', 'C3', 7),
(57, '2019', 'C3 Aircross', 7),
(58, '2019', 'C4 Cactus', 7),
(59, '2019', 'C4 Spacetourer', 7),
(60, '2019', 'C5 Aircross', 7),
(61, '2019', 'C4', 7),
(62, '2019', 'C4 Aircross', 7),
(63, '2019', 'Dokker', 8),
(64, '2019', 'Duster', 8),
(65, '2019', 'Lodgy', 8),
(66, '2019', 'Logan', 8),
(67, '2019', 'Sandero', 8),
(68, '2019', '488', 10),
(69, '2019', '812', 10),
(70, '2019', ' Gtc4', 10),
(71, '2019', 'Gtc4 Lusso', 10),
(72, '2019', 'Laferrari', 10),
(73, '2019', 'Monza', 10),
(74, '2019', 'Portofino', 10),
(75, '2019', '124', 11),
(76, '2019', '500 ', 11),
(77, '2019', '500 L', 11),
(78, '2019', '500 X', 11),
(79, '2019', 'Brava', 11),
(80, '2019', 'Doblo', 11),
(81, '2019', 'Doblo Cargo', 11),
(82, '2019', 'Ducato', 11),
(83, '2019', 'Fiorino', 11),
(84, '2019', 'Fullback', 11),
(85, '2019', 'Panda', 11),
(86, '2019', 'Punto', 11),
(87, '2019', 'Qubo', 11),
(88, '2019', 'Talento', 11),
(89, '2019', 'Tipo', 11),
(90, '2019', 'C-max', 12),
(91, '2019', 'Ecosport', 12),
(92, '2019', 'Edge', 12),
(93, '2019', 'Explorer', 12),
(94, '2019', 'F150', 12),
(95, '2019', 'Fiesta', 12),
(96, '2019', 'Focus', 12),
(97, '2019', 'Galaxy', 12),
(98, '2019', 'Grand C-max', 12),
(99, '2019', 'Grand Tourneo Connect', 12),
(100, '2019', 'Gt', 12),
(101, '2019', 'Ka', 12),
(102, '2019', 'Ka+', 12),
(103, '2019', 'Kuga', 12),
(104, '2019', 'Mondeo', 12),
(105, '2019', 'Mustang', 12),
(106, '2019', 'Ranger', 12),
(107, '2019', 'S-max', 12),
(108, '2019', 'Tourneo', 12),
(109, '2019', 'Tourneo Connect', 12),
(110, '2019', 'Tourneo Courier', 12),
(111, '2019', 'Tourneo Custom', 12),
(112, '2019', 'Transit', 12),
(113, '2019', 'Transit Connect', 12),
(114, '2019', 'Transit Courier', 12),
(115, '2019', 'Transit Custom', 12),
(116, '2019', 'Accord', 13),
(117, '2019', 'Civic', 13),
(118, '2019', 'CR-V', 13),
(119, '2019', 'HR-V', 13),
(120, '2019', 'Jazz', 13),
(121, '2019', 'NSX', 13),
(122, '2019', 'Grand Santa Fe', 14),
(123, '2019', 'I 10', 14),
(124, '2019', 'I 20', 14),
(125, '2019', 'I 30', 14),
(126, '2019', 'I 40', 14),
(127, '2019', 'Ioniq', 14),
(128, '2019', 'Kona', 14),
(129, '2019', 'Kona', 14),
(130, '2019', 'Nexo', 14),
(131, '2019', 'Santa Fe', 14),
(132, '2019', 'Tucson', 14),
(133, '2019', 'E-pace', 16),
(134, '2019', 'F-pace', 16),
(135, '2019', 'I-pace', 16),
(136, '2019', 'Xe', 16),
(137, '2019', 'Xf', 16),
(138, '2019', 'Xj', 16),
(139, '2019', 'Cherokee', 17),
(140, '2019', 'Compass', 17),
(141, '2019', 'Grand Cherokee', 17),
(142, '2019', 'Renegade', 17),
(143, '2019', 'Wrangler', 17),
(144, '2019', 'Cee D', 18),
(145, '2019', 'Ceed', 18),
(146, '2019', 'E-niro', 18),
(147, '2019', 'E-soul', 18),
(148, '2019', 'Niro', 18),
(149, '2019', 'Optima', 18),
(150, '2019', 'Picanto', 18),
(151, '2019', 'Proceed', 18),
(152, '2019', 'Rio', 18),
(153, '2019', 'Sorento', 18),
(154, '2019', 'Soul', 18),
(155, '2019', 'Sportage', 18),
(156, '2019', 'Stinger', 18),
(157, '2019', 'Stonic', 18),
(158, '2019', 'Aventador', 20),
(159, '2019', 'Centenario', 20),
(160, '2019', 'Huracan', 20),
(161, '2019', 'Urus', 20),
(162, '2019', 'Defender', 21),
(163, '2019', 'Discovery', 21),
(164, '2019', 'Discovery Sport', 21),
(165, '2019', 'Range Rover', 21),
(166, '2019', 'Range Rover Evoque', 21),
(167, '2019', 'Range Rover Sport', 21),
(168, '2019', 'Range Rover Velar', 21),
(169, '2019', 'Ct', 22),
(170, '2019', 'Es', 22),
(171, '2019', 'Gs', 22),
(172, '2019', 'Is', 22),
(173, '2019', 'Lc', 22),
(174, '2019', 'Ls', 22),
(175, '2019', 'Nx', 22),
(176, '2019', 'Rc', 22),
(177, '2019', 'Rx', 22),
(178, '2019', 'Ux', 22),
(179, '2019', '3-eleven', 24),
(180, '2019', 'Elise', 24),
(181, '2019', 'Elite', 24),
(182, '2019', 'Esprit', 24),
(183, '2019', 'Evora', 24),
(184, '2019', 'Exige', 24),
(185, '2019', 'Ghibli', 25),
(186, '2019', 'Grancabrio', 25),
(187, '2019', 'Granturismo', 25),
(188, '2019', 'Levante', 25),
(189, '2019', 'Quattroporte', 25),
(190, '2019', '2', 26),
(191, '2019', '3', 26),
(192, '2019', '6', 26),
(193, '2019', 'Cx-3', 26),
(194, '2019', 'Cx-5', 26),
(195, '2019', 'Mx5', 26),
(196, '2019', '540c', 27),
(197, '2019', '570gt', 27),
(198, '2019', '570s', 27),
(199, '2019', '675 Lt', 27),
(200, '2019', '720s', 27),
(201, '2019', 'Mp4-12c', 27),
(202, '2019', 'P1', 27),
(203, '2019', 'Citan', 28),
(204, '2019', 'Cla', 28),
(205, '2019', 'Classe A', 28),
(206, '2019', 'Classe B', 28),
(207, '2019', 'Classe C', 28),
(208, '2019', 'Cls', 28),
(209, '2019', 'Classe E', 28),
(210, '2019', 'Classe G', 28),
(211, '2019', 'Classe S', 28),
(212, '2019', 'Classe V', 28),
(213, '2019', 'Classe X', 28),
(214, '2019', 'Gla', 28),
(215, '2019', 'Glb', 28),
(216, '2019', 'Glc', 28),
(217, '2019', 'Glc Coupe', 28),
(218, '2019', 'Gle', 28),
(219, '2019', 'Gle Coupe', 28),
(220, '2019', 'Gls', 28),
(221, '2019', 'Marco Polo', 28),
(222, '2019', 'SI', 28),
(223, '2019', 'SIc', 28),
(224, '2019', 'SIs', 28),
(225, '2019', 'Sprinter', 28),
(226, '2019', 'Vito', 28),
(227, '2019', 'Countryman', 29),
(228, '2019', 'Mini', 29),
(229, '2019', 'Mini Cabriolet', 29),
(230, '2019', 'Mini Clubman', 29),
(231, '2019', 'Paceman', 29),
(232, '2019', 'Asx', 30),
(233, '2019', 'Eclipse', 30),
(234, '2019', 'Eclipse Cross', 30),
(235, '2019', 'L200', 30),
(236, '2019', 'Mirage', 30),
(237, '2019', 'Outlander', 30),
(238, '2019', 'Pajero', 30),
(239, '2019', 'Space Star', 30),
(240, '2019', '370z', 31),
(241, '2019', 'Cabstar', 31),
(242, '2019', 'Evalia', 31),
(243, '2019', 'Gt-r', 31),
(244, '2019', 'Juke', 31),
(245, '2019', 'Leaf', 31),
(246, '2019', 'Micra', 31),
(247, '2019', 'Navara', 31),
(248, '2019', 'Np300 Navara', 31),
(249, '2019', 'Nt400 Cabstar', 31),
(250, '2019', 'Nt500', 31),
(251, '2019', 'Nv200', 31),
(252, '2019', 'Nv300', 31),
(253, '2019', 'Nv400', 31),
(254, '2019', 'Pulsar', 31),
(255, '2019', 'Qashqai', 31),
(256, '2019', 'X-trail', 31),
(257, '2019', 'Adam', 32),
(258, '2019', 'Ampera-e', 32),
(259, '2019', 'Astra', 32),
(260, '2019', 'Combo Cargo', 32),
(261, '2019', 'Combo Life', 32),
(262, '2019', 'Corsa', 32),
(263, '2019', 'Crossland X', 32),
(264, '2019', 'Grandland X', 32),
(265, '2019', 'Insignia', 32),
(266, '2019', 'Karl', 32),
(267, '2019', 'Mokka X', 32),
(268, '2019', 'Movano', 32),
(269, '2019', 'Vivaro', 32),
(270, '2019', 'Zafira', 32),
(271, '2019', 'Zafira Life', 32),
(272, '2019', 'Zafira Tourer', 32),
(273, '2019', '108', 33),
(274, '2019', '2008', 33),
(275, '2019', '208', 33),
(276, '2019', '3008', 33),
(277, '2019', '301', 33),
(278, '2019', '308', 33),
(279, '2019', '5008', 33),
(280, '2019', '508', 33),
(281, '2019', 'Boxer', 33),
(282, '2019', 'Expert', 33),
(283, '2019', 'Expert Tepee', 33),
(284, '2019', 'Ion', 33),
(285, '2019', 'Partner', 33),
(286, 'Rifter', '2019', 33),
(287, '2019', 'Traveller', 33),
(288, '2019', '718', 34),
(289, '2019', '911', 34),
(290, '2019', 'Boxster', 34),
(291, '2019', 'Cayenne', 34),
(292, '2019', 'Cayman', 34),
(293, '2019', 'Macan', 34),
(294, '2019', 'Panamera', 34),
(295, '2019', 'Taycan', 34),
(296, '2019', 'Alaskan', 35),
(297, '2019', 'Captur', 35),
(298, '2019', 'Clio', 35),
(299, '2019', 'Espace', 35),
(300, '2019', 'Grand Kangoo', 35),
(301, '2019', 'Grand Scenic', 35),
(302, '2019', 'Kadjar', 35),
(303, '2019', 'Kangoo', 35),
(304, '2019', 'Kangoo Express', 35),
(305, '2019', 'Koleos', 35),
(306, '2019', 'Master', 35),
(307, '2019', 'Megane', 35),
(308, '2019', 'Scenic', 35),
(309, '2019', 'Trafic', 35),
(310, '2019', 'Twingo', 35),
(311, '2019', 'Twizy', 35),
(312, '2019', 'Zoe', 35),
(313, '2019', 'Dawn', 36),
(314, '2019', 'Ghost', 36),
(315, '2019', 'Phantom', 36),
(316, '2019', 'Wraith', 36),
(317, '2019', 'Alhambra', 37),
(318, '2019', 'Arona', 37),
(319, '2019', 'Ateca', 37),
(320, '2019', 'Ibiza', 37),
(321, '2019', 'Leon', 37),
(322, '2019', 'Mii', 37),
(323, '2019', 'Tarraco', 37),
(324, '2019', 'Toledo', 37),
(325, '2019', 'Citigo', 38),
(326, '2019', 'Fabia', 38),
(327, '2019', 'Karoq', 38),
(328, '2019', 'Kodiaq', 38),
(329, '2019', 'Octavia', 38),
(330, '2019', 'Rapid', 38),
(331, '2019', 'Scala', 38),
(332, '2019', 'Superb', 38),
(333, '2019', 'Yeti', 38),
(334, '2019', 'Forfour', 39),
(335, '2019', 'Fortwo', 39),
(336, '2019', 'Korando', 40),
(337, '2019', 'Musso', 40),
(338, '2019', 'Rodius', 40),
(339, '2019', 'Tivoli', 40),
(340, '2019', 'Tivoli XIv', 40),
(341, '2019', 'XIv', 40),
(342, '2019', 'Alto', 42),
(343, '2019', 'Baleno', 42),
(344, '2019', 'Celerio', 42),
(345, '2019', 'Ignis', 42),
(346, '2019', 'Jimny', 42),
(347, '2019', 'Swift', 42),
(348, '2019', 'Sx4', 42),
(349, '2019', 'Sx4 S-cross', 42),
(350, '2019', 'Vitara', 42),
(351, '2019', 'Model 3', 43),
(352, '2019', 'Model S', 43),
(353, '2019', 'Model X', 43),
(354, '2019', 'Auris', 44),
(355, '2019', 'Avensis', 44),
(356, '2019', 'Aygo', 44),
(357, '2019', 'C-hr', 44),
(358, '2019', 'Camry', 44),
(359, '2019', 'Corolla', 44),
(360, '2019', 'Gt86', 44),
(361, '2019', 'Hilux', 44),
(362, '2019', 'Land Cruiser', 44),
(363, '2019', 'Mirai', 44),
(364, '2019', 'Pirus', 44),
(365, '2019', 'Pirus+', 44),
(366, '2019', 'Proace', 44),
(367, '2019', 'Proace Verso', 44),
(368, '2019', 'Rav 4', 44),
(369, '2019', 'Supra', 44),
(370, '2019', 'Tacoma', 44),
(371, '2019', 'Yaris', 44),
(372, '2019', 'Golf 8', 45),
(373, '2019', 'T-roc R', 45),
(374, '2019', 'Amarok', 45),
(375, '2019', 'Arteon', 45),
(376, '2019', 'Caddy', 45),
(377, '2019', 'California', 45),
(378, '2019', 'Caravelle', 45),
(379, '2019', 'Combi', 45),
(380, '2019', 'Crafter', 45),
(381, '2019', 'Golf', 45),
(382, '2019', 'Golf Sportsvan', 45),
(383, '2019', 'Grand California', 45),
(384, '2019', 'Multivan', 45),
(385, '2019', 'Passat', 45),
(386, '2019', 'Polo', 45),
(387, '2019', 'Sharan', 45),
(388, '2019', 'T-cross', 45),
(389, '2019', 'T-roc', 45),
(390, '2019', 'Tiguan', 45),
(391, '2019', 'Tiguan Allspace', 45),
(392, '2019', 'Touareg', 45),
(393, '2019', 'Touran', 45),
(394, '2019', 'Transporter', 45),
(395, '2019', 'Up', 45),
(396, '2019', 'XI1', 45),
(397, '2019', 'S60', 46),
(398, '2019', 'V40', 46),
(399, '2019', 'V40 Cross Country', 46),
(400, '2019', 'V60', 46),
(401, '2019', 'V60 Cross Country', 46),
(402, '2019', 'V90', 46),
(403, '2019', 'V90 Cross Country', 46),
(404, '2019', 'Xc40', 46),
(405, '2019', 'Xc60', 46),
(406, '2019', 'Xc90', 46);

-- --------------------------------------------------------

--
-- Structure de la table `voiturepricing`
--

CREATE TABLE `voiturepricing` (
  `ID` bigint(20) NOT NULL,
  `DATEAPPLICATION` date DEFAULT NULL,
  `PRIX` decimal(38,0) DEFAULT NULL,
  `UNITE_ID` bigint(20) DEFAULT NULL,
  `VOITURE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `voiturepricing`
--

INSERT INTO `voiturepricing` (`ID`, `DATEAPPLICATION`, `PRIX`, `UNITE_ID`, `VOITURE_ID`) VALUES
(1, '2018-06-01', '300', 9, 1),
(2, '2018-06-01', '250', 9, 2),
(3, '2018-06-01', '275', 9, 3),
(4, '2018-06-01', '387', 9, 4),
(5, '2018-06-01', '420', 9, 5);

-- --------------------------------------------------------

--
-- Structure de la table `worker`
--

CREATE TABLE `worker` (
  `LOGIN` varchar(255) NOT NULL,
  `ACCEPTED` tinyint(1) DEFAULT '0',
  `BLOCKED` tinyint(1) DEFAULT '0',
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `NOMBREEMPLOYE` int(11) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `SITEWEB` varchar(255) DEFAULT NULL,
  `WORKERTYPE_ID` bigint(20) DEFAULT NULL,
  `NBRCNX` tinyint(4) NOT NULL,
  `SECTEUR_ID` bigint(20) DEFAULT NULL,
  `COMPLEMENTADRESSE` text,
  `DATEINSCRIPTION` timestamp NULL DEFAULT NULL,
  `LATITUDE` decimal(10,10) DEFAULT NULL,
  `LONGITUDE` decimal(10,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `worker`
--

INSERT INTO `worker` (`LOGIN`, `ACCEPTED`, `BLOCKED`, `DESCRIPTION`, `NOM`, `NOMBREEMPLOYE`, `PASSWORD`, `PHONE`, `SITEWEB`, `WORKERTYPE_ID`, `NBRCNX`, `SECTEUR_ID`, `COMPLEMENTADRESSE`, `DATEINSCRIPTION`, `LATITUDE`, `LONGITUDE`) VALUES
('cleanharbors@gmail.com', 1, 0, 'you probably heard of us, the leading company for cleaning services in over 26 countries', 'Clean Harbors', 32, 'cleanharbors@gmail.com', '0679120435', 'www.cleanharbors.com', 2, 0, 0, '', NULL, NULL, NULL),
('coitcleaners@gmail.com', 1, 0, 'An inspiring individual with many years of experiences in cleaning', 'Coit Cleaners ', 5, 'coitcleaners@gmail.com', '0613467982', 'www.coitcleaners.com', 1, 0, 0, '', NULL, NULL, NULL),
('kokogmail.com', 0, 0, 'PSSS\r\nPCHHHHH', 'kokogmail.com', 66, 'kokogmail.com', '456789000', 'kokogmail.com', 2, 0, 4, 'NNN 77', NULL, NULL, NULL),
('merrymaids@gmail.com', 1, 0, 'we can guarantee that our services are the best in the cleaning industry', 'Merry Maids', 54, 'merrymaids@gmail.com', '0687125903', 'www.merrymaids.com', 2, 0, 0, '', NULL, NULL, NULL),
('MultiServices@gmail.com', 1, 0, 'We do everything for the sake of testing ', 'Multi Services', 100, 'MultiServices@gmail.com', '0677352220', 'MultiServices.com', 2, 0, 7, 'NEM 44', NULL, NULL, NULL),
('mycompany@gmail.com', 1, 0, 'mailleurs services', 'myCompany', 50, 'mycompany@gmail.com', '0612457982', 'www.mycompany.com', 1, 0, 0, '', NULL, NULL, NULL),
('sifo@gmail.com', 1, 0, 'PFFFFFFFFWALOOOOHBECHHHHHH', 'sifo@gmail.com', 66, 'sifo@gmail.com', '456789000', 'sifo@gmail.com', 1, 0, 1, 'N 221', NULL, NULL, NULL),
('taskrabbit@gmail.com', 1, 0, 'we hire specialist from all around the globe so that you can have the best services', 'TaskRabbit ', 78, 'taskrabbit@gmail.com', '0612064367', 'www.taskrabbit.com', 2, 0, 0, '', NULL, NULL, NULL),
('top.sarl@gmail.com', 1, 0, 'nos services sont les mailleurs dans le marche', 'Top S.AR.L', 24, 'top.sarl@gmail.com', '0536798152', 'www.topsarl.com', 2, 0, 5, 'IMM ZODO BUM 77RH', NULL, NULL, NULL),
('zouani.younes@gmail.com', 1, 0, 'meryyy 3abitaaa\r\nsafaa non classsee', 'younes', 122, 'zouaniensiaste1987', '0625495187', 'www.zoro.com', 2, 0, 0, '', NULL, NULL, NULL),
('zs@gmail.com', 1, 0, 'awedaaa IT', 'zs', 23, '', '0625495187', 'www.zs.com', 1, 0, 0, '', NULL, NULL, NULL),
('zsCar@gmail.com', 1, 0, 'dddddddd', 'zsCar', 3, 'ysn', '0625495187', 'wwwzsCar.com', 2, 0, 4, 'IMM 90', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `workerjob`
--

CREATE TABLE `workerjob` (
  `ID` bigint(20) NOT NULL,
  `SECTEUR_ID` bigint(20) DEFAULT NULL,
  `SERVICE_ID` bigint(20) DEFAULT NULL,
  `WORKER_LOGIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `workerjob`
--

INSERT INTO `workerjob` (`ID`, `SECTEUR_ID`, `SERVICE_ID`, `WORKER_LOGIN`) VALUES
(1, 1, 1, 'cleanharbors@gmail.com'),
(2, 2, 1, 'merrymaids@gmail.com'),
(3, 4, 4, 'taskrabbit@gmail.com'),
(4, 5, 1, 'coitcleaners@gmail.com'),
(5, 4, 19, 'MultiServices@gmail.com'),
(6, 1, 17, 'MultiServices@gmail.com'),
(7, 1, 14, 'MultiServices@gmail.com'),
(8, 3, 8, 'MultiServices@gmail.com'),
(9, 1, 10, 'MultiServices@gmail.com'),
(10, 2, 21, 'MultiServices@gmail.com'),
(11, 1, 22, 'MultiServices@gmail.com'),
(12, 1, 1, 'top.sarl@gmail.com'),
(13, 2, 21, 'top.sarl@gmail.com'),
(14, 3, 10, 'top.sarl@gmail.com'),
(15, 3, 1, 'mycompany@gmail.com'),
(16, 2, 10, 'mycompany@gmail.com'),
(17, 1, 1, 'zs@gmail.com'),
(18, 3, 4, 'zs@gmail.com'),
(19, 1, 21, 'zsCar@gmail.com'),
(20, 1, 21, 'sifo@gmail.com'),
(21, 1, 21, 'kokogmail.com'),
(22, 1, 21, 'kokogmail.com'),
(23, 1, 21, 'kokogmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `workertype`
--

CREATE TABLE `workertype` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `workertype`
--

INSERT INTO `workertype` (`ID`, `NAME`) VALUES
(0, 'Choisis Pour Moi'),
(1, 'Personne Physique'),
(2, 'Personne Morale');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `carburant`
--
ALTER TABLE `carburant`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `childdemandebabysitting`
--
ALTER TABLE `childdemandebabysitting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CHILDDEMANDEBABYSITTING_DEMANDEBABYSITTING_ID` (`DEMANDEBABYSITTING_ID`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`EMAIL`),
  ADD KEY `FK_CLIENT_SECTEUR_ID` (`SECTEUR_ID`);

--
-- Index pour la table `couleur`
--
ALTER TABLE `couleur`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `cuisinedemandeevent`
--
ALTER TABLE `cuisinedemandeevent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CUISINEDEMANDEEVENT_DEMANDEEVENT_ID` (`DEMANDEEVENT_ID`),
  ADD KEY `FK_CUISINEDEMANDEEVENT_CUISINE_ID` (`CUISINE_ID`);

--
-- Index pour la table `cuisinetype`
--
ALTER TABLE `cuisinetype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `demandebabysitting`
--
ALTER TABLE `demandebabysitting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEBABYSITTING_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`);

--
-- Index pour la table `demandecleaning`
--
ALTER TABLE `demandecleaning`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDECLEANING_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`);

--
-- Index pour la table `demandeevent`
--
ALTER TABLE `demandeevent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEEVENT_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`),
  ADD KEY `FK_DEMANDEEVENT_EVENTBUDGET_ID` (`EVENTBUDGET_ID`),
  ADD KEY `FK_DEMANDEEVENT_EVENTTYPE_ID` (`EVENTTYPE_ID`);

--
-- Index pour la table `demandeformationpersonnel`
--
ALTER TABLE `demandeformationpersonnel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEFORMATIONPERSONNEL_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`),
  ADD KEY `FK_DEMANDEFORMATIONPERSONNEL_FILIERE_ID` (`FILIERE_ID`),
  ADD KEY `FK_DEMANDEFORMATIONPERSONNEL_MATIERE_ID` (`MATIERE_ID`);

--
-- Index pour la table `demandeformationpro`
--
ALTER TABLE `demandeformationpro`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEFORMATIONPRO_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`),
  ADD KEY `FK_DEMANDEFORMATIONPRO_FORMATEUR_EMAIL` (`FORMATEUR_EMAIL`);

--
-- Index pour la table `demandegardening`
--
ALTER TABLE `demandegardening`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEGARDENING_GARDENINGTYPE_ID` (`GARDENINGTYPE_ID`),
  ADD KEY `FK_DEMANDEGARDENING_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`),
  ADD KEY `FK_DEMANDEGARDENING_HOME_ID` (`HOME_ID`);

--
-- Index pour la table `demandehandyman`
--
ALTER TABLE `demandehandyman`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEHANDYMAN_SERVICE_ID` (`SERVICE_ID`),
  ADD KEY `FK_DEMANDEHANDYMAN_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`);

--
-- Index pour la table `demandemoving`
--
ALTER TABLE `demandemoving`
  ADD PRIMARY KEY (`DEMANDESERVICE_ID`),
  ADD KEY `FK_DEMANDEMOVING_VILLEDEPART_ID` (`VILLEDEPART_ID`),
  ADD KEY `FK_DEMANDEMOVING_VILLEARRIVE_ID` (`VILLEARRIVE_ID`);

--
-- Index pour la table `demandepainting`
--
ALTER TABLE `demandepainting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEPAINTING_PAINTING_ID` (`PAINTING_ID`),
  ADD KEY `FK_DEMANDEPAINTING_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`);

--
-- Index pour la table `demandepestcontrol`
--
ALTER TABLE `demandepestcontrol`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEPESTCONTROL_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`),
  ADD KEY `FK_DEMANDEPESTCONTROL_TYPEOFPESTCONTROL_ID` (`TYPEOFPESTCONTROL_ID`);

--
-- Index pour la table `demandephotographie`
--
ALTER TABLE `demandephotographie`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEPHOTOGRAPHIE_TYPEPHOTOGRAPHIE_ID` (`TYPEPHOTOGRAPHIE_ID`),
  ADD KEY `FK_DEMANDEPHOTOGRAPHIE_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`);

--
-- Index pour la table `demandeservice`
--
ALTER TABLE `demandeservice`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDESERVICE_TYPEDEMANDE_ID` (`TYPEDEMANDE_ID`),
  ADD KEY `FK_DEMANDESERVICE_PLANNING_ID` (`PLANNING_ID`),
  ADD KEY `FK_DEMANDESERVICE_SERVICE_ID` (`SERVICE_ID`),
  ADD KEY `FK_DEMANDESERVICE_WORKER_EMAIL` (`WORKER_LOGIN`),
  ADD KEY `FK_DEMANDESERVICE_CLIENT_EMAIL` (`CLIENT_EMAIL`),
  ADD KEY `FK_DEMANDESERVICE_MANAGERCONFIRMATION_LOGIN` (`MANAGERCONFIRMATION_LOGIN`),
  ADD KEY `FK_DEMANDESERVICE_SECTEUR_ID` (`SECTEUR_ID`),
  ADD KEY `FK_DEMANDESERVICE_WORKERTYPE_ID` (`WORKERTYPE_ID`),
  ADD KEY `FK_DEMANDESERVICE_SERVICEPRICING_ID` (`SERVICEPRICING_ID`);

--
-- Index pour la table `demandeserviceconfirmationdetail`
--
ALTER TABLE `demandeserviceconfirmationdetail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDESERVICECONFIRMATIONDETAIL_MANAGER_LOGIN` (`MANAGER_LOGIN`),
  ADD KEY `FK_DEMANDESERVICECONFIRMATIONDETAIL_TYPEACTION_ID` (`TYPEACTION_ID`),
  ADD KEY `DEMANDESERVICECONFIRMATIONDETAIL_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`);

--
-- Index pour la table `demandevoiture`
--
ALTER TABLE `demandevoiture`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEVOITURE_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`);

--
-- Index pour la table `demandevoitureitem`
--
ALTER TABLE `demandevoitureitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDEVOITUREITEM_DEMANDEVOITURE_ID` (`DEMANDEVOITURE_ID`),
  ADD KEY `FK_DEMANDEVOITUREITEM_WORKER_EMAIL` (`WORKER_LOGIN`),
  ADD KEY `FK_DEMANDEVOITUREITEM_CARBURANT_ID` (`CARBURANT_ID`),
  ADD KEY `FK_DEMANDEVOITUREITEM_MODELE_ID` (`MODELE_ID`);

--
-- Index pour la table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEVICE_MANAGER_LOGIN` (`MANAGER_LOGIN`),
  ADD KEY `FK_DEVICE_WORKER_EMAIL` (`WORKER_LOGIN`);

--
-- Index pour la table `eventbudget`
--
ALTER TABLE `eventbudget`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `eventtype`
--
ALTER TABLE `eventtype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_FAQ_SERVICE_ID` (`SERVICE_ID`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_FILIERE_NIVEAUSCOLAIRE_ID` (`NIVEAUSCOLAIRE_ID`);

--
-- Index pour la table `formateurjob`
--
ALTER TABLE `formateurjob`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_FORMATEURJOB_WORKER_EMAIL` (`WORKER_LOGIN`),
  ADD KEY `FK_FORMATEURJOB_FORMATIONPROSUBTYPE_ID` (`FORMATIONPROSUBTYPE_ID`);

--
-- Index pour la table `formationprosubtype`
--
ALTER TABLE `formationprosubtype`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_FORMATIONPROSUBTYPE_FORMATIONPROTYPE_ID` (`FORMATIONPROTYPE_ID`);

--
-- Index pour la table `formationprotype`
--
ALTER TABLE `formationprotype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `gardeningtype`
--
ALTER TABLE `gardeningtype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `handymantype`
--
ALTER TABLE `handymantype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_HOME_HOMETYPE_ID` (`HOMETYPE_ID`);

--
-- Index pour la table `hometype`
--
ALTER TABLE `hometype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`LOGIN`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MATIERE_FILIERE_ID` (`FILIERE_ID`);

--
-- Index pour la table `menuformulaire`
--
ALTER TABLE `menuformulaire`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MENUFORMULAIRE_SERVICE_ID` (`SERVICE_ID`);

--
-- Index pour la table `niveauscolaire`
--
ALTER TABLE `niveauscolaire`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `packaging`
--
ALTER TABLE `packaging`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PACKAGING_SERVICE_ID` (`SERVICE_ID`),
  ADD KEY `FK_PACKAGING_SERVICEPRICING_ID` (`SERVICEPRICING_ID`);

--
-- Index pour la table `paintingtype`
--
ALTER TABLE `paintingtype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `pestcontroltype`
--
ALTER TABLE `pestcontroltype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `photographietype`
--
ALTER TABLE `photographietype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `planning`
--
ALTER TABLE `planning`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PLANNING_TIMING_ID` (`TIMING_ID`);

--
-- Index pour la table `planningitem`
--
ALTER TABLE `planningitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PLANNINGITEM_TIMING_ID` (`TIMING_ID`),
  ADD KEY `FK_PLANNINGITEM_PLANNING_ID` (`PLANNING_ID`),
  ADD KEY `FK_PLANNINGITEM_DAY_ID` (`DAY_ID`);

--
-- Index pour la table `profjob`
--
ALTER TABLE `profjob`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PROFJOB_MATIERE_ID` (`MATIERE_ID`),
  ADD KEY `FK_PROFJOB_WORKER_EMAIL` (`WORKER_EMAIL`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REVIEW_WORKER_EMAIL` (`WORKER_LOGIN`),
  ADD KEY `FK_REVIEW_DEMANDESERVICE_ID` (`DEMANDESERVICE_ID`),
  ADD KEY `FK_REVIEW_CLIENT_EMAIL` (`CLIENT_EMAIL`);

--
-- Index pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SECTEUR_VILLE_ID` (`VILLE_ID`);

--
-- Index pour la table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SERVICE_CATEGORIE_ID` (`CATEGORIE_ID`);

--
-- Index pour la table `servicepricing`
--
ALTER TABLE `servicepricing`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SERVICEPRICING_UNITE_ID` (`UNITE_ID`),
  ADD KEY `FK_SERVICEPRICING_SERVICE_ID` (`SERVICE_ID`);

--
-- Index pour la table `serviceville`
--
ALTER TABLE `serviceville`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SERVICEVILLE_SERVICE_ID` (`SERVICE_ID`),
  ADD KEY `FK_SERVICEVILLE_VILLE_ID` (`VILLE_ID`);

--
-- Index pour la table `supplementdemandeevent`
--
ALTER TABLE `supplementdemandeevent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SUPPLEMENTDEMANDEEVENT_DEMANDEEVENT_ID` (`DEMANDEEVENT_ID`),
  ADD KEY `FK_SUPPLEMENTDEMANDEEVENT_SUPPLEMENTEVENT_ID` (`SUPPLEMENTEVENT_ID`);

--
-- Index pour la table `supplementevent`
--
ALTER TABLE `supplementevent`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `timing`
--
ALTER TABLE `timing`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `typeaction`
--
ALTER TABLE `typeaction`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `typedemande`
--
ALTER TABLE `typedemande`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `unite`
--
ALTER TABLE `unite`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_VILLE_PAYS_ID` (`PAYS_ID`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_VOITURE_CARBURANT_ID` (`CARBURANT_ID`),
  ADD KEY `FK_VOITURE_MODELE_ID` (`MODELE_ID`),
  ADD KEY `FK_VOITURE_WORKER_EMAIL` (`WORKER_LOGIN`);

--
-- Index pour la table `voiturecarburantcouleur`
--
ALTER TABLE `voiturecarburantcouleur`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_VOITURECARBURANTCOULEUR_COULEUR_ID` (`COULEUR_ID`),
  ADD KEY `FK_VOITURECARBURANTCOULEUR_VOITURE_ID` (`VOITURE_ID`),
  ADD KEY `FK_VOITURECARBURANTCOULEUR_CARBURANT_ID` (`CARBURANT_ID`);

--
-- Index pour la table `voitureimage`
--
ALTER TABLE `voitureimage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_VOITUREIMAGE_VOITURE_ID` (`VOITURE_ID`);

--
-- Index pour la table `voituremarque`
--
ALTER TABLE `voituremarque`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `voituremodele`
--
ALTER TABLE `voituremodele`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_VOITUREMODELE_MARQUE_ID` (`MARQUE_ID`);

--
-- Index pour la table `voiturepricing`
--
ALTER TABLE `voiturepricing`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_VOITUREPRICING_VOITURE_ID` (`VOITURE_ID`),
  ADD KEY `FK_VOITUREPRICING_UNITE_ID` (`UNITE_ID`);

--
-- Index pour la table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`LOGIN`),
  ADD KEY `FK_WORKER_WORKERTYPE_ID` (`WORKERTYPE_ID`);

--
-- Index pour la table `workerjob`
--
ALTER TABLE `workerjob`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_WORKERJOB_SERVICE_ID` (`SERVICE_ID`),
  ADD KEY `FK_WORKERJOB_SECTEUR_ID` (`SECTEUR_ID`),
  ADD KEY `FK_WORKERJOB_WORKER_EMAIL` (`WORKER_LOGIN`);

--
-- Index pour la table `workertype`
--
ALTER TABLE `workertype`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `eventbudget`
--
ALTER TABLE `eventbudget`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `childdemandebabysitting`
--
ALTER TABLE `childdemandebabysitting`
  ADD CONSTRAINT `FK_CHILDDEMANDEBABYSITTING_DEMANDEBABYSITTING_ID` FOREIGN KEY (`DEMANDEBABYSITTING_ID`) REFERENCES `demandebabysitting` (`ID`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_CLIENT_SECTEUR_ID` FOREIGN KEY (`SECTEUR_ID`) REFERENCES `secteur` (`ID`);

--
-- Contraintes pour la table `cuisinedemandeevent`
--
ALTER TABLE `cuisinedemandeevent`
  ADD CONSTRAINT `FK_CUISINEDEMANDEEVENT_CUISINE_ID` FOREIGN KEY (`CUISINE_ID`) REFERENCES `cuisinetype` (`ID`),
  ADD CONSTRAINT `FK_CUISINEDEMANDEEVENT_DEMANDEEVENT_ID` FOREIGN KEY (`DEMANDEEVENT_ID`) REFERENCES `demandeevent` (`ID`);

--
-- Contraintes pour la table `demandebabysitting`
--
ALTER TABLE `demandebabysitting`
  ADD CONSTRAINT `FK_DEMANDEBABYSITTING_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`);

--
-- Contraintes pour la table `demandecleaning`
--
ALTER TABLE `demandecleaning`
  ADD CONSTRAINT `FK_DEMANDECLEANING_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`);

--
-- Contraintes pour la table `demandeevent`
--
ALTER TABLE `demandeevent`
  ADD CONSTRAINT `FK_DEMANDEEVENT_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEEVENT_EVENTBUDGET_ID` FOREIGN KEY (`EVENTBUDGET_ID`) REFERENCES `eventbudget` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEEVENT_EVENTTYPE_ID` FOREIGN KEY (`EVENTTYPE_ID`) REFERENCES `eventtype` (`ID`);

--
-- Contraintes pour la table `demandeformationpersonnel`
--
ALTER TABLE `demandeformationpersonnel`
  ADD CONSTRAINT `FK_DEMANDEFORMATIONPERSONNEL_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEFORMATIONPERSONNEL_FILIERE_ID` FOREIGN KEY (`FILIERE_ID`) REFERENCES `filiere` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEFORMATIONPERSONNEL_MATIERE_ID` FOREIGN KEY (`MATIERE_ID`) REFERENCES `matiere` (`ID`);

--
-- Contraintes pour la table `demandeformationpro`
--
ALTER TABLE `demandeformationpro`
  ADD CONSTRAINT `FK_DEMANDEFORMATIONPRO_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEFORMATIONPRO_FORMATEUR_EMAIL` FOREIGN KEY (`FORMATEUR_EMAIL`) REFERENCES `worker` (`LOGIN`);

--
-- Contraintes pour la table `demandegardening`
--
ALTER TABLE `demandegardening`
  ADD CONSTRAINT `FK_DEMANDEGARDENING_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEGARDENING_GARDENINGTYPE_ID` FOREIGN KEY (`GARDENINGTYPE_ID`) REFERENCES `gardeningtype` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEGARDENING_HOME_ID` FOREIGN KEY (`HOME_ID`) REFERENCES `home` (`ID`);

--
-- Contraintes pour la table `demandehandyman`
--
ALTER TABLE `demandehandyman`
  ADD CONSTRAINT `FK_DEMANDEHANDYMAN_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEHANDYMAN_SERVICE_ID` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`ID`);

--
-- Contraintes pour la table `demandemoving`
--
ALTER TABLE `demandemoving`
  ADD CONSTRAINT `FK_DEMANDEMOVING_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEMOVING_VILLEARRIVE_ID` FOREIGN KEY (`VILLEARRIVE_ID`) REFERENCES `ville` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEMOVING_VILLEDEPART_ID` FOREIGN KEY (`VILLEDEPART_ID`) REFERENCES `ville` (`ID`);

--
-- Contraintes pour la table `demandepainting`
--
ALTER TABLE `demandepainting`
  ADD CONSTRAINT `FK_DEMANDEPAINTING_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEPAINTING_PAINTING_ID` FOREIGN KEY (`PAINTING_ID`) REFERENCES `paintingtype` (`ID`);

--
-- Contraintes pour la table `demandepestcontrol`
--
ALTER TABLE `demandepestcontrol`
  ADD CONSTRAINT `FK_DEMANDEPESTCONTROL_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEPESTCONTROL_TYPEOFPESTCONTROL_ID` FOREIGN KEY (`TYPEOFPESTCONTROL_ID`) REFERENCES `pestcontroltype` (`ID`);

--
-- Contraintes pour la table `demandephotographie`
--
ALTER TABLE `demandephotographie`
  ADD CONSTRAINT `FK_DEMANDEPHOTOGRAPHIE_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEPHOTOGRAPHIE_TYPEPHOTOGRAPHIE_ID` FOREIGN KEY (`TYPEPHOTOGRAPHIE_ID`) REFERENCES `photographietype` (`ID`);

--
-- Contraintes pour la table `demandeservice`
--
ALTER TABLE `demandeservice`
  ADD CONSTRAINT `FK_DEMANDESERVICE_CLIENT_EMAIL` FOREIGN KEY (`CLIENT_EMAIL`) REFERENCES `client` (`EMAIL`),
  ADD CONSTRAINT `FK_DEMANDESERVICE_MANAGERCONFIRMATION_LOGIN` FOREIGN KEY (`MANAGERCONFIRMATION_LOGIN`) REFERENCES `manager` (`LOGIN`),
  ADD CONSTRAINT `FK_DEMANDESERVICE_PLANNING_ID` FOREIGN KEY (`PLANNING_ID`) REFERENCES `planning` (`ID`),
  ADD CONSTRAINT `FK_DEMANDESERVICE_SECTEUR_ID` FOREIGN KEY (`SECTEUR_ID`) REFERENCES `secteur` (`ID`),
  ADD CONSTRAINT `FK_DEMANDESERVICE_SERVICEPRICING_ID` FOREIGN KEY (`SERVICEPRICING_ID`) REFERENCES `servicepricing` (`ID`),
  ADD CONSTRAINT `FK_DEMANDESERVICE_SERVICE_ID` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`ID`),
  ADD CONSTRAINT `FK_DEMANDESERVICE_TYPEDEMANDE_ID` FOREIGN KEY (`TYPEDEMANDE_ID`) REFERENCES `typedemande` (`ID`),
  ADD CONSTRAINT `FK_DEMANDESERVICE_WORKERTYPE_ID` FOREIGN KEY (`WORKERTYPE_ID`) REFERENCES `workertype` (`ID`),
  ADD CONSTRAINT `FK_DEMANDESERVICE_WORKER_EMAIL` FOREIGN KEY (`WORKER_LOGIN`) REFERENCES `worker` (`LOGIN`);

--
-- Contraintes pour la table `demandeserviceconfirmationdetail`
--
ALTER TABLE `demandeserviceconfirmationdetail`
  ADD CONSTRAINT `DEMANDESERVICECONFIRMATIONDETAIL_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_DEMANDESERVICECONFIRMATIONDETAIL_MANAGER_LOGIN` FOREIGN KEY (`MANAGER_LOGIN`) REFERENCES `manager` (`LOGIN`),
  ADD CONSTRAINT `FK_DEMANDESERVICECONFIRMATIONDETAIL_TYPEACTION_ID` FOREIGN KEY (`TYPEACTION_ID`) REFERENCES `typeaction` (`ID`);

--
-- Contraintes pour la table `demandevoiture`
--
ALTER TABLE `demandevoiture`
  ADD CONSTRAINT `FK_DEMANDEVOITURE_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`);

--
-- Contraintes pour la table `demandevoitureitem`
--
ALTER TABLE `demandevoitureitem`
  ADD CONSTRAINT `FK_DEMANDEVOITUREITEM_CARBURANT_ID` FOREIGN KEY (`CARBURANT_ID`) REFERENCES `carburant` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEVOITUREITEM_DEMANDEVOITURE_ID` FOREIGN KEY (`DEMANDEVOITURE_ID`) REFERENCES `demandevoiture` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEVOITUREITEM_MODELE_ID` FOREIGN KEY (`MODELE_ID`) REFERENCES `voituremodele` (`ID`),
  ADD CONSTRAINT `FK_DEMANDEVOITUREITEM_WORKER_EMAIL` FOREIGN KEY (`WORKER_LOGIN`) REFERENCES `worker` (`LOGIN`);

--
-- Contraintes pour la table `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `FK_DEVICE_MANAGER_LOGIN` FOREIGN KEY (`MANAGER_LOGIN`) REFERENCES `manager` (`LOGIN`),
  ADD CONSTRAINT `FK_DEVICE_WORKER_EMAIL` FOREIGN KEY (`WORKER_LOGIN`) REFERENCES `worker` (`LOGIN`);

--
-- Contraintes pour la table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `FK_FAQ_SERVICE_ID` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`ID`);

--
-- Contraintes pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD CONSTRAINT `FK_FILIERE_NIVEAUSCOLAIRE_ID` FOREIGN KEY (`NIVEAUSCOLAIRE_ID`) REFERENCES `niveauscolaire` (`ID`);

--
-- Contraintes pour la table `formateurjob`
--
ALTER TABLE `formateurjob`
  ADD CONSTRAINT `FK_FORMATEURJOB_FORMATIONPROSUBTYPE_ID` FOREIGN KEY (`FORMATIONPROSUBTYPE_ID`) REFERENCES `formationprosubtype` (`ID`),
  ADD CONSTRAINT `FK_FORMATEURJOB_WORKER_EMAIL` FOREIGN KEY (`WORKER_LOGIN`) REFERENCES `worker` (`LOGIN`);

--
-- Contraintes pour la table `formationprosubtype`
--
ALTER TABLE `formationprosubtype`
  ADD CONSTRAINT `FK_FORMATIONPROSUBTYPE_FORMATIONPROTYPE_ID` FOREIGN KEY (`FORMATIONPROTYPE_ID`) REFERENCES `formationprotype` (`ID`);

--
-- Contraintes pour la table `home`
--
ALTER TABLE `home`
  ADD CONSTRAINT `FK_HOME_HOMETYPE_ID` FOREIGN KEY (`HOMETYPE_ID`) REFERENCES `hometype` (`ID`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `FK_MATIERE_FILIERE_ID` FOREIGN KEY (`FILIERE_ID`) REFERENCES `filiere` (`ID`);

--
-- Contraintes pour la table `menuformulaire`
--
ALTER TABLE `menuformulaire`
  ADD CONSTRAINT `FK_MENUFORMULAIRE_SERVICE_ID` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`ID`);

--
-- Contraintes pour la table `packaging`
--
ALTER TABLE `packaging`
  ADD CONSTRAINT `FK_PACKAGING_SERVICEPRICING_ID` FOREIGN KEY (`SERVICEPRICING_ID`) REFERENCES `servicepricing` (`ID`),
  ADD CONSTRAINT `FK_PACKAGING_SERVICE_ID` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`ID`);

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `FK_PLANNING_TIMING_ID` FOREIGN KEY (`TIMING_ID`) REFERENCES `timing` (`ID`);

--
-- Contraintes pour la table `planningitem`
--
ALTER TABLE `planningitem`
  ADD CONSTRAINT `FK_PLANNINGITEM_DAY_ID` FOREIGN KEY (`DAY_ID`) REFERENCES `day` (`ID`),
  ADD CONSTRAINT `FK_PLANNINGITEM_PLANNING_ID` FOREIGN KEY (`PLANNING_ID`) REFERENCES `planning` (`ID`),
  ADD CONSTRAINT `FK_PLANNINGITEM_TIMING_ID` FOREIGN KEY (`TIMING_ID`) REFERENCES `timing` (`ID`);

--
-- Contraintes pour la table `profjob`
--
ALTER TABLE `profjob`
  ADD CONSTRAINT `FK_PROFJOB_MATIERE_ID` FOREIGN KEY (`MATIERE_ID`) REFERENCES `matiere` (`ID`),
  ADD CONSTRAINT `FK_PROFJOB_WORKER_EMAIL` FOREIGN KEY (`WORKER_EMAIL`) REFERENCES `worker` (`LOGIN`);

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_REVIEW_CLIENT_EMAIL` FOREIGN KEY (`CLIENT_EMAIL`) REFERENCES `client` (`EMAIL`),
  ADD CONSTRAINT `FK_REVIEW_DEMANDESERVICE_ID` FOREIGN KEY (`DEMANDESERVICE_ID`) REFERENCES `demandeservice` (`ID`),
  ADD CONSTRAINT `FK_REVIEW_WORKER_EMAIL` FOREIGN KEY (`WORKER_LOGIN`) REFERENCES `worker` (`LOGIN`);

--
-- Contraintes pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD CONSTRAINT `FK_SECTEUR_VILLE_ID` FOREIGN KEY (`VILLE_ID`) REFERENCES `ville` (`ID`);

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK_SERVICE_CATEGORIE_ID` FOREIGN KEY (`CATEGORIE_ID`) REFERENCES `categorie` (`ID`);

--
-- Contraintes pour la table `servicepricing`
--
ALTER TABLE `servicepricing`
  ADD CONSTRAINT `FK_SERVICEPRICING_SERVICE_ID` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`ID`),
  ADD CONSTRAINT `FK_SERVICEPRICING_UNITE_ID` FOREIGN KEY (`UNITE_ID`) REFERENCES `unite` (`ID`);

--
-- Contraintes pour la table `serviceville`
--
ALTER TABLE `serviceville`
  ADD CONSTRAINT `FK_SERVICEVILLE_SERVICE_ID` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`ID`),
  ADD CONSTRAINT `FK_SERVICEVILLE_VILLE_ID` FOREIGN KEY (`VILLE_ID`) REFERENCES `ville` (`ID`);

--
-- Contraintes pour la table `supplementdemandeevent`
--
ALTER TABLE `supplementdemandeevent`
  ADD CONSTRAINT `FK_SUPPLEMENTDEMANDEEVENT_DEMANDEEVENT_ID` FOREIGN KEY (`DEMANDEEVENT_ID`) REFERENCES `demandeevent` (`ID`),
  ADD CONSTRAINT `FK_SUPPLEMENTDEMANDEEVENT_SUPPLEMENTEVENT_ID` FOREIGN KEY (`SUPPLEMENTEVENT_ID`) REFERENCES `supplementevent` (`ID`);

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `FK_VILLE_PAYS_ID` FOREIGN KEY (`PAYS_ID`) REFERENCES `pays` (`ID`);

--
-- Contraintes pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `FK_VOITURE_CARBURANT_ID` FOREIGN KEY (`CARBURANT_ID`) REFERENCES `carburant` (`ID`),
  ADD CONSTRAINT `FK_VOITURE_MODELE_ID` FOREIGN KEY (`MODELE_ID`) REFERENCES `voituremodele` (`ID`),
  ADD CONSTRAINT `FK_VOITURE_WORKER_EMAIL` FOREIGN KEY (`WORKER_LOGIN`) REFERENCES `worker` (`LOGIN`);

--
-- Contraintes pour la table `voiturecarburantcouleur`
--
ALTER TABLE `voiturecarburantcouleur`
  ADD CONSTRAINT `FK_VOITURECARBURANTCOULEUR_CARBURANT_ID` FOREIGN KEY (`CARBURANT_ID`) REFERENCES `carburant` (`ID`),
  ADD CONSTRAINT `FK_VOITURECARBURANTCOULEUR_COULEUR_ID` FOREIGN KEY (`COULEUR_ID`) REFERENCES `couleur` (`ID`),
  ADD CONSTRAINT `FK_VOITURECARBURANTCOULEUR_VOITURE_ID` FOREIGN KEY (`VOITURE_ID`) REFERENCES `voiture` (`ID`);

--
-- Contraintes pour la table `voitureimage`
--
ALTER TABLE `voitureimage`
  ADD CONSTRAINT `FK_VOITUREIMAGE_VOITURE_ID` FOREIGN KEY (`VOITURE_ID`) REFERENCES `voiture` (`ID`);

--
-- Contraintes pour la table `voituremodele`
--
ALTER TABLE `voituremodele`
  ADD CONSTRAINT `FK_VOITUREMODELE_MARQUE_ID` FOREIGN KEY (`MARQUE_ID`) REFERENCES `voituremarque` (`ID`);

--
-- Contraintes pour la table `voiturepricing`
--
ALTER TABLE `voiturepricing`
  ADD CONSTRAINT `FK_VOITUREPRICING_UNITE_ID` FOREIGN KEY (`UNITE_ID`) REFERENCES `unite` (`ID`),
  ADD CONSTRAINT `FK_VOITUREPRICING_VOITURE_ID` FOREIGN KEY (`VOITURE_ID`) REFERENCES `voiture` (`ID`);

--
-- Contraintes pour la table `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `FK_WORKER_WORKERTYPE_ID` FOREIGN KEY (`WORKERTYPE_ID`) REFERENCES `workertype` (`ID`);

--
-- Contraintes pour la table `workerjob`
--
ALTER TABLE `workerjob`
  ADD CONSTRAINT `FK_WORKERJOB_SECTEUR_ID` FOREIGN KEY (`SECTEUR_ID`) REFERENCES `secteur` (`ID`),
  ADD CONSTRAINT `FK_WORKERJOB_SERVICE_ID` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`ID`),
  ADD CONSTRAINT `FK_WORKERJOB_WORKER_EMAIL` FOREIGN KEY (`WORKER_LOGIN`) REFERENCES `worker` (`LOGIN`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
