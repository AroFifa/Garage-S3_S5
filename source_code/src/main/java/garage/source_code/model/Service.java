package garage.source_code.model;

import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class Service {

    @Attr(pk = true,sequence = "service_id_seq")
    Integer id;

    @Attr
    String nom;

    @Attr(fk = true,column = "idcategorieservice")
    CategorieService categorieService;

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

    public CategorieService getCategorieService() {
        return categorieService;
    }

    public void setCategorieService(CategorieService categorieService) {
        this.categorieService = categorieService;
    }

    public Service() {
    }
}
