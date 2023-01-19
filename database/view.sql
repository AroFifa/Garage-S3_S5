-- charges salariales
CREATE OR REPLACE VIEW v_charge_salariale AS
SELECT s.id idservice , cs.nom categorie, s.nom description,sum(montant*a.duree) montant
from CategorieService cs join Service s on cs.id=s.idcategorieService
join AffectationService a on s.id=a.idservice
join specialite spec on a.idspecialite=spec.id
join salaire sal on spec.id=sal.idspecialite
group by s.id, cs.nom,s.nom;

-- charges matérielles
CREATE OR REPLACE VIEW v_charge_materielle AS
SELECT s.id idservice , cs.nom categorie, s.nom description , sum(m.prixunitaire*mu.quantite) montant
from CategorieService cs join Service s on cs.id=s.idcategorieService
join MaterielUtilise mu on s.id=mu.idservice
join Materiel m on mu.idmateriel=m.id
group by s.id, cs.nom,s.nom;

CREATE OR REPLACE VIEW v_charge_totale AS 
SELECT s.idservice, s.categorie , s.description, s.montant+m.montant montant from v_charge_salariale s join v_charge_materielle m on s.idservice=m.idservice


CREATE OR REPLACE VIEW v_prix_vente AS 
SELECT v.idservice, v.categorie , v.description, v.montant + (montant*( select marge from margebeneficiaire where idservice=v.idservice order by datemodification desc limit 1)/100) montant
from v_charge_totale v;


CREATE OR REPLACE VIEW v_benefice AS 
SELECT vente.idservice, vente.categorie , vente.description, vente.montant - charge.montant montant
from v_charge_totale charge join v_prix_vente vente on charge.idservice=vente.idservice ;

-- CREATE OR REPLACE VIEW v_prix_service AS
-- SELECT *,'charge_salariale' categorie_prix from v_charge_salariale
-- UNION ALL 
-- SELECT *,'charge_materiel' categorie_prix from v_charge_materielle
-- UNION ALL 
-- SELECT *,'charge_totale' categorie_prix from v_charge_totale
-- UNION ALL
-- SELECT *,'prix_vente' categorie_prix from v_prix_vente
-- UNION ALL
-- SELECT *,'benefice' categorie_prix from v_benefice;