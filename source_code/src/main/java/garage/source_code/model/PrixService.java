package garage.source_code.model;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

import java.util.List;

@Table
public class PrixService {
    @Attr(fk = true,column = "idservice")
    Service service;
    @Attr
    Double montant;
    String categorie;

    public static final String ctg_charge_salariale="v_charge_salariale";
    public static final String ctg_charge_materiel="v_charge_materiel";
    public static final String ctg_charge_totale="v_charge_totale";
    public static final String ctg_benefice="v_benefice";
    public static final String ctg_prix_vente="v_prix_vente";

    public PrixService() {
    }

    public String getDescCtg(String ctg) throws Exception {
        if(ctg==null)
            return "Prix de vente";
        switch (ctg){
            case ctg_benefice:
                return "Bénéfice";
            case ctg_charge_materiel:
                return "Charge matériel";
            case ctg_charge_salariale:
                return "Charge Salariale";
            case ctg_charge_totale:
                return "Prix de revient";
            default:
                return "Prix de vente";
        }
    }

    public List<PrixService> findAll() throws Exception {
        GenericDao dao=new GenericDao();

        try {
            List<PrixService> services=(List) dao.getByQuery(this,"SELECT * from "+getCategorie());
            return services;
        } catch (Throwable e) {
            throw e;
        }
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Double getMontant() {
        return montant;
    }

    public void setMontant(Double montant) {
        this.montant = montant;
    }

    public String getCategorie() {
        if(categorie==null)
            setCategorie(ctg_prix_vente);
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }
}
