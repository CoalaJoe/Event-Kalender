-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Erstellungszeit: 24. Nov 2015 um 18:01
-- Server Version: 5.5.38
-- PHP-Version: 5.4.34

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- TRUNCATE Tabelle vor dem Einfügen `benutzer`
--

TRUNCATE TABLE `benutzer`;
--
-- Daten für Tabelle `benutzer`
--

INSERT INTO `benutzer` (`ID`, `benutzername`, `passwort`) VALUES
(1, 'admin', '$2y$13$fD7RPEpKzsXmjGV9Uomx4uv/7yyP3vYcYOJLFX0WQoeBobWhBQHC.'),
(2, 'Peter', 'admin'),
(3, 'Gaggi', '$2y$13$D5BHE59O9viksnV4ZFqpzOV1gwTTM3D4tq/F9X/9R0nXwKM2lXvLC');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- TRUNCATE Tabelle vor dem Einfügen `preisgruppe`
--

TRUNCATE TABLE `preisgruppe`;
--
-- Daten für Tabelle `preisgruppe`
--

INSERT INTO `preisgruppe` (`ID`, `name`, `preis`) VALUES
(2, 'Jugentliche', '30.-');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- TRUNCATE Tabelle vor dem Einfügen `veranstaltung`
--

TRUNCATE TABLE `veranstaltung`;
--
-- Daten für Tabelle `veranstaltung`
--

INSERT INTO `veranstaltung` (`id`, `name`, `besetzung`, `beschreibung`, `termin`, `dauer`, `bild`, `bildbeschreibung`, `link`, `linkbeschreibung`, `fk_genre_id`) VALUES
(3, 'Testii', 'lksdf', 'lkjsldkjflksjdlfk', '2015-12-09 19:00:00', 3, '7f7128ea36d737ce9a35ec148bacba8f4e2a1ee9.png', 'Stefanooo', 'http://aimei.ch', 'lsdkfsdf', 2),
(4, 'AIMEI', 'Dominik Müller, Stefano Carnini', 'AIMEI Vorstellung neuer Software', '2015-12-13 18:30:00', 60, '1a6032e34c5d07c72063c35af335cee6ee32be51.png', 'AIMEI Logo', 'http://aimei.ch', 'AIMEI Webseite', 5),
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
(19, 'Ttest', NULL, 'sldjfksdlkfjs', '2010-01-01 00:00:00', 60, '6d3e592140f97e40243dee7efc0e5eb95e8fc0cd.jpeg', 'lkjsdfölksjdf', NULL, NULL, 5);

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
(2, 19);

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
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `genre`
--
ALTER TABLE `genre`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT für Tabelle `preisgruppe`
--
ALTER TABLE `preisgruppe`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `veranstaltung`
--
ALTER TABLE `veranstaltung`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
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
