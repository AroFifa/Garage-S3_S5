package garage.source_code.model;


import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class MargeProduit {

    @Attr(pk = true,sequence = "materiel_id_seq")
    Integer id;

    @Attr
    Double prix_min;

    @Attr
    Double prix_max;

    @Attr
    Integer marge;

    public MargeProduit() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getPrix_min() {
        return prix_min;
    }

    public void setPrix_min(Double prix_min) {
        this.prix_min = prix_min;
    }

    public Double getPrix_max() {
        return prix_max;
    }

    public void setPrix_max(Double prix_max) {
        this.prix_max = prix_max;
    }

    public Integer getMarge() {
        return marge;
    }

    public void setMarge(Integer marge) {
        this.marge = marge;
    }
}
