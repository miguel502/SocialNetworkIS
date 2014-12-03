-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2014 at 10:15 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `SocialNetwork`
--
CREATE DATABASE IF NOT EXISTS `SocialNetwork` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `SocialNetwork`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `default_role_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `is_admin` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `default_role_id`, `username`, `password`, `name`, `lastname`, `email`, `active`, `is_admin`) VALUES
(1, 2, 'msaiz', 'miguel123', 'miguel', 'saiz', 'miguelsaizo@gmail.com', 1, '0'),
(2, 1, 'lpaulino', 'leonel123', 'leonel', 'paulino', 'leonel.paulino@gmail.com', 1, '0'),
(3, 3, 'mcalderon', 'miguel123', 'miguel', 'calderon', 'miguelcalderon6@gmail.com', 1, '0'),
(4, 4, 'vpena', 'victor123', 'victor', 'peña', 'victor_13_@msn.com', 1, '0'),
(5, 1, 'mrosario', 'michael123', 'michael', 'rosario', 'mchl0208@gmail.com', 1, '0'),
(6, 5, 'jbonetti', 'bonetti123', 'jose', 'bonetti', 'jose.bonetti@gmail.com', 1, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username_UNIQUE` (`username`), ADD UNIQUE KEY `UNIQUE_id` (`id`), ADD KEY `default_role_id` (`default_role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `User_role` FOREIGN KEY (`default_role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
