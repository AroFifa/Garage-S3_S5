package garage.source_code.model;

import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class SpecialiteEmploye {
    @Attr(fk = true,column = "idemploye")
    Employe employe;
    @Attr(fk = true,column = "idspecialite")
    Specialite specialite;

    public SpecialiteEmploye() {
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
}
