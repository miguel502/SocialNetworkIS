-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 01, 2014 at 12:14 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `checklist`
--

CREATE TABLE IF NOT EXISTS `checklist` (
`id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `checklist_item`
--

CREATE TABLE IF NOT EXISTS `checklist_item` (
`id` int(11) NOT NULL,
  `checklist_id` int(11) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
`id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `post_checklist_item`
--

CREATE TABLE IF NOT EXISTS `post_checklist_item` (
`id` int(11) NOT NULL,
  `checklist_item_id` int(11) NOT NULL,
  `post_version_id` int(11) NOT NULL,
  `cheked` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post_version`
--

CREATE TABLE IF NOT EXISTS `post_version` (
`id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  `publication_date` datetime NOT NULL,
  `approval_state` varchar(45) DEFAULT NULL,
  `commet` varchar(45) DEFAULT NULL,
  `pending` varchar(45) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
`id` int(11) NOT NULL COMMENT 'Id único del proyecto.',
  `client_id` int(11) NOT NULL COMMENT 'id de identificación del cliente del proyecto.',
  `name` varchar(45) NOT NULL COMMENT 'Nombre del proyecto.',
  `description` varchar(45) DEFAULT NULL COMMENT 'Descripción del proyecto',
  `active` varchar(45) DEFAULT '1' COMMENT 'Indica si el proyecto se encuentra activo o no.',
  `projectcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_user_role`
--

CREATE TABLE IF NOT EXISTS `project_user_role` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_user_role_post`
--

CREATE TABLE IF NOT EXISTS `project_user_role_post` (
`id` int(10) unsigned NOT NULL,
  `post_id` int(11) NOT NULL,
  `project_user_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
`id` int(11) NOT NULL COMMENT 'Id único de etapa',
  `project_id` int(11) NOT NULL COMMENT 'Número de identificación del proyecto',
  `title` varchar(45) NOT NULL COMMENT 'Título de la etapa',
  `description` varchar(45) DEFAULT NULL COMMENT 'Descripción de la etapa.',
  `position` int(11) NOT NULL COMMENT 'Identificador de posición de la etapa.',
  `checklist_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
`id` int(11) NOT NULL,
  `default_role_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `is_admin` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `workflow`
--

CREATE TABLE IF NOT EXISTS `workflow` (
`id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  `checklist_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `ui_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_stage`
--

CREATE TABLE IF NOT EXISTS `workflow_stage` (
`id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checklist`
--
ALTER TABLE `checklist`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQUE_id` (`id`);

--
-- Indexes for table `checklist_item`
--
ALTER TABLE `checklist_item`
 ADD PRIMARY KEY (`id`,`description`), ADD KEY `Checklist_item_idx` (`checklist_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`id`), ADD KEY `post_proyect_idx` (`project_id`);

--
-- Indexes for table `post_checklist_item`
--
ALTER TABLE `post_checklist_item`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQUE_id` (`id`), ADD KEY `post_checklist_item_idx` (`checklist_item_id`), ADD KEY `post_checklist_item_version_idx` (`post_version_id`);

--
-- Indexes for table `post_version`
--
ALTER TABLE `post_version`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `I_UNIQUE` (`id`), ADD KEY `post_version_post_idx` (`post_id`), ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
 ADD PRIMARY KEY (`id`,`name`), ADD UNIQUE KEY `UNIQUE_id` (`id`);

--
-- Indexes for table `project_user_role`
--
ALTER TABLE `project_user_role`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQUE_id` (`id`), ADD KEY `project_user_role_idx` (`role_id`), ADD KEY `project_user_user_idx` (`user_id`), ADD KEY `project_user_role_project_idx` (`project_id`);

--
-- Indexes for table `project_user_role_post`
--
ALTER TABLE `project_user_role_post`
 ADD PRIMARY KEY (`id`), ADD KEY `Post_u_r_p_post_idx` (`post_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQUE_id` (`id`);

--
-- Indexes for table `stage`
--
ALTER TABLE `stage`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQUE_id` (`id`), ADD KEY `checklist_id` (`checklist_id`), ADD KEY `project_id` (`project_id`), ADD KEY `Project_stage_idx` (`project_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username_UNIQUE` (`username`), ADD UNIQUE KEY `UNIQUE_id` (`id`), ADD KEY `default_role_id` (`default_role_id`);

--
-- Indexes for table `workflow`
--
ALTER TABLE `workflow`
 ADD PRIMARY KEY (`id`), ADD KEY `workflow_role_idx` (`rol_id`);

--
-- Indexes for table `workflow_stage`
--
ALTER TABLE `workflow_stage`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQUE_id` (`id`), ADD KEY `workflow_stage_workflow_idx` (`workflow_id`), ADD KEY `workflow_stage_stage_idx` (`stage_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checklist`
--
ALTER TABLE `checklist`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `checklist_item`
--
ALTER TABLE `checklist_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `post_checklist_item`
--
ALTER TABLE `post_checklist_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post_version`
--
ALTER TABLE `post_version`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id único del proyecto.',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `project_user_role_post`
--
ALTER TABLE `project_user_role_post`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stage`
--
ALTER TABLE `stage`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id único de etapa',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `workflow`
--
ALTER TABLE `workflow`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `workflow_stage`
--
ALTER TABLE `workflow_stage`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `checklist_item`
--
ALTER TABLE `checklist_item`
ADD CONSTRAINT `Checklist_item` FOREIGN KEY (`checklist_id`) REFERENCES `checklist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `project_post` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post_checklist_item`
--
ALTER TABLE `post_checklist_item`
ADD CONSTRAINT `post_checklist_item` FOREIGN KEY (`checklist_item_id`) REFERENCES `checklist_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `post_checklist_item_version` FOREIGN KEY (`post_version_id`) REFERENCES `post_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post_version`
--
ALTER TABLE `post_version`
ADD CONSTRAINT `post_version_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `Users` (`id`),
ADD CONSTRAINT `post_version_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_user_role`
--
ALTER TABLE `project_user_role`
ADD CONSTRAINT `project_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `project_user_role_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `project_user_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_user_role_post`
--
ALTER TABLE `project_user_role_post`
ADD CONSTRAINT `Post_u_r_p_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stage`
--
ALTER TABLE `stage`
ADD CONSTRAINT `checklist_stage` FOREIGN KEY (`checklist_id`) REFERENCES `checklist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `project_stage` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
ADD CONSTRAINT `User_role` FOREIGN KEY (`default_role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `workflow`
--
ALTER TABLE `workflow`
ADD CONSTRAINT `workflow_role` FOREIGN KEY (`rol_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `workflow_stage`
--
ALTER TABLE `workflow_stage`
ADD CONSTRAINT `workflow_stage_stage` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `workflow_stage_workflow` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
