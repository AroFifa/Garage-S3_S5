package garage.source_code.model;

import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class Materiel {
    @Attr(pk = true,sequence = "materiel_id_seq")
    Integer id;

    @Attr
    String nom;

    @Attr
    Double prixunitaire;

    @Attr(fk = true,column = "idunite")
    Unite unite;

    public Materiel() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Double getPrixunitaire() {
        return prixunitaire;
    }

    public void setPrixunitaire(Double prixunitaire) {
        this.prixunitaire = prixunitaire;
    }

    public Unite getUnite() {
        return unite;
    }

    public void setUnite(Unite unite) {
        this.unite = unite;
    }
}
