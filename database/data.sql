INSERT INTO NiveauEtude (nom) VALUES ('Bac'), ('Bac+2'), ('Bac+3'), ('Bac+5');
INSERT INTO Specialite (nom, description) VALUES ('Mécanique', 'Spécialiste en réparation de moteurs et systèmes mécaniques'), ('Carrosserie', 'Spécialiste en réparation de carrosseries et peinture'), ('Electronique', 'Spécialiste en réparation de systèmes électroniques et électriques'), ('Vente', 'Spécialiste en vente de véhicules neufs et d''occasion');
INSERT INTO Genre (nom) VALUES ('Homme'), ('Femme');
INSERT INTO employe (matricule, nom, prenom, dateNaissance, idNiveauEtude, idGenre) VALUES ('#emp1', 'Doe', 'John', '1990-01-01', 1, 1), ('#emp2', 'Smith', 'Jane', '1985-05-20', 2, 2), ('#emp3', 'Johnson', 'Mark', '1978-03-14', 3, 1), ('#emp4', 'Williams', 'Emily', '1983-07-22', 2, 2), ('#emp5', 'Jones', 'Michael', '1976-12-01', 3, 1);
INSERT INTO SpecialiteEmploye (idEmploye, idSpecialite) VALUES (1, 1), (1, 2), (2, 1), (3, 3), (4, 2), (5, 1), (5, 3);

INSERT INTO CategorieService (nom) VALUES ('Entretien'), ('Réparation'), ('Vente');
INSERT INTO Service (idcategorieService, nom) VALUES (1, 'Vidange'), (1, 'Changement de filtre'), (2, 'Remplacement de la courroie de distribution'), (2, 'Remplacement de la suspension'), (3, 'Vente de véhicules neufs'), (3, 'Vente de véhicules d''occasion');
INSERT INTO CategorieClient (nom) VALUES ('Particulier'), ('Entreprise');
INSERT INTO Client (clientkey, nom, idcategorieClient) VALUES ('#cl1', 'Dupont', 1), ('#cl2', 'Durand', 1), ('#cl3', 'Societe A', 2);
INSERT INTO Responsable (idemploye, email, motDePasse) VALUES (1, 'john.doe@garage.com', 'passw0rd'), (2, 'jane.smith@garage.com', 'mysecret');
INSERT INTO AffectationService (idemploye, idSpecialite, idService, duree) VALUES (1, 1, 1, 2), (1, 1, 2, 1), (2, 2, 3, 3), (3, 3, 4, 4), (4, 2, 5, 2);
INSERT INTO Salaire (idSpecialite, montant) VALUES (1, 15000.5), (2, 20000.0), (3, 25000.0);

INSERT INTO MargeBeneficiaire (marge,idservice) VALUES (10,1);
INSERT INTO MargeBeneficiaire (marge,idservice) VALUES (15,2);
INSERT INTO MargeBeneficiaire (marge,idservice) VALUES (20,3);
INSERT INTO MargeBeneficiaire (marge,idservice) VALUES (20,4);
INSERT INTO MargeBeneficiaire (marge,idservice) VALUES (15,5);
INSERT INTO MargeBeneficiaire (marge,idservice) VALUES (30,6);


INSERT INTO MargeBeneficiaire (marge,dateModification,idservice) VALUES (15,'2022-12-04',1);

INSERT INTO Unite (nom) VALUES ('litre'), ('unité'), ('mètre');
INSERT INTO Materiel (nom, prixUnitaire,idunite) VALUES ('huile', 65000,1), ('filtre', 30000,2), ('courroie', 150000,2);
INSERT INTO MaterielUtilise (idservice, idmateriel) VALUES (1,1), (1,2), (2,3);

INSERT INTO Materiel (nom, prixUnitaire,idunite) VALUES 
('vis', 20000,2), 
('écrou', 15000,2), 
('rondelle', 10000,2), 
('boulon', 25000,2), 
('huile de transmission', 75000,1), 
('huile de frein', 60000,1),
('huile de direction', 65000,1),
('plaquettes de frein', 100000,2),
('disque de frein', 150000,2),
('ampoule', 50000,2);

INSERT INTO Materiel (nom, prixUnitaire, idunite) VALUES 
('Pneus', 200000,2), 
('batterie', 150000,2), 
('jantes', 100000,2);

INSERT INTO MaterielUtilise (idservice, idmateriel) VALUES
(1,1), (1,2), 
(2,2), 
(3,3), (3,4), (3,5), 
(4,6), (4,7), (4,8),
(5,11),(5,12),(5,13),
(6,14),(6,15),(6,16);

