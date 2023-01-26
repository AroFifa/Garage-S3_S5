package garage.source_code.model;

import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class Salaire {
    @Attr(pk = true, sequence = "salaire_id_seq")
    Integer id;
    @Attr
    Double montant;

    @Attr(fk = true, column = "idspecialtie")
    Specialite specialite;

    public Specialite getSpecialite() {
        return specialite;
    }

    public void setSpecialite(Specialite specialite) {
        this.specialite = specialite;
    }

    public Salaire() {
    }

    public Salaire(Integer id,Double montant){
        setId(id);
        setMontant(montant);
    }
    public Salaire(Double montant, Integer idspecialtie) {
        setMontant(montant);

        Specialite spec=new Specialite();
        spec.setId(idspecialtie);
        setSpecialite(spec);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getMontant() {
        return montant;
    }

    public void setMontant(Double montant) {
        this.montant = montant;
    }
}
