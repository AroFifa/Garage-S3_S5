package garage.source_code.service;

import garage.source_code.GenericDao.generic.dao.ConnectDb;
import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.GenericDao.generic.note.Utilitaire;
import garage.source_code.model.Genre;
import garage.source_code.model.Materiel;
import garage.source_code.model.NiveauEtude;
import garage.source_code.model.Unite;

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

    public Object[] getData() throws Exception {
        Unite u = new Unite();
        Materiel m = new Materiel();

        GenericDao dao = new GenericDao();
        ConnectDb con = null;

        try {
            con = Utilitaire.getConnection(u);
            List<Unite> unites = (List) dao.getAll(u, con);
            List<Materiel> materiels = (List) dao.getAll(m, con);

            return new Object[]{unites, materiels};

        } catch (Throwable e) {
            throw e;
        } finally {
            if (con != null)
                con.close();
        }

    }

    public void createMateriel(String nom,String prixU,String idunite) throws Exception {

        Materiel m=new Materiel(nom,prixU,idunite);

        GenericDao dao=new GenericDao();
        try {
            dao.save(m);
        } catch (Throwable e) {
            throw e;
        }
    }
}
