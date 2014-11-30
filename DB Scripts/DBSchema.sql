
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `SocialNetwork`
--
CREATE DATABASE IF NOT EXISTS `SocialNetwork` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `SocialNetwork`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checklist`
--

CREATE TABLE IF NOT EXISTS `checklist` (
`id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checklist_item`
--

CREATE TABLE IF NOT EXISTS `checklist_item` (
`id` int(11) NOT NULL,
  `id_checklist` int(11) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE IF NOT EXISTS `post` (
`id` int(11) NOT NULL,
  `id_project` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_checklist_item`
--

CREATE TABLE IF NOT EXISTS `post_checklist_item` (
`id` int(11) NOT NULL,
  `id_checklist_item` int(11) NOT NULL,
  `id_post_version` int(11) NOT NULL,
  `cheked` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_version`
--

CREATE TABLE IF NOT EXISTS `post_version` (
`id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  `publication_date` datetime NOT NULL,
  `version_author` int(11) DEFAULT NULL,
  `approval_state` varchar(45) DEFAULT NULL,
  `commet` varchar(45) DEFAULT NULL,
  `pending` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project`
--

CREATE TABLE IF NOT EXISTS `project` (
`id` int(11) NOT NULL COMMENT 'Id único del proyecto.',
  `id_client` int(11) NOT NULL COMMENT 'id de identificación del cliente del proyecto.',
  `name` varchar(45) NOT NULL COMMENT 'Nombre del proyecto.',
  `description` varchar(45) DEFAULT NULL COMMENT 'Descripción del proyecto',
  `active` varchar(45) DEFAULT '1' COMMENT 'Indica si el proyecto se encuentra activo o no.',
  `projectcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_user_role`
--

CREATE TABLE IF NOT EXISTS `project_user_role` (
  `id` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project_user_role_post`
--

CREATE TABLE IF NOT EXISTS `project_user_role_post` (
`id` int(10) unsigned NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_project_user_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
`id` int(11) NOT NULL COMMENT 'Id único de etapa',
  `id_project` int(11) NOT NULL COMMENT 'Número de identificación del proyecto',
  `title` varchar(45) NOT NULL COMMENT 'Título de la etapa',
  `description` varchar(45) DEFAULT NULL COMMENT 'Descripción de la etapa.',
  `position` int(11) NOT NULL COMMENT 'Identificador de posición de la etapa.',
  `id_checklist` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
`id` int(11) NOT NULL,
  `id_default_role` int(11) NOT NULL,
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
-- Estructura de tabla para la tabla `workflow`
--

CREATE TABLE IF NOT EXISTS `workflow` (
`id` int(11) NOT NULL,
  `id_stage` int(11) NOT NULL,
  `id_checklist` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `ui_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `workflow_stage`
--

CREATE TABLE IF NOT EXISTS `workflow_stage` (
`id` int(11) NOT NULL,
  `id_workflow` int(11) NOT NULL,
  `id_stage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `checklist`
--
ALTER TABLE `checklist`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `checklist_item`
--
ALTER TABLE `checklist_item`
 ADD PRIMARY KEY (`id`,`description`), ADD KEY `Checklist_item_idx` (`id_checklist`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`id`), ADD KEY `post_proyect_idx` (`id_project`);

--
-- Indices de la tabla `post_checklist_item`
--
ALTER TABLE `post_checklist_item`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `post_checklist_item_idx` (`id_checklist_item`), ADD KEY `post_checklist_item_version_idx` (`id_post_version`);

--
-- Indices de la tabla `post_version`
--
ALTER TABLE `post_version`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `I_UNIQUE` (`id`), ADD KEY `post_version_post_idx` (`post_id`);

--
-- Indices de la tabla `project`
--
ALTER TABLE `project`
 ADD PRIMARY KEY (`id`,`name`), ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `project_user_role`
--
ALTER TABLE `project_user_role`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `project_user_role_idx` (`id_role`), ADD KEY `project_user_user_idx` (`id_user`), ADD KEY `project_user_role_project_idx` (`id_project`);

--
-- Indices de la tabla `project_user_role_post`
--
ALTER TABLE `project_user_role_post`
 ADD PRIMARY KEY (`id`), ADD KEY `Post_u_r_p_post_idx` (`id_post`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `stage`
--
ALTER TABLE `stage`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `id_checklist` (`id_checklist`), ADD KEY `id_project` (`id_project`), ADD KEY `Project_stage_idx` (`id_project`);

--
-- Indices de la tabla `Users`
--
ALTER TABLE `Users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username_UNIQUE` (`username`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `id_default_role` (`id_default_role`);

--
-- Indices de la tabla `workflow`
--
ALTER TABLE `workflow`
 ADD PRIMARY KEY (`id`), ADD KEY `workflow_role_idx` (`id_rol`);

--
-- Indices de la tabla `workflow_stage`
--
ALTER TABLE `workflow_stage`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `workflow_stage_workflow_idx` (`id_workflow`), ADD KEY `workflow_stage_stage_idx` (`id_stage`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `checklist`
--
ALTER TABLE `checklist`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `checklist_item`
--
ALTER TABLE `checklist_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `post_checklist_item`
--
ALTER TABLE `post_checklist_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `post_version`
--
ALTER TABLE `post_version`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `project`
--
ALTER TABLE `project`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id único del proyecto.',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `project_user_role_post`
--
ALTER TABLE `project_user_role_post`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `stage`
--
ALTER TABLE `stage`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id único de etapa',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `Users`
--
ALTER TABLE `Users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `workflow`
--
ALTER TABLE `workflow`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `workflow_stage`
--
ALTER TABLE `workflow_stage`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `checklist_item`
--
ALTER TABLE `checklist_item`
ADD CONSTRAINT `Checklist_item` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `project_post` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `post_checklist_item`
--
ALTER TABLE `post_checklist_item`
ADD CONSTRAINT `post_checklist_item` FOREIGN KEY (`id_checklist_item`) REFERENCES `checklist_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `post_checklist_item_version` FOREIGN KEY (`id_post_version`) REFERENCES `post_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `post_version`
--
ALTER TABLE `post_version`
ADD CONSTRAINT `post_version_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `project_user_role`
--
ALTER TABLE `project_user_role`
ADD CONSTRAINT `project_user_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `project_user_role_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `project_user_user` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `project_user_role_post`
--
ALTER TABLE `project_user_role_post`
ADD CONSTRAINT `Post_u_r_p_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `stage`
--
ALTER TABLE `stage`
ADD CONSTRAINT `checklist_stage` FOREIGN KEY (`id_checklist`) REFERENCES `checklist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `project_stage` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Users`
--
ALTER TABLE `Users`
ADD CONSTRAINT `User_role` FOREIGN KEY (`id_default_role`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `workflow`
--
ALTER TABLE `workflow`
ADD CONSTRAINT `workflow_role` FOREIGN KEY (`id_rol`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `workflow_stage`
--
ALTER TABLE `workflow_stage`
ADD CONSTRAINT `workflow_stage_stage` FOREIGN KEY (`id_stage`) REFERENCES `stage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `workflow_stage_workflow` FOREIGN KEY (`id_workflow`) REFERENCES `workflow` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
