package garage.source_code.service;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.model.Salaire;

public class SalaireService {
    public void createSalaire(String montant,String idspecialite) throws Exception {

        Salaire sal=new Salaire(Double.valueOf(montant),Integer.valueOf(idspecialite));

        GenericDao dao=new GenericDao();
        try {
            dao.save(sal);
        } catch (Throwable e) {
            throw e;
        }
    }

    public void updateSalaire(String montant,String idsalaire) throws Exception {

        Salaire sal=new Salaire(Integer.valueOf(idsalaire),Double.valueOf(montant));

        GenericDao dao=new GenericDao();
        try {
            dao.update(sal);
        } catch (Throwable e) {
            throw e;
        }
    }
}
