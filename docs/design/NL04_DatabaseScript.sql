/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     8/31/2014 11:38:54 AM                        */
/*==============================================================*/


drop table if exists CHITIETDUONG;

drop table if exists COMMENT;

drop table if exists DIACHI;

drop table if exists DUONG;

drop table if exists HINH;

drop table if exists LOAI;

drop table if exists LOAIPHONG;

drop table if exists NHATRO;

drop table if exists PERSISTENTLOGIN;

drop table if exists PHUONG;

drop table if exists QUAN;

drop table if exists THICH;

drop table if exists TOADO;

drop table if exists USER;

drop table if exists USERROLE;

/*==============================================================*/
/* Table: CHITIETDUONG                                          */
/*==============================================================*/
create table CHITIETDUONG
(
   CHITIETDUONGID       int not null auto_increment,
   DUONGID              int not null,
   PHUONGID             int not null,
   primary key (CHITIETDUONGID)
);

/*==============================================================*/
/* Table: COMMENT                                               */
/*==============================================================*/
create table COMMENT
(
   COMMENTID            int not null,
   NHATROID             int not null,
   USERNAME             varchar(100) not null,
   COMMENT              varchar(200) not null,
   DATE                 timestamp,
   primary key (COMMENTID)
);

/*==============================================================*/
/* Table: DIACHI                                                */
/*==============================================================*/
create table DIACHI
(
   DIACHIID             int not null auto_increment,
   QUANID               int not null,
   SONHA                varchar(100),
   primary key (DIACHIID)
);

/*==============================================================*/
/* Table: DUONG                                                 */
/*==============================================================*/
create table DUONG
(
   DUONGID              int not null auto_increment,
   TENDUONG             varchar(100) not null,
   primary key (DUONGID)
);

/*==============================================================*/
/* Table: HINH                                                  */
/*==============================================================*/
create table HINH
(
   HINHID               int not null auto_increment,
   NHATROID             int not null,
   DUONGDAN             varchar(200) not null,
   primary key (HINHID)
);

/*==============================================================*/
/* Table: LOAI                                                  */
/*==============================================================*/
create table LOAI
(
   LOAIID               int not null auto_increment,
   TENLOAI              varchar(20) not null,
   primary key (LOAIID)
);

/*==============================================================*/
/* Table: LOAIPHONG                                             */
/*==============================================================*/
create table LOAIPHONG
(
   LOAIPHONGID          int not null auto_increment,
   NHATROID             int not null,
   DIENTICH             int not null,
   SONGUOI              int not null,
   GIA                  float(8,2) not null,
   SOLUONG              int not null,
   MOTALOAIPHONG        varchar(200),
   primary key (LOAIPHONGID)
);

/*==============================================================*/
/* Table: NHATRO                                                */
/*==============================================================*/
create table NHATRO
(
   NHATROID             int not null auto_increment,
   TOADOID              int not null,
   DIACHIID             int not null,
   LOAIID               int not null,
   USERNAME             varchar(100) not null,
   SDT                  varchar(12) not null,
   EMAIL                varchar(50),
   TRANGTHAI            int not null,
   MOTANHATRO           varchar(200),
   NGAYDANG             datetime,
   NGAYYEUCAU           datetime,
   primary key (NHATROID)
);

/*==============================================================*/
/* Table: PERSISTENTLOGIN                                       */
/*==============================================================*/
create table PERSISTENTLOGIN
(
   SERIES               int not null auto_increment,
   USERNAMETEMP         varchar(200) not null,
   TOKEN                varchar(64) not null,
   LAST_USED            timestamp,
   primary key (SERIES)
);

/*==============================================================*/
/* Table: PHUONG                                                */
/*==============================================================*/
create table PHUONG
(
   PHUONGID             int not null auto_increment,
   QUANID               int not null,
   TENPHUONG            varchar(100) not null,
   primary key (PHUONGID)
);

/*==============================================================*/
/* Table: QUAN                                                  */
/*==============================================================*/
create table QUAN
(
   QUANID               int not null auto_increment,
   TENQUAN              varchar(100) not null,
   primary key (QUANID)
);

/*==============================================================*/
/* Table: THICH                                                 */
/*==============================================================*/
create table THICH
(
   THICHID              int not null auto_increment,
   NHATROID             int not null,
   USERNAME             varchar(100) not null,
   DATE                 timestamp,
   primary key (THICHID)
);

/*==============================================================*/
/* Table: TOADO                                                 */
/*==============================================================*/
create table TOADO
(
   TOADOID              int not null auto_increment,
   X                    float not null,
   Y                    float not null,
   primary key (TOADOID)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   USERNAME             varchar(100) not null,
   PASSWORD             varchar(10) not null,
   EMAIL                varchar(50),
   ENABLED              bool,
   primary key (USERNAME)
);

/*==============================================================*/
/* Table: USERROLE                                              */
/*==============================================================*/
create table USERROLE
(
   USERROLEID           int not null auto_increment,
   USERNAME             varchar(100) not null,
   ROLE                 varchar(45) not null,
   primary key (USERROLEID)
);

alter table CHITIETDUONG add constraint FK_CHITIETDUONG foreign key (DUONGID)
      references DUONG (DUONGID) on delete restrict on update restrict;

alter table CHITIETDUONG add constraint FK_CHITIETDUONG2 foreign key (PHUONGID)
      references PHUONG (PHUONGID) on delete restrict on update restrict;

alter table COMMENT add constraint FK_CT_COMMENT_NGUOIDUNG foreign key (USERNAME)
      references USER (USERNAME) on delete restrict on update restrict;

alter table COMMENT add constraint FK_CT_COMMENT_NHATRO foreign key (NHATROID)
      references NHATRO (NHATROID) on delete restrict on update restrict;

alter table DIACHI add constraint FK_CT_QUAN foreign key (QUANID)
      references QUAN (QUANID) on delete restrict on update restrict;

alter table HINH add constraint FK_DS_HINH foreign key (NHATROID)
      references NHATRO (NHATROID) on delete restrict on update restrict;

alter table LOAIPHONG add constraint FK_CT_LOAIPHONG foreign key (NHATROID)
      references NHATRO (NHATROID) on delete restrict on update restrict;

alter table NHATRO add constraint FK_CT_DIACHI foreign key (DIACHIID)
      references DIACHI (DIACHIID) on delete restrict on update restrict;

alter table NHATRO add constraint FK_CT_LOAI foreign key (LOAIID)
      references LOAI (LOAIID) on delete restrict on update restrict;

alter table NHATRO add constraint FK_CT_TOADO foreign key (TOADOID)
      references TOADO (TOADOID) on delete restrict on update restrict;

alter table NHATRO add constraint FK_DS_NHATRODADANG foreign key (USERNAME)
      references USER (USERNAME) on delete restrict on update restrict;

alter table PHUONG add constraint FK_CT_PHUONG foreign key (QUANID)
      references QUAN (QUANID) on delete restrict on update restrict;

alter table THICH add constraint FK_CT_LIKE_NGUOIDUNG foreign key (USERNAME)
      references USER (USERNAME) on delete restrict on update restrict;

alter table THICH add constraint FK_CT_LIKE_NHATRO foreign key (NHATROID)
      references NHATRO (NHATROID) on delete restrict on update restrict;

alter table USERROLE add constraint FK_CT_ROLE foreign key (USERNAME)
      references USER (USERNAME) on delete restrict on update restrict;

