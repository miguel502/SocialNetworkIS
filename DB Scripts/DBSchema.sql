CREATE TABLE `checklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `checklist_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_checklist` int(11) NOT NULL,
  `descritpe` varchar(250) NOT NULL,
  PRIMARY KEY (`id`,`descritpe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `post_checklist_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_checklist_item` int(11) NOT NULL,
  `id_post_version` int(11) NOT NULL,
  `cheked` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `post_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  `publication_date` datetime NOT NULL,
  `version_author` int(11) DEFAULT NULL,
  `approval_state` varchar(45) DEFAULT NULL,
  `commet` varchar(45) DEFAULT NULL,
  `pending` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `I_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id único del proyecto.',
  `id_client` int(11) NOT NULL COMMENT 'id de identificación del cliente del proyecto.',
  `name` varchar(45) NOT NULL COMMENT 'Nombre del proyecto.',
  `description` varchar(45) DEFAULT NULL COMMENT 'Descripción del proyecto',
  `active` varchar(45) DEFAULT '1' COMMENT 'Indica si el proyecto se encuentra activo o no.',
  `projectcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `project_user_role` (
  `id` int(11) NOT NULL,
  `id_project` varchar(45) NOT NULL,
  `id_user` varchar(45) NOT NULL,
  `id_role` varchar(45) NOT NULL,
  `active` varchar(45) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `project_user_role_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `id_project_user_role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id único de etapa',
  `id_project` int(11) NOT NULL COMMENT 'Número de identificación del proyecto',
  `title` varchar(45) NOT NULL COMMENT 'Título de la etapa',
  `description` varchar(45) DEFAULT NULL COMMENT 'Descripción de la etapa.',
  `position` int(11) NOT NULL COMMENT 'Identificador de posición de la etapa.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_stage` int(11) NOT NULL,
  `id_checklist` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `ui_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `workflow_stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_workflow` int(11) NOT NULL,
  `id_stage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_default_role` int(11) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `is_admin` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
