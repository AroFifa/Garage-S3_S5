package garage.source_code.model;

import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class MaterielUtilise {
    @Attr(pk = true, sequence = "materielutilise_id_seq")
    Integer id;

    @Attr
    Integer quantite;

    @Attr(fk = true, column = "idservice")
    Service service;

    @Attr(fk = true, column = "idmateriel")
    Materiel materiel;

    public MaterielUtilise() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuantite() {
        return quantite;
    }

    public void setQuantite(Integer quantite) {
        this.quantite = quantite;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Materiel getMateriel() {
        return materiel;
    }

    public void setMateriel(Materiel materiel) {
        this.materiel = materiel;
    }
}
