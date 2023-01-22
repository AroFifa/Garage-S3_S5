CREATE DATABASE Garage;
\c garage
CREATE TABLE Niveau(
    idNiveau serial PRIMARY KEY,
    nom VARCHAR(20)
);

CREATE TABLE Genre(
    idGenre serial PRIMARY KEY,
    nom Varchar(20)
);


CREATE TABLE Specialite(
    idSpecialite serial PRIMARY KEY,
    nom Varchar(20)
);

CREATE TABLE Employer(
    id serial PRIMARY KEY,
    nom Varchar(100),
    Prenom VARCHAR(50),
    dateDeNaissance DATE,
    idGenre serial,
    idNiveau serial,
    CONSTRAINT fk_genre FOREIGN KEY(idgenre) REFERENCES Genre(idGenre),
    CONSTRAINT fk_niveau FOREIGN KEY(idniveau) REFERENCES niveau(idNiveau)
);
CREATE SEQUENCE SeqEmployer START WITH 1 increment by 1; 
CREATE TABLE Specialite_emp(
    idEmp serial,
    idspec serial,
    CONSTRAINT fk_spec FOREIGN KEY(idspec) REFERENCES Specialite(idSpecialite),
    CONSTRAINT fk_emp FOREIGN KEY(idemp) REFERENCES Employer(id)
);
CREATE TABLE prix_specialite(
    idspecialite serial,
    prix INTEGER,
    CONSTRAINT fk_specialite FOREIGN KEY(idspecialite) REFERENCES Specialite(idSpecialite)
);
CREATE TABLE service(
    idservice serial PRIMARY KEY,
    nom Varchar(50)
);
CREATE TABLE service_specialite(
    idservice serial ,
    idspecialite serial,
    dureeMinute float,
    CONSTRAINT fk_serv FOREIGN KEY(idservice) REFERENCES service(idservice),
    CONSTRAINT fk_speci FOREIGN KEY(idspecialite) REFERENCES Specialite(idSpecialite)
);


INSERT INTO Niveau VALUES(1,'CEPE'),(2,'BEPC'),(3,'BACC'),(4,'Licence'),(5,'MASTER'),(6,'DOCTORAT'); 
INSERT INTO Genre VALUES(1,'Homme'),(2,'Femme');
INSERT INTO Specialite VALUES(1,'Mecanicien'),(2,'Electricien'),(3,'Laveur'),(4,'Technicien'),(5,'Soudure');
INSERT INTO prix_specialite VALUES(1,20000),(2,15000),(3,5000),(4,15000),(5,16000);
INSERT INTO service VALUES(default,'Vidange'),(default,'lavage'),(default,'soudure');
INSERT INTO service_specialite VALUES(1,1,15),(1,3,30),(2,3,30),(3,2,10),(3,5,40);


select service.nom,specialite.nom,service_specia lite.dureeMinute from service_specialite
    join service on service.idservice = service_specialite.idservice
    join specialite on specialite.idspecialite = service_specialite.idspecialite;


CREATE View getAllSAndS as(select service.nom  as nomService,
specialite.nom as nomSpecialite,
service_specialite.dureeMinute,
prix_specialite.prix as prixSpecParHeure from service_specialite
    join service on service.idservice = service_specialite.idservice
    join specialite on specialite.idspecialite = service_specialite.idspecialite
    join prix_specialite on prix_specialite.idspecialite = service_specialite.idspecialite);


