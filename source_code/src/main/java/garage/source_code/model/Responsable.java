package garage.source_code.model;

import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class Responsable {
    @Attr(pk = true,sequence = "responsable_id_seq")
    Integer id;
    @Attr
    String email;

    @Attr
    String motdepasse;

    @Attr(fk = true,column = "idemploye")
    Employe employe;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Responsable() {
    }
}
