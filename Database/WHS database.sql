/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  04/05/2017 16:11:22                      */
/*==============================================================*/


drop table if exists ACTUALITE;

drop table if exists ADMIN_0;

drop table if exists ADMIN_1;

drop table if exists CATEGORIE_ACTUALITE;

drop table if exists LANGUE;

drop table if exists LIEU;

drop table if exists MENACES;

drop table if exists R_ACTUALITE_AVOIR_TAG;

drop table if exists TAG;

drop table if exists UTILISATEUR;

/*==============================================================*/
/* Table : ACTUALITE                                            */
/*==============================================================*/
create table ACTUALITE
(
   ID_ACTUALITE         char(22) not null,
   ID_LANGUE            char(22) not null,
   ID_LIEU              char(22) not null,
   IDUSER               int not null,
   ID_A1                int not null,
   ID_MENACE            int not null,
   ID_CATEG_ACTU        int not null,
   TITRE_ACTUALITE      char(100),
   DETAIL_ACTUALITE     text,
   DATE_ACTUALITE       date,
   LIEU_ACTUALITE       varchar(100),
   primary key (ID_ACTUALITE)
);

/*==============================================================*/
/* Table : ADMIN_0                                              */
/*==============================================================*/
create table ADMIN_0
(
   ID_A0                int not null,
   CODE_A0              char(30),
   CAPTION_A0           char(50),
   COORD_X_A0           char(4),
   COORD_Y_A0           char(4),
   primary key (ID_A0)
);

/*==============================================================*/
/* Table : ADMIN_1                                              */
/*==============================================================*/
create table ADMIN_1
(
   ID_A1                int not null,
   ID_A0                int not null,
   CODE_A1              char(30),
   CAPTION_A1           char(50),
   COORD_X_A1           char(8),
   COORD_Y_A1           char(8),
   primary key (ID_A1)
);

/*==============================================================*/
/* Table : CATEGORIE_ACTUALITE                                  */
/*==============================================================*/
create table CATEGORIE_ACTUALITE
(
   ID_CATEG_ACTU        int not null,
   TITRE_CATEG_ACTU     varchar(100),
   TYPE_CATEG_ACTU      varchar(100),
   primary key (ID_CATEG_ACTU)
);

/*==============================================================*/
/* Table : LANGUE                                               */
/*==============================================================*/
create table LANGUE
(
   ID_LANGUE            char(22) not null,
   TITRE_LANGUE         char(22),
   primary key (ID_LANGUE)
);

/*==============================================================*/
/* Table : LIEU                                                 */
/*==============================================================*/
create table LIEU
(
   ID_LIEU              char(22) not null,
   ID_A1                int not null,
   CODE_LIEU            varchar(10),
   LIBELLE_LIEU         char(100),
   HAS_ADMIN1           bool,
   primary key (ID_LIEU)
);

/*==============================================================*/
/* Table : MENACES                                              */
/*==============================================================*/
create table MENACES
(
   ID_MENACE            int not null,
   TITRE_MENACE         varchar(100),
   CODE_MENACE          varchar(100),
   primary key (ID_MENACE)
);

/*==============================================================*/
/* Table : R_ACTUALITE_AVOIR_TAG                                */
/*==============================================================*/
create table R_ACTUALITE_AVOIR_TAG
(
   ID_ACTUALITE         char(22) not null,
   ID_TAG               int not null,
   primary key (ID_ACTUALITE, ID_TAG)
);

/*==============================================================*/
/* Table : TAG                                                  */
/*==============================================================*/
create table TAG
(
   ID_TAG               int not null,
   CODE_TAG             char(50),
   LIBELLE_TAG          varchar(100),
   primary key (ID_TAG)
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR
(
   IDUSER               int not null,
   USERNAME             char(10),
   PASSWORD             char(10),
   EMAIL_USER           char(100),
   primary key (IDUSER)
);

alter table ACTUALITE add constraint FK_R_ACTUALITE_AVOIR_LANGUE foreign key (ID_LANGUE)
      references LANGUE (ID_LANGUE) on delete restrict on update restrict;

alter table ACTUALITE add constraint FK_R_ACTUALITE_AVOIR_LIEU foreign key (ID_LIEU)
      references LIEU (ID_LIEU) on delete restrict on update restrict;

alter table ACTUALITE add constraint FK_R_ACTUALITE_AVOIR_MENACES foreign key (ID_MENACE)
      references MENACES (ID_MENACE) on delete restrict on update restrict;

alter table ACTUALITE add constraint FK_R_ACTUALITE_AVOIR_THEME foreign key (ID_CATEG_ACTU)
      references CATEGORIE_ACTUALITE (ID_CATEG_ACTU) on delete restrict on update restrict;

alter table ACTUALITE add constraint FK_R_ADMIN_1_AVOIR_ACTUALITE foreign key (ID_A1)
      references ADMIN_1 (ID_A1) on delete restrict on update restrict;

alter table ACTUALITE add constraint FK_R_USER_ADD_ACTUALITE foreign key (IDUSER)
      references UTILISATEUR (IDUSER) on delete restrict on update restrict;

alter table ADMIN_1 add constraint FK_R_ADMIN1_AVOIR_ADMIN0 foreign key (ID_A0)
      references ADMIN_0 (ID_A0) on delete restrict on update restrict;

alter table LIEU add constraint FK_R_LIEU_AVOIR_ADMIN_1 foreign key (ID_A1)
      references ADMIN_1 (ID_A1) on delete restrict on update restrict;

alter table R_ACTUALITE_AVOIR_TAG add constraint FK_R_ACTUALITE_AVOIR_TAG foreign key (ID_ACTUALITE)
      references ACTUALITE (ID_ACTUALITE) on delete restrict on update restrict;

alter table R_ACTUALITE_AVOIR_TAG add constraint FK_R_ACTUALITE_AVOIR_TAG2 foreign key (ID_TAG)
      references TAG (ID_TAG) on delete restrict on update restrict;

