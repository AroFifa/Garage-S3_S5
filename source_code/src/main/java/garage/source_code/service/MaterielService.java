package garage.source_code.service;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.model.Materiel;

import java.util.List;

public class MaterielService {
    public List<Materiel> getAllMateriel() throws Exception {
        GenericDao dao=new GenericDao();
        Materiel m=new Materiel();

        try {
            return (List)dao.getAll(m);
        } catch (Throwable e) {
            throw e;
        }
    }
}
