-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Feb 2018 um 13:47
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `car_rent_company`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ac_types`
--

CREATE TABLE `ac_types` (
  `ac_type_id` int(11) NOT NULL,
  `ac_type_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ac_types`
--

INSERT INTO `ac_types` (`ac_type_id`, `ac_type_name`) VALUES
(1, 'Fuel-tank not full'),
(2, 'Car Damage'),
(3, 'Dirty car');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_charges`
--

CREATE TABLE `additional_charges` (
  `ac_id` int(11) NOT NULL,
  `ac_price` int(11) NOT NULL,
  `ac_description` varchar(55) NOT NULL,
  `fk_invo_id` int(11) NOT NULL,
  `fk_ac_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `additional_charges`
--

INSERT INTO `additional_charges` (`ac_id`, `ac_price`, `ac_description`, `fk_invo_id`, `fk_ac_type_id`) VALUES
(1, 30, 'Mc Donalds bags everywhere', 1, 3),
(2, 200, 'Mirror broken', 1, 2),
(3, 10, '3/4 full', 4, 1),
(4, 50, 'Spilled coffee everywhere', 3, 3),
(5, 40, 'completely empty', 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `km_driven` int(11) NOT NULL,
  `fk_model_id` int(11) NOT NULL,
  `fk_ps_class_id` int(11) NOT NULL,
  `fk_offi_id` int(11) NOT NULL,
  `fk_invo_id` int(11) NOT NULL,
  `fk_insu_id` int(11) NOT NULL,
  `fk_loc_start_id` int(11) NOT NULL,
  `fk_loc_return_id` int(11) NOT NULL,
  `fk_cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`car_id`, `km_driven`, `fk_model_id`, `fk_ps_class_id`, `fk_offi_id`, `fk_invo_id`, `fk_insu_id`, `fk_loc_start_id`, `fk_loc_return_id`, `fk_cust_id`) VALUES
(2, 23940, 3, 4, 2, 4, 1, 3, 4, 3),
(3, 40292, 1, 3, 3, 3, 2, 1, 2, 5),
(4, 39492, 4, 2, 1, 1, 3, 1, 4, 1),
(5, 50294, 2, 4, 1, 2, 1, 3, 2, 2),
(6, 1204, 5, 4, 1, 5, 3, 1, 4, 2),
(7, 56783, 2, 4, 3, 2, 2, 5, 6, 5),
(8, 7539, 3, 1, 2, 3, 1, 7, 8, 4),
(9, 93949, 1, 2, 1, 4, 3, 3, 8, 3),
(10, 3945, 4, 1, 2, 2, 2, 3, 6, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_models`
--

CREATE TABLE `car_models` (
  `model_id` int(3) NOT NULL,
  `model_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car_models`
--

INSERT INTO `car_models` (`model_id`, `model_type`) VALUES
(1, 'Mazda3'),
(2, 'Mazda5'),
(3, 'BMW-4'),
(4, 'VW-Golf'),
(5, 'Ferrari-8');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `cust_id` int(11) NOT NULL,
  `cust_name` varchar(55) NOT NULL,
  `cust_surname` varchar(55) NOT NULL,
  `cust_birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`cust_id`, `cust_name`, `cust_surname`, `cust_birthdate`) VALUES
(1, 'Peter', 'Zweger', '1974-02-14'),
(2, 'Susi', 'Geiß', '1984-11-21'),
(3, 'Heinz', 'Christian', '1990-12-12'),
(4, 'Heiko', 'Mosch', '1986-02-08'),
(5, 'Marianna', 'Stanovic', '1997-02-08');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `empl_id` int(11) NOT NULL,
  `empl_name` varchar(55) NOT NULL,
  `empl_surname` varchar(55) NOT NULL,
  `empl_salary` int(11) NOT NULL,
  `fk_offi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`empl_id`, `empl_name`, `empl_surname`, `empl_salary`, `fk_offi_id`) VALUES
(1, 'Heinz', 'Keinz', 1234, 2),
(2, 'Hans Peter', 'Anderson', 2000, 1),
(3, 'Kurt', 'Furt', 2301, 3),
(4, 'Marge', 'Simpson', 1890, 1),
(5, 'Pudge', 'Cutter', 1000, 3),
(6, 'Marry', 'Jane', 2100, 2),
(7, 'Barry', 'Totter', 1794, 3),
(8, 'Margarethe', 'Butter', 2537, 1),
(9, 'Markus', 'Tatunski', 2045, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurances`
--

CREATE TABLE `insurances` (
  `insu_id` int(11) NOT NULL,
  `insu_cost` int(11) NOT NULL,
  `insu_name` varchar(55) NOT NULL,
  `fk_insu_comp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `insurances`
--

INSERT INTO `insurances` (`insu_id`, `insu_cost`, `insu_name`, `fk_insu_comp_id`) VALUES
(1, 123, 'Full Kasko', 1),
(2, 94, 'Half Kasko', 4),
(3, 112, '2-thirds Kasko?', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance_companies`
--

CREATE TABLE `insurance_companies` (
  `insu_comp_id` int(11) NOT NULL,
  `insu_comp_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `insurance_companies`
--

INSERT INTO `insurance_companies` (`insu_comp_id`, `insu_comp_name`) VALUES
(1, 'Best Insurances World'),
(2, 'Generali'),
(3, 'InsuCom'),
(4, 'Generic Insurance Company');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoices`
--

CREATE TABLE `invoices` (
  `invo_id` int(11) NOT NULL,
  `invo_price` int(11) NOT NULL,
  `invo_date` date NOT NULL,
  `invo_description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoices`
--

INSERT INTO `invoices` (`invo_id`, `invo_price`, `invo_date`, `invo_description`) VALUES
(1, 1300, '2018-02-20', 'I dont know what i would write into here.'),
(2, 2759, '2018-02-02', 'Maybe just some comments'),
(3, 809, '2018-01-23', 'Like unusual stuff'),
(4, 3333, '2018-03-03', 'customer has 3 legs'),
(5, 5930, '2018-02-20', 'Susi, first customer to take the Ferrari');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `loc_id` int(3) NOT NULL,
  `loc_start_returm` enum('start','returm') NOT NULL,
  `loc_date` date NOT NULL,
  `loc_capacity` int(10) NOT NULL,
  `loc_address` varchar(55) NOT NULL,
  `fk_loc_city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`loc_id`, `loc_start_returm`, `loc_date`, `loc_capacity`, `loc_address`, `fk_loc_city_id`) VALUES
(1, 'start', '2018-02-09', 55, 'Holzergasse 4', 1),
(2, 'returm', '2018-02-22', 20, 'Am Feld 3', 2),
(3, 'start', '2018-01-03', 120, 'Deutschlandgasse 24', 3),
(4, 'returm', '2018-02-10', 90, 'Burgerstraße 92', 5),
(5, 'start', '2018-02-01', 30, 'Graz Straße', 4),
(6, 'returm', '2018-02-27', 120, 'Straße 12', 1),
(7, 'start', '2018-02-05', 50, 'Straße in Hamburg', 5),
(8, 'returm', '2018-02-16', 82, 'Straße 13', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loc_cities`
--

CREATE TABLE `loc_cities` (
  `loc_city_id` int(3) NOT NULL,
  `loc_city_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `loc_cities`
--

INSERT INTO `loc_cities` (`loc_city_id`, `loc_city_name`) VALUES
(1, 'Vienna'),
(2, 'Himberg'),
(3, 'Berlin'),
(4, 'Graz'),
(5, 'Hamburg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `offices`
--

CREATE TABLE `offices` (
  `offi_id` int(11) NOT NULL,
  `offi_name` varchar(55) NOT NULL,
  `offi_location` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `offices`
--

INSERT INTO `offices` (`offi_id`, `offi_name`, `offi_location`) VALUES
(1, 'ViennaBase', 'Vienna, 11th District'),
(2, 'BerlinCave', 'Berlin, Kreuzberg'),
(3, 'GlanzGraz', 'Graz, District 5?');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ps_classes`
--

CREATE TABLE `ps_classes` (
  `ps_class_id` int(3) NOT NULL,
  `ps_range` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ps_classes`
--

INSERT INTO `ps_classes` (`ps_class_id`, `ps_range`) VALUES
(1, '70ps-85ps'),
(2, '86ps-90ps'),
(3, '91ps-110'),
(4, '111ps-130');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ac_types`
--
ALTER TABLE `ac_types`
  ADD PRIMARY KEY (`ac_type_id`);

--
-- Indizes für die Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`ac_id`),
  ADD KEY `fk_invo_id` (`fk_invo_id`,`fk_ac_type_id`),
  ADD KEY `fk_ac_type_id` (`fk_ac_type_id`);

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_model_id` (`fk_model_id`),
  ADD KEY `fk_ps_class_id` (`fk_ps_class_id`),
  ADD KEY `fk_insu_id` (`fk_insu_id`),
  ADD KEY `fk_invo_id` (`fk_invo_id`),
  ADD KEY `fk_offi_id` (`fk_offi_id`),
  ADD KEY `fk_loc_start_id` (`fk_loc_start_id`),
  ADD KEY `fk_loc_return_id` (`fk_loc_return_id`),
  ADD KEY `fk_cust_id` (`fk_cust_id`);

--
-- Indizes für die Tabelle `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`model_id`);

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`empl_id`),
  ADD KEY `fk_offi_id` (`fk_offi_id`);

--
-- Indizes für die Tabelle `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`insu_id`),
  ADD KEY `fk_insu_comp_id` (`fk_insu_comp_id`) USING BTREE;

--
-- Indizes für die Tabelle `insurance_companies`
--
ALTER TABLE `insurance_companies`
  ADD PRIMARY KEY (`insu_comp_id`);

--
-- Indizes für die Tabelle `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invo_id`);

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`loc_id`),
  ADD KEY `fk_loc_city_id` (`fk_loc_city_id`);

--
-- Indizes für die Tabelle `loc_cities`
--
ALTER TABLE `loc_cities`
  ADD PRIMARY KEY (`loc_city_id`);

--
-- Indizes für die Tabelle `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`offi_id`);

--
-- Indizes für die Tabelle `ps_classes`
--
ALTER TABLE `ps_classes`
  ADD PRIMARY KEY (`ps_class_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ac_types`
--
ALTER TABLE `ac_types`
  MODIFY `ac_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `car_models`
--
ALTER TABLE `car_models`
  MODIFY `model_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `employees`
--
ALTER TABLE `employees`
  MODIFY `empl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `insurances`
--
ALTER TABLE `insurances`
  MODIFY `insu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `insurance_companies`
--
ALTER TABLE `insurance_companies`
  MODIFY `insu_comp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `locations`
--
ALTER TABLE `locations`
  MODIFY `loc_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `loc_cities`
--
ALTER TABLE `loc_cities`
  MODIFY `loc_city_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `offices`
--
ALTER TABLE `offices`
  MODIFY `offi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `ps_classes`
--
ALTER TABLE `ps_classes`
  MODIFY `ps_class_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_invo_id`) REFERENCES `invoices` (`invo_id`),
  ADD CONSTRAINT `additional_charges_ibfk_2` FOREIGN KEY (`fk_ac_type_id`) REFERENCES `ac_types` (`ac_type_id`);

--
-- Constraints der Tabelle `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_model_id`) REFERENCES `car_models` (`model_id`),
  ADD CONSTRAINT `cars_ibfk_10` FOREIGN KEY (`fk_cust_id`) REFERENCES `customers` (`cust_id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`fk_ps_class_id`) REFERENCES `ps_classes` (`ps_class_id`),
  ADD CONSTRAINT `cars_ibfk_4` FOREIGN KEY (`fk_insu_id`) REFERENCES `insurances` (`insu_id`),
  ADD CONSTRAINT `cars_ibfk_6` FOREIGN KEY (`fk_invo_id`) REFERENCES `invoices` (`invo_id`),
  ADD CONSTRAINT `cars_ibfk_7` FOREIGN KEY (`fk_offi_id`) REFERENCES `offices` (`offi_id`),
  ADD CONSTRAINT `cars_ibfk_8` FOREIGN KEY (`fk_loc_start_id`) REFERENCES `locations` (`loc_id`),
  ADD CONSTRAINT `cars_ibfk_9` FOREIGN KEY (`fk_loc_return_id`) REFERENCES `locations` (`loc_id`);

--
-- Constraints der Tabelle `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`fk_offi_id`) REFERENCES `offices` (`offi_id`);

--
-- Constraints der Tabelle `insurances`
--
ALTER TABLE `insurances`
  ADD CONSTRAINT `insurances_ibfk_1` FOREIGN KEY (`fk_insu_comp_id`) REFERENCES `insurance_companies` (`insu_comp_id`);

--
-- Constraints der Tabelle `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`fk_loc_city_id`) REFERENCES `loc_cities` (`loc_city_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
