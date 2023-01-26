package garage.source_code.model;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

import java.util.List;

@Table
public class Specialite {
    @Attr(pk = true, sequence = "specialite_id_seq")
    Integer id;
    @Attr
    String nom;

    @Attr
    String description;

    Salaire salaire;

    public Salaire getSalaire() throws Exception {
        if(salaire==null){
            Salaire sal=new Salaire();
            sal.setSpecialite(this);
            GenericDao dao=new GenericDao();

            try {
                List<Salaire> salaires=(List) dao.get(sal,"and");
                if(salaires.size()==0)
                    return null;

                setSalaire(salaires.get(0));
            } catch (Throwable e) {
                throw e;
            }
        }
        return salaire;
    }

    public void setSalaire(Salaire salaire) {
        this.salaire = salaire;
    }

    public Specialite() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
