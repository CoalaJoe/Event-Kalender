-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Erstellungszeit: 01. Dez 2015 um 18:12
-- Server Version: 5.5.38
-- PHP-Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `Eventkalender`
--
CREATE DATABASE IF NOT EXISTS `Eventkalender` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Eventkalender`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `benutzer`
--

DROP TABLE IF EXISTS `benutzer`;
CREATE TABLE `benutzer` (
`ID` int(10) unsigned NOT NULL,
  `benutzername` varchar(45) NOT NULL,
  `passwort` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- TRUNCATE Tabelle vor dem Einfügen `benutzer`
--

TRUNCATE TABLE `benutzer`;
--
-- Daten für Tabelle `benutzer`
--

INSERT INTO `benutzer` (`ID`, `benutzername`, `passwort`) VALUES
(1, 'admin', '$2y$13$1Pr0wC61MfUWvs2lEJKg7eFZjcDledK7Lzdp6b0qk0wDm9bn4I1gW'),
(2, 'Peter', 'admin'),
(3, 'Gaggi', '$2y$13$D5BHE59O9viksnV4ZFqpzOV1gwTTM3D4tq/F9X/9R0nXwKM2lXvLC'),
(4, 'BlackBox', '$2y$13$FKLRFyW35U3y50JCT9U4Lew..048Z4m4LMSGFZVR6ym5hvQrKkeXy');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- TRUNCATE Tabelle vor dem Einfügen `genre`
--

TRUNCATE TABLE `genre`;
--
-- Daten für Tabelle `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Horror'),
(2, 'Comedy'),
(3, 'Romance'),
(5, 'Action'),
(6, 'Adventure'),
(7, 'Thriller'),
(8, 'Anime'),
(9, 'Criminal'),
(10, 'Documentation'),
(11, 'Fantasy'),
(12, 'Cartoon'),
(13, 'Mystery'),
(14, 'Historycal'),
(15, 'Mythological'),
(17, 'Fight'),
(18, 'Musical'),
(19, 'Dance'),
(20, 'Trash-Movies'),
(21, 'Classics'),
(22, 'Family');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `preisgruppe`
--

DROP TABLE IF EXISTS `preisgruppe`;
CREATE TABLE `preisgruppe` (
`ID` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `preis` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- TRUNCATE Tabelle vor dem Einfügen `preisgruppe`
--

TRUNCATE TABLE `preisgruppe`;
--
-- Daten für Tabelle `preisgruppe`
--

INSERT INTO `preisgruppe` (`ID`, `name`, `preis`) VALUES
(2, 'Jugentliche', '30.-'),
(3, 'Erwachsene (+18)', '40.-');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `veranstaltung`
--

DROP TABLE IF EXISTS `veranstaltung`;
CREATE TABLE `veranstaltung` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `besetzung` varchar(255) DEFAULT NULL,
  `beschreibung` text NOT NULL,
  `termin` datetime NOT NULL,
  `dauer` smallint(5) unsigned NOT NULL,
  `bild` varchar(100) NOT NULL,
  `bildbeschreibung` varchar(255) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `linkbeschreibung` varchar(255) DEFAULT NULL,
  `fk_genre_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- TRUNCATE Tabelle vor dem Einfügen `veranstaltung`
--

TRUNCATE TABLE `veranstaltung`;
--
-- Daten für Tabelle `veranstaltung`
--

INSERT INTO `veranstaltung` (`id`, `name`, `besetzung`, `beschreibung`, `termin`, `dauer`, `bild`, `bildbeschreibung`, `link`, `linkbeschreibung`, `fk_genre_id`) VALUES
(3, 'Testii', 'lksdf', 'lkjsldkjflksjdlfk', '2015-12-09 19:00:00', 3, '7f7128ea36d737ce9a35ec148bacba8f4e2a1ee9.png', 'Stefanooo', 'http://aimei.ch', 'lsdkfsdf', 2),
(4, 'AIMEI', 'Dominik Müller, Stefano Carnini', 'AIMEI Vorstellung neuer Software im Rahmen ihrer Webseite.', '2015-12-13 18:30:00', 60, '1a6032e34c5d07c72063c35af335cee6ee32be51.png', 'AIMEI Logo', 'http://aimei.ch', 'AIMEI Webseite', 14),
(5, 'sldjkf', 'ölkjsdlfkjsf', 'ölkjsdlkjf', '2011-01-01 00:00:00', 4, '2b9d75b4c89eab7a0c1522f624a7203a25dd2295.jpeg', 'lkjsdf', 'http://aimei.ch', 'lsjkdf', 1),
(6, 'dsfoijsdf', 'lkjsdföljk', 'öljknsdlfkjsdf', '2010-03-01 00:00:00', 3, 'b3c3e217f3818b898838dbfb46415b907f7b7926.png', 'skljdfsdföljk', 'http://ölkjsdfölk', 'öljksdflkj', 3),
(7, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, '73ac66fbbce5e9b0da1bcf81b3051fca18c3b122.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(8, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, '3a2674c893083ff612164bfbcc23e71510dc5c59.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(9, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, '1ab446cab620d3d21feb37c0dbf59a60a4ecd981.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(10, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, '5935d3708849f9d2409f6e486d05aee3ec6d1c30.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(11, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, '7fd7eef2e6881c39e3ed60b5d1b08dd7bcefe70f.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(12, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, 'bc2c48afb45918bf45b48f4cddf77cecf761b210.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(13, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, 'd1cf0033e2986887edb10b10edc18404bd84b2a6.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(14, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, '13b6e3e8cd2ce86e621be06eb05d785533a8577a.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(15, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, '1cc7d519fe94b8ffcf7b17dcfefb7e2502d69905.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(16, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, '9d74864156c907d02716d0e95486b0aa02487d87.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(17, 'sdkfjsdlkj', 'lkjsfölkjs', 'ölkjsdlöfkj', '2010-01-20 00:00:00', 4, 'c3e4776ccf9753c1c13e1099bedffc5cbf4d880b.png', 'ölksdf', 'http://ölkjd.ch', 'ljksdflökj', 3),
(18, 'Prekmurski Kavbojci – Manouche, Swing und Gipsy', 'Martin Medimorec (b, voc), Jaro Milko (g, bouzouki, voc), Ulrich Pletscher (cl, acc, voc) und Benjamin Brodbeck (perc, voc).', 'Die vier Musiker der Band Prekmurski Kavbojci wehren sich mit ihrem neuen Programm gegen die digitale Reizüberflutung. Der Wunsch, ohne viel technischen Aufwand gemeinsam Musik zu machen, ist bei den vier Musikern wieder in den Vordergrund gerückt. Und darum spielen Prekmurski Kavbojci momentan in einer traditionellen Besetzung: Mit Klarinette, Akkordeon, Bouzouki, Kontrabass und Pauke haben sie instrumental etwas abgespeckt - nicht aber musikalisch! Ob live am Konzert oder auf der aktuellen CD "Analog Acoustic Strike Back": Prekmurski Kavbojci lassen uns mit ihrer analogen Musik unsern digitalen Alltag vergessen.\r\nHeitere Musik mit einem Quartett voll mitreissender Spielfreude mit Musik seiner neuen CD „ Analog Acoustic Strike Back“. Der Band um den in Liestal aufgewachsenen Benjamin Brodbeck gelingt damit die Rückbesinnung aufs einfache akustische Musizieren.', '2015-11-27 19:00:00', 120, '99e4e25770bbc53a3cd9d8ea01e10e8dfa44d7a0.jpeg', 'Prekmurski Kavbojci – Manouche, Swing und Gipsy', 'http://www.prekmurskikavbojci.com', 'Prekmurski Kavbojci – Manouche, Swing und Gipsy Link', 9),
(19, 'Ttest', NULL, 'sldjfksdlkfjs', '2010-01-01 00:00:00', 60, '6d3e592140f97e40243dee7efc0e5eb95e8fc0cd.jpeg', 'lkjsdfölksjdf', NULL, NULL, 5),
(21, 'Test', 'lkjdsf', 'lkjsdlkjfdf', '2010-01-01 00:00:00', 5, '0548df685ee8bba784cd1d360e9dc71cc2c04a69.jpeg', 'sdflkjsdf', NULL, NULL, 1),
(22, 'Test', 'lkjdsf', 'lkjsdlkjfdf', '2010-01-01 00:00:00', 5, 'c5541d271a9d176ac5b1eeb6a381dd14a4133444.jpeg', 'sdflkjsdf', NULL, NULL, 1),
(23, 'slkjfs', 'lökjsdf', 'lökjsdlkjfsdf', '2010-01-20 00:04:00', 4, 'fb55e70e86f1c31ce5697a6d3d5b6ca06b65e444.jpeg', 'sdlöijsdlkfjsa', NULL, NULL, 1),
(24, 'öljksdflskjfd', 'lkjdflksdj', 'lkjslfkjsdf', '2015-12-09 21:00:00', 180, 'ac50c46a327bb9b3bfc41df1162fb96420757ee3.png', 'slkjfdskjd', NULL, NULL, 1),
(25, 'öljksdflskjfd', 'lkjdflksdj', 'lkjslfkjsdf', '2015-12-09 20:30:00', 270, '9787137738319532a0eab76b4791a8d30bc20624.png', 'slkjfdskjd', NULL, NULL, 1),
(26, 'öljksdflskjfd', 'lkjdflksdj', 'lkjslfkjsdf', '2015-12-09 20:30:00', 270, 'debf1044f19f106f215e3009ed82b539ebfb441f.png', 'slkjfdskjd', NULL, NULL, 1),
(27, 'sksjdfldksj', 'ölkjslödkjflösdkj', 'lökjsdlökjflsödkjfsölkjf', '2015-09-12 20:00:00', 120, 'a48c3773c5b01eb178d308743766ae0084ba20cd.png', 'lkjsdlfkjd', NULL, NULL, 1),
(28, 'sksjdfldksj', 'ölkjslödkjflösdkj', 'lökjsdlökjflsödkjfsölkjf', '2015-09-12 20:00:00', 120, '10033098c268dcffde67ee28a8d7e67951fb9f16.png', 'lkjsdlfkjd', NULL, NULL, 1),
(29, 'sksjdfldksj', 'ölkjslödkjflösdkj', 'lökjsdlökjflsödkjfsölkjf', '2015-09-12 20:00:00', 120, '30bf751472b68b5975d6b3b3164c18a1cded0d5b.png', 'lkjsdlfkjd', NULL, NULL, 1),
(30, 'sksjdfldksj', 'ölkjslödkjflösdkj', 'lökjsdlökjflsödkjfsölkjf', '2015-09-12 20:00:00', 120, 'ae330a92a43d1ac66eec597beaa7a491b17cc9fa.png', 'lkjsdlfkjd', NULL, NULL, 1),
(31, 'sksjdfldksj', 'ölkjslödkjflösdkj', 'lökjsdlökjflsödkjfsölkjf', '2015-09-12 20:00:00', 120, 'f8d45149cfd9f2e2be6bb5291792f6e2ba2c1463.png', 'lkjsdlfkjd', NULL, NULL, 1),
(32, 'sksjdfldksj', 'ölkjslödkjflösdkj', 'lökjsdlökjflsödkjfsölkjf', '2015-09-12 20:00:00', 120, '252b3c6da1677afc49941c9c24456d1183c5cb63.png', 'lkjsdlfkjd', NULL, NULL, 1),
(33, 'sksjdfldksj', 'ölkjslödkjflösdkj', 'lökjsdlökjflsödkjfsölkjf', '2015-09-12 20:00:00', 120, '1f78210a052a777970792abe53d6ab9858cf04ca.png', 'lkjsdlfkjd', NULL, NULL, 1),
(34, 'sksjdfldksj', 'ölkjslödkjflösdkj', 'lökjsdlökjflsödkjfsölkjf', '2015-09-12 20:00:00', 120, '267e672a333b1c3def9e4706ba03e4f724cd651e.png', 'lkjsdlfkjd', NULL, NULL, 1),
(35, 'kjhsdkjflkj', 'lkjsdflkjsd', 'ölkjsdlkjsdf', '2015-09-12 20:00:00', 120, '1edf6181615a9456f16b1cee8d2099ef41d0f0cd.png', 'slökjsdölfkjsdlkjf', NULL, NULL, 1),
(36, 'kjhsdkjflkj', 'lkjsdflkjsd', 'ölkjsdlkjsdf', '2015-09-12 20:00:00', 120, '1e6507b0279966016b7f82b638a143c9b75ef607.png', 'slökjsdölfkjsdlkjf', NULL, NULL, 1),
(37, 'köjsölkjsdflökjsdflkj', 'ölkjsdölkjsdfölkj', 'lkjsdölkjsdföljk', '2015-09-12 20:10:00', 130, 'a76b82a4cf60271843db4f9148c593d2dd606ec8.png', 'slökjsdlökjsdf', NULL, NULL, 1),
(38, 'lkjlsdkjflösdkjfl', 'ölkjsldfkjsdfölkj', 'ölkjölskdjfölkj', '2015-09-12 20:00:00', 120, 'b7f0980924005e9eb1180847e250dabdf6c90f07.png', 'sölkjsldkjfsd', NULL, NULL, 1),
(39, 'lökjsdflökjsdf', 'ölkjsdfölkj', 'ölkjsdfölkjsdf', '2015-09-13 00:40:00', 400, '31b4f91ef1c757049e1a0fa16aa6d683eac902e4.png', 'kjhkjkl', NULL, NULL, 1),
(40, 'lskjd', 'lkjsd', 'lkjsd', '2015-12-09 20:10:00', 130, '744b46d83a02a32cbb2909a08144883a6561faa7.png', 'kjn', NULL, NULL, 1),
(41, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '65639250e87df6a85b2a995c864d22c778aca17a.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(42, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '2ef1a991e0517df4d4f04b863a4a7cbfad5c22f3.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(43, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '1e8aedd370bf733828fc007ca1f6d1ead8f131b2.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(44, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, 'bc431576b81ba812bfa2b884738bf4594e7d04ad.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(45, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '93610ddb10390ffc8b858f8475b7315e94991779.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(46, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '08de852c79d600534d3699912ded4369a771b107.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(47, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '52e5f847f8e3642e0324e31442f79a5857ba8f88.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(48, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, 'dd15cde6c05787b22b1185133ee4ad1ffc099ed5.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(49, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '9d93ca33bf31fa52dc9390e0a894fde1ec0cc593.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(50, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '539c302635c5b73733f2d31ed803b32435f8ee59.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(51, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '692e9639ddf1c7e9f1e1057f56e484ce26b159e2.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(52, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, 'bacff0192b73e6dbdc13b13834a04c0cbf67d784.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(53, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, 'b14c45445181db168bf6685d9f1c1e6d78928b34.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(54, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 19:00:00', 60, '7b02b6c335c68d48bfd14d5c31372a433236037b.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(55, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 18:00:00', 60, '81167ec76ae1c56da82883604cb6aeacc0598eb1.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(56, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 18:00:00', 60, '698e1eb90afe1dc856b3d6ea33a8a4519723f832.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(57, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 18:00:00', 60, '07b5fb84c26df65c8c7a7d7534d3d3b0bed01428.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1),
(58, 'XDebug', 'lkjsdflkj', 'lökjsdfölkj', '2015-12-09 18:00:00', 60, '35fb693ac690e3a892fc0cddc724badbb2ae04dc.png', 'kjhlkjsdfläkjsdf', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `veranstaltung_hat_preisgruppe`
--

DROP TABLE IF EXISTS `veranstaltung_hat_preisgruppe`;
CREATE TABLE `veranstaltung_hat_preisgruppe` (
  `fk_preisgruppe_id` int(10) unsigned NOT NULL,
  `fk_veranstaltung_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- TRUNCATE Tabelle vor dem Einfügen `veranstaltung_hat_preisgruppe`
--

TRUNCATE TABLE `veranstaltung_hat_preisgruppe`;
--
-- Daten für Tabelle `veranstaltung_hat_preisgruppe`
--

INSERT INTO `veranstaltung_hat_preisgruppe` (`fk_preisgruppe_id`, `fk_veranstaltung_id`) VALUES
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(3, 7),
(3, 4),
(3, 23),
(2, 24),
(3, 24),
(2, 25),
(3, 25),
(2, 26),
(3, 26),
(2, 27),
(3, 27),
(2, 28),
(3, 28),
(2, 29),
(3, 29),
(2, 30),
(3, 30),
(2, 31),
(3, 31),
(2, 32),
(3, 32),
(2, 33),
(3, 33),
(2, 34),
(3, 34),
(2, 35),
(3, 35),
(2, 36),
(3, 36),
(2, 37),
(3, 37),
(2, 38),
(3, 38),
(2, 39),
(3, 39),
(2, 40),
(3, 40),
(2, 41),
(3, 41),
(2, 42),
(3, 42),
(2, 43),
(3, 43),
(2, 44),
(3, 44),
(2, 45),
(3, 45),
(2, 46),
(3, 46),
(2, 47),
(3, 47),
(2, 48),
(3, 48),
(2, 49),
(3, 49),
(2, 50),
(3, 50),
(2, 51),
(3, 51),
(2, 52),
(3, 52),
(2, 53),
(3, 53),
(2, 54),
(3, 54),
(2, 55),
(3, 55),
(2, 56),
(3, 56),
(2, 57),
(3, 57),
(2, 58),
(3, 58);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `benutzer`
--
ALTER TABLE `benutzer`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `benutzername_UNIQUE` (`benutzername`);

--
-- Indizes für die Tabelle `genre`
--
ALTER TABLE `genre`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `preisgruppe`
--
ALTER TABLE `preisgruppe`
 ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `veranstaltung`
--
ALTER TABLE `veranstaltung`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_Veranstaltung_Genre1_idx` (`fk_genre_id`);

--
-- Indizes für die Tabelle `veranstaltung_hat_preisgruppe`
--
ALTER TABLE `veranstaltung_hat_preisgruppe`
 ADD KEY `fk_Veranstaltung_hat_Presigruppen_Preisgruppe_idx` (`fk_preisgruppe_id`), ADD KEY `fk_Veranstaltung_hat_Presigruppen_Veranstaltung1_idx` (`fk_veranstaltung_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `benutzer`
--
ALTER TABLE `benutzer`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `genre`
--
ALTER TABLE `genre`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT für Tabelle `preisgruppe`
--
ALTER TABLE `preisgruppe`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `veranstaltung`
--
ALTER TABLE `veranstaltung`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `veranstaltung`
--
ALTER TABLE `veranstaltung`
ADD CONSTRAINT `fk_Veranstaltung_Genre1` FOREIGN KEY (`fk_genre_id`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `veranstaltung_hat_preisgruppe`
--
ALTER TABLE `veranstaltung_hat_preisgruppe`
ADD CONSTRAINT `fk_Veranstaltung_hat_Presigruppen_Preisgruppe` FOREIGN KEY (`fk_preisgruppe_id`) REFERENCES `preisgruppe` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Veranstaltung_hat_Presigruppen_Veranstaltung1` FOREIGN KEY (`fk_veranstaltung_id`) REFERENCES `veranstaltung` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
