package garage.source_code.model;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

@Table
public class Service {

    @Attr(pk = true, sequence = "service_id_seq")
    Integer id;

    @Attr
    String nom;

    @Attr(fk = true, column = "idcategorieservice")
    CategorieService categorieService;

    MargeBeneficiaire margeBeneficiaire;

    public MargeBeneficiaire getMargeBeneficiaire() throws Exception {
        if(margeBeneficiaire==null){
            GenericDao dao=new GenericDao();
            MargeBeneficiaire margeB=new MargeBeneficiaire();
            try {
                setMargeBeneficiaire((MargeBeneficiaire)dao.getByQuery(margeB,"SELECT * from margebeneficiaire where idservice="+getId()+" order by datemodification desc limit 1").get(0));
            } catch (Throwable e) {
                throw e;
            }
        }
        return margeBeneficiaire;
    }

    public void setMargeBeneficiaire(MargeBeneficiaire margeBeneficiaire) {
        this.margeBeneficiaire = margeBeneficiaire;
    }

    public Service() {
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

    public CategorieService getCategorieService() {
        return categorieService;
    }

    public void setCategorieService(CategorieService categorieService) {
        this.categorieService = categorieService;
    }
}
