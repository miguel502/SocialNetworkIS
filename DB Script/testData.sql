insert into role (title, description) values
('admin', 'El administrador del sistema.'),
('community manager', 'El encargado de manejar los posts.'),
('diseñador', 'Encargado de los diseños de los posts.'),
('tester', 'Encargado de confirmar que el conteindo de los posts este correcto'),
('cliente', 'Un cliente que contrata uno o varios proyectos').

insert into users (username, password, name, lastname, email, default_role_id) values
('msaiz', 'miguel123', 'miguel', 'saiz', 'miguelsaizo@gmail.com', 2),
('lpaulino', 'leonel123', 'leonel', 'paulino', 'leonel.paulino@gmail.com',1),
('mcalderon', 'miguel123', 'miguel', 'calderon', 'miguelcalderon6@gmail.com',3),
('vpena', 'victor123', 'victor', 'peña', 'victor_13_@msn.com',4),
('mrosario', 'michael123', 'michael', 'rosario', 'mchl0208@gmail.com',1),
('jbonetti', 'bonetti123', 'jose', 'bonetti', 'jose.bonetti@gmail.com', 5);

insert into project(client_id, name) values
(6, 'Proyecto de curso'),
(6, 'GBH');

insert into project_user_role (project_id, user_id, role_id) values
(1,1,2),
(1,2,1),
(1,3,3),
(1,4,4),
(1,6,5),
(2,1,2),
(2,5,1),
(2,3,3),
(2,4,4),
(2,6,5);

insert into post (project_id) values
(1),
(2),
(2);

insert into post_version (publication_date, pending, users_id,
tipo, publico, objetivo, copy, hashtag, textoarte_text, fuente) values
('2014-11-30 18:30:05',1,2,'Blog post','Público en general', 'Información de salud',
'Consejos para comer saludablemente #AmaditaSalud #ConsejosAmadita', '#AmaditaSalud #ConsejosAmadita',
'Coma de manera saludable Coma sólo porque tiene hambre, no porque está aburrido, cansado o estresado. Utilice alternativas cuando no tiene hambre:',
'FamilyDoctor.gov');

insert into checklist (title) values
('default'),
('amadita');

insert into checklist_item (checklist_id, description) values
(1, 'Tiene contenido'),
(1, 'Esta bonito'),
(2, 'Es rojo'),
(2, 'Tiene texto');

insert into stage (project_id, title, description, position,checklist_id) values
(2, 'Creación de contenido', 'Aqui se crea el post.', 1, 2),
(2, 'Diseño', 'Aqui se agrega la grafica del post.', 2, 2);

insert into workflow (1, ) values
().

insert into workflow_stage (workflow_id, stage_id) values