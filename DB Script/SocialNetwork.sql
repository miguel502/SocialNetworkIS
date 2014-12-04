-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 04, 2014 at 01:20 AM
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
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
`id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `project_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `post_version`
--

CREATE TABLE IF NOT EXISTS `post_version` (
`id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  `publication_date` datetime NOT NULL,
  `approval_state` tinyint(1) DEFAULT NULL,
  `feedback` text,
  `pending` varchar(45) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `publico` varchar(30) DEFAULT NULL,
  `objetivo` varchar(30) DEFAULT NULL,
  `copy` varchar(200) DEFAULT NULL,
  `hashtag` varchar(200) DEFAULT NULL,
  `nota` varchar(200) DEFAULT NULL,
  `textoarte_url` varchar(100) DEFAULT NULL,
  `textoarte_text` varchar(500) DEFAULT NULL,
  `fuente` varchar(50) DEFAULT NULL,
  `workflow_stage_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `post_version`
--

INSERT INTO `post_version` (`id`, `post_id`, `image_url`, `publication_date`, `approval_state`, `feedback`, `pending`, `users_id`, `tipo`, `publico`, `objetivo`, `copy`, `hashtag`, `nota`, `textoarte_url`, `textoarte_text`, `fuente`, `workflow_stage_id`) VALUES
(1, 1, NULL, '2014-11-30 18:30:05', NULL, NULL, '1', 2, 'Blog post', 'Público en general', 'Información de salud', 'Consejos para comer saludablemente #AmaditaSalud #ConsejosAmadita', '#AmaditaSalud #ConsejosAmadita', NULL, NULL, 'Coma de manera saludable Coma sólo porque tiene hambre, no porque está aburrido, cansado o estresado. Utilice alternativas cuando no tiene hambre:', 'FamilyDoctor.gov', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
`id` int(11) NOT NULL COMMENT 'Id único del proyecto.',
  `name` varchar(45) NOT NULL COMMENT 'Nombre del proyecto.',
  `description` varchar(45) DEFAULT NULL COMMENT 'Descripción del proyecto',
  `active` varchar(45) DEFAULT '1' COMMENT 'Indica si el proyecto se encuentra activo o no.'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `name`, `description`, `active`) VALUES
(1, 'Proyecto de curso', NULL, '1'),
(2, 'GBH', NULL, '1');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `project_user_role`
--

INSERT INTO `project_user_role` (`id`, `project_id`, `user_id`, `role_id`, `active`) VALUES
(1, 1, 1, 2, 1),
(2, 1, 2, 1, 1),
(3, 1, 3, 3, 1),
(4, 1, 4, 4, 1),
(5, 1, 6, 5, 1),
(6, 2, 1, 2, 1),
(7, 2, 5, 1, 1),
(8, 2, 3, 3, 1),
(9, 2, 4, 4, 1),
(10, 2, 6, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_user_role_post`
--

CREATE TABLE IF NOT EXISTS `project_user_role_post` (
`id` int(10) unsigned NOT NULL,
  `post_id` int(11) NOT NULL,
  `project_user_role_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `project_user_role_post`
--

INSERT INTO `project_user_role_post` (`id`, `post_id`, `project_user_role_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `title`, `description`) VALUES
(1, 'admin', 'El administrador del sistema.'),
(2, 'community manager', 'El encargado de manejar los posts.'),
(3, 'diseñador', 'Encargado de los diseños de los posts.'),
(4, 'tester', 'Encargado de confirmar que el conteindo de los posts este correcto'),
(5, 'cliente', 'Un cliente que contrata uno o varios proyectos');

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
`id` int(11) NOT NULL COMMENT 'Id único de etapa',
  `project_id` int(11) NOT NULL COMMENT 'Número de identificación del proyecto',
  `title` varchar(45) NOT NULL COMMENT 'Título de la etapa',
  `description` varchar(45) DEFAULT NULL COMMENT 'Descripción de la etapa.',
  `position` int(11) NOT NULL COMMENT 'Identificador de posición de la etapa.'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stage`
--

INSERT INTO `stage` (`id`, `project_id`, `title`, `description`, `position`) VALUES
(1, 2, 'Creación de contenido', 'Aqui se crea el post.', 1),
(2, 2, 'Diseño', 'Aqui se agrega la grafica del post.', 2);

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

-- --------------------------------------------------------

--
-- Table structure for table `workflow`
--

CREATE TABLE IF NOT EXISTS `workflow` (
`id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `ui_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `workflow`
--

INSERT INTO `workflow` (`id`, `role_id`, `ui_type`) VALUES
(1, 2, NULL),
(2, 4, NULL),
(3, 5, NULL),
(4, 3, NULL),
(5, 4, NULL),
(6, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workflow_stage`
--

CREATE TABLE IF NOT EXISTS `workflow_stage` (
`id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `workflow_stage`
--

INSERT INTO `workflow_stage` (`id`, `workflow_id`, `stage_id`, `position`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 1, 3),
(4, 4, 2, 1),
(5, 5, 2, 2),
(6, 6, 2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`id`), ADD KEY `post_proyect_idx` (`project_id`);

--
-- Indexes for table `post_version`
--
ALTER TABLE `post_version`
 ADD PRIMARY KEY (`id`), ADD KEY `post_version_post_idx` (`post_id`), ADD KEY `users_id` (`users_id`), ADD KEY `idx_workflow_stage_id` (`workflow_stage_id`);

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
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQUE_id` (`id`), ADD KEY `project_id` (`project_id`), ADD KEY `Project_stage_idx` (`project_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username_UNIQUE` (`username`), ADD UNIQUE KEY `id` (`id`), ADD KEY `default_role_id` (`default_role_id`);

--
-- Indexes for table `workflow`
--
ALTER TABLE `workflow`
 ADD PRIMARY KEY (`id`), ADD KEY `role_idx` (`role_id`);

--
-- Indexes for table `workflow_stage`
--
ALTER TABLE `workflow_stage`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQUE_id` (`id`), ADD KEY `workflow_stage_workflow_idx` (`workflow_id`), ADD KEY `workflow_stage_stage_idx` (`stage_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `post_version`
--
ALTER TABLE `post_version`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id único del proyecto.',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `project_user_role`
--
ALTER TABLE `project_user_role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `project_user_role_post`
--
ALTER TABLE `project_user_role_post`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `stage`
--
ALTER TABLE `stage`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id único de etapa',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `workflow`
--
ALTER TABLE `workflow`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `workflow_stage`
--
ALTER TABLE `workflow_stage`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `project_post` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post_version`
--
ALTER TABLE `post_version`
ADD CONSTRAINT `fk_ workflow_stage_id` FOREIGN KEY (`workflow_stage_id`) REFERENCES `workflow_stage` (`id`),
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
ADD CONSTRAINT `project_stage` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`default_role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `workflow`
--
ALTER TABLE `workflow`
ADD CONSTRAINT `role_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `workflow_stage`
--
ALTER TABLE `workflow_stage`
ADD CONSTRAINT `workflow_stage_stage` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `workflow_stage_workflow` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
