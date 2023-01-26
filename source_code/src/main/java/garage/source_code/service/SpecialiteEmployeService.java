package garage.source_code.service;

import garage.source_code.GenericDao.generic.dao.ConnectDb;
import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.GenericDao.generic.note.Utilitaire;
import garage.source_code.model.Employe;
import garage.source_code.model.Specialite;
import garage.source_code.model.SpecialiteEmploye;

import java.util.List;

public class SpecialiteEmployeService {

    public Object[] getData(String idemploye) throws Exception {


        Specialite s = new Specialite();
        Employe emp = new Employe();
        emp.setId(Integer.valueOf(idemploye));


        GenericDao dao = new GenericDao();
        ConnectDb con = null;

        try {
            con = Utilitaire.getConnection(s);
//            List<Specialite> specialites = (List) dao.getAll(s, con);
            List<Specialite> specialites = (List) dao.getByQuery(s, "SELECT * from Specialite where id not in (SELECT idspecialite from specialiteemploye where idemploye="+idemploye+")");
            emp = (Employe) dao.getBy_id(emp, con);

            return new Object[]{emp, specialites};

        } catch (Throwable e) {
            throw e;
        } finally {
            if (con != null)
                con.close();
        }


    }

    public void addSpecialiteToEmploye(String idemploye, String idspecialite) throws Exception {
        SpecialiteEmploye se = new SpecialiteEmploye();

        Employe emp = new Employe();
        emp.setId(Integer.valueOf(idemploye));

        Specialite sp = new Specialite();
        sp.setId(Integer.valueOf(idspecialite));

        se.setEmploye(emp);
        se.setSpecialite(sp);

        GenericDao dao = new GenericDao();
        try {
            dao.save(se);
        } catch (Throwable e) {
            throw e;
        }
    }

    public void createSpecialite(String nom,String description) throws Exception {
        Specialite specialite=new Specialite();
        specialite.setNom(nom);
        specialite.setDescription(description);

        GenericDao dao=new GenericDao();
        try {
            dao.save(specialite);
        } catch (Throwable e) {
            throw e;
        }

    }
}
