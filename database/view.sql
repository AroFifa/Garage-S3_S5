-- -- charges salariales
-- CREATE OR REPLACE VIEW v_charge_salariale AS
-- SELECT s.id idservice , cs.nom categorie, s.nom description,sum(montant*a.duree) montant
-- from CategorieService cs join Service s on cs.id=s.idcategorieService
-- join AffectationService a on s.id=a.idservice
-- join specialite spec on a.idspecialite=spec.id
-- join salaire sal on spec.id=sal.idspecialite
-- group by s.id, cs.nom,s.nom;

-- -- charges matérielles
-- CREATE OR REPLACE VIEW v_charge_materielle AS
-- SELECT s.id idservice , cs.nom categorie, s.nom description , sum(m.prixunitaire*mu.quantite) montant
-- from CategorieService cs join Service s on cs.id=s.idcategorieService
-- join MaterielUtilise mu on s.id=mu.idservice
-- join Materiel m on mu.idmateriel=m.id
-- group by s.id, cs.nom,s.nom;

-- CREATE OR REPLACE VIEW v_charge_totale AS 
-- SELECT s.idservice, s.categorie , s.description, s.montant+m.montant montant from v_charge_salariale s join v_charge_materielle m on s.idservice=m.idservice


CREATE OR REPLACE VIEW v_prix_vente AS 
SELECT idservice, categorie , description, montant + (montant*( select marge from margebeneficiaire order by datemodification desc limit 1)/100)
from v_charge_totale;


-- CREATE OR REPLACE VIEW v_prix_service AS
-- SELECT *,'charge_salariale' categorie_prix from v_charge_salariale
-- UNION ALL 
-- SELECT *,'charge_materiel' categorie_prix from v_charge_materielle
-- UNION ALL 
-- SELECT *,'charge_totale' categorie_prix from v_charge_totale
-- UNION ALL
-- SELECT *,'prix_vente' categorie_prix from v_prix_vente;




CREATE OR REPLACE VIEW v_charge_materiel AS
 SELECT s.id AS idservice,
    cs.nom AS categorie,
    s.nom AS description,
    sum((m.prixunitaire * (mu.quantite)::double precision)) AS montant
   FROM (((categorieservice cs
     JOIN service s ON ((cs.id = s.idcategorieservice)))
     JOIN materielutilise mu ON ((s.id = mu.idservice)))
     JOIN materiel m ON ((mu.idmateriel = m.id)))
  GROUP BY s.id, cs.nom, s.nom;

CREATE OR REPLACE VIEW v_charge_salariale AS
 SELECT s.id AS idservice,
    cs.nom AS categorie,
    s.nom AS description,
    sum((sal.montant * (a.duree)::double precision)) AS montant
   FROM ((((categorieservice cs
     JOIN service s ON ((cs.id = s.idcategorieservice)))
     JOIN affectationservice a ON ((s.id = a.idservice)))
     JOIN specialite spec ON ((a.idspecialite = spec.id)))
     JOIN salaire sal ON ((spec.id = sal.idspecialite)))
  GROUP BY s.id, cs.nom, s.nom;


CREATE  OR REPLACE VIEW v_charge_totale AS
 SELECT s.idservice,
    s.categorie,
    s.description,
    (s.montant + m.montant) AS montant
   FROM (v_charge_salariale s
     JOIN v_charge_materiel m ON ((s.idservice = m.idservice)));


CREATE OR REPLACE VIEW v_benefice AS
     WITH latest_marge AS (
      SELECT mb.idservice, mb.marge, mb.datemodification
FROM MargeBeneficiaire mb 
JOIN (SELECT idservice, MAX(datemodification) AS max_date FROM MargeBeneficiaire GROUP BY idservice) max_date 
ON mb.idservice = max_date.idservice AND mb.datemodification = max_date.max_date
)
 SELECT v.idservice,
    v.categorie,
    v.description,
    (montant * l.marge / 100) AS montant
   FROM v_charge_totale v join latest_marge l on v.idservice=l.idservice;
     

CREATE OR REPLACE VIEW v_prix_vente AS
SELECT ct.idservice, ct.categorie, ct.description, ct.montant + b.montant montant
FROM v_charge_totale ct join v_benefice b on ct.idservice=b.idservice;


CREATE OR REPLACE VIEW v_prix_service AS
SELECT s.*, m.montant charge_materiel, sal.montant charge_salariale,
t.montant charge_totale, b.montant benefice, v.montant prix_vente
from Service s join v_charge_materiel m on s.id=m.idservice
join v_charge_salariale sal on s.id=sal.idservice 
join v_charge_totale t on s.id=t.idservice
join  v_benefice b on s.id=b.idservice 
join v_prix_vente v on s.id=v.idservice;