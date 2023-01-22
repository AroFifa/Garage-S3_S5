package garage.source_code.model;

import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class AffectationService {
    @Attr(pk = true,sequence = "affectationservice_id_seq")
    Integer id;
    @Attr
    Integer duree;

    @Attr(fk = true,column = "idemploye")
    Employe employe;
    @Attr(fk = true,column = "idspecialite")
    Specialite specialite;
    @Attr(fk = true,column = "idservice")
    Service service;

    public AffectationService() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDuree() {
        return duree;
    }

    public void setDuree(Integer duree) {
        this.duree = duree;
    }

    public Employe getEmploye() {
        return employe;
    }

    public void setEmploye(Employe employe) {
        this.employe = employe;
    }

    public Specialite getSpecialite() {
        return specialite;
    }

    public void setSpecialite(Specialite specialite) {
        this.specialite = specialite;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
}
