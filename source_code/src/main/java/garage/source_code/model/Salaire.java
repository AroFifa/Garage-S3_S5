package garage.source_code.model;

import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class Salaire {
    @Attr(pk = true,sequence = "salaire_id_seq")
    Integer id;
    @Attr
    Double montant;

    @Attr(fk = true, column = "idspecialtie")
    Specialite specialite;

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

    public Salaire() {
    }
}
