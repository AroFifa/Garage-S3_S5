-- create database garage1;

-- \c garage1

create sequence seq_matricule minvalue 1;
create table NiveauEtude(
    id serial,
    nom varchar(20) unique not null,
    primary key(id)
);
create table Specialite(
    id serial,
    nom varchar(20) unique not null,
    description varchar(200),
    primary key(id)
);
create table Genre(
    id serial,
    nom varchar(20) unique not null,
    primary key(id)
);

create table employe(
  id serial primary key,
  matricule varchar(20) unique not null default('#emp'||nextval('seq_matricule')),
  nom varchar(50),
  prenom varchar(50),
  dateNaissance date CHECK (dateNaissance < CURRENT_DATE - INTERVAL '18 years') not null,
  idNiveauEtude integer references NiveauEtude(id),
  idGenre integer references Genre(id) not null

);

create table SpecialiteEmploye(
  idEmploye integer references Employe(id) not null,
  idSpecialite integer references Specialite(id) not null

);

CREATE TABLE Responsable(
  id serial primary key,
  idemploye integer REFERENCES employe(id) not null,
  email varchar(200) unique not null,
  motDePasse varchar(200) not null
);

CREATE TABLE CategorieService(
  id serial primary key,
  nom varchar(80) unique not null
);

CREATE TABLE Service(
  id serial primary key,
  idcategorieService integer REFERENCES CategorieService(id) not null,
  nom varchar(150) not null

);

-- duree en heure
CREATE TABLE AffectationService(
  id serial primary key,
  idemploye integer REFERENCES employe(id) not null,
  idSpecialite integer REFERENCES Specialite(id) not null,
  idService integer REFERENCES Service(id) not null,
  duree smallint not null check(duree>0)

);

-- salaire horaire
CREATE TABLE Salaire (
  id serial primary key,
  idSpecialite integer REFERENCES Specialite(id) not null,
  montant double precision not null default 0 check(montant>=0)
);

CREATE TABLE CategorieClient(
  id serial primary key,
  nom varchar(80) unique not null
);


create sequence seq_clientkey minvalue 1;
CREATE TABLE Client (
  id serial primary key,
  clientkey varchar(20) unique not null default('#cl'||nextval('seq_clientkey')),
  nom varchar(80) not null,
  idcategorieClient integer REFERENCES CategorieClient(id) not null
);

CREATE TABLE MargeBeneficiaire(
  id serial primary key,
  marge smallint not null check(marge>=0 and marge<=100),
  dateModification date not null default current_date ,
  idservice integer REFERENCES Service(id) not null
);


CREATE TABLE Unite(
  id serial primary key,
  nom varchar(80) unique not null
);

CREATE TABLE Materiel (
  id serial primary key,
  nom varchar(80) unique not null,
  prixUnitaire double precision not null check(prixUnitaire>0),
  idunite integer REFERENCES Unite(id) not null
);

CREATE TABLE MaterielUtilise (
  id serial primary key,
  idservice integer REFERENCES Service(id) not null,
  idmateriel integer REFERENCES Materiel(id) not null,
  quantite smallint default 1 check(quantite>0)
);
