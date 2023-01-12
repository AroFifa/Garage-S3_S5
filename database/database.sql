-- create database garage1;

-- \c garage1

create sequence seq_matricule minvalue 1;
create table NiveauEtude(
    id serial,
    nom varchar(20) unique not null,
    primary key(id)
);
insert into NiveauEtude values(1,'Bacc');
insert into NiveauEtude values(2,'License');
insert into NiveauEtude values(3,'Master 1');
insert into NiveauEtude values(4,'Master 2');
insert into NiveauEtude values(5,'Doctorat');

create table Specialite(
    id serial,
    nom varchar(20) unique not null,
    description varchar(200),
    primary key(id)
);
insert into Specialite values(1,'mecanique','reparation et entretien des moteurs');
insert into Specialite values(2,'peinture','revetement des surfaces  metalliques');
insert into Specialite values(3,'electronique','diagnostics et reparations electroniques');
insert into Specialite values(4,'carrosserie','reparation des dommages de carrosseriey');

create table Genre(
    id serial,
    nom varchar(20) unique not null,
    primary key(id)
);

insert into Genre values(1,'Homme');
insert into Genre values(2,'Femme');

create table employe(
  id serial primary key,
  matricule varchar(20) unique not null default('#emp'||nextval('seq_matricule')),
  nom varchar(50),
  prenom varchar(50),
  dateNaissance date CHECK (dateNaissance < CURRENT_DATE - INTERVAL '18 years') not null,
  idNiveauEtude integer references NiveauEtude(id),
  idGenre integer references Genre(id)

);
insert into employe values(1,'','Aro','Roa',2000-02-15,2,3);
insert into employe values(2,'','Anja','Ajna',2000-04-25,1,2);
insert into employe values(3,'','Yohan','Nahoy',2000-12-06,3,3);
insert into employe values(4,'','Ravo','Rova',2000-05-09,1,1);




create table SpecialiteEmploye(
  idEmploye integer references Employe(id),
  idSpecialite integer references Specialite(id)

);

