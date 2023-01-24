package garage.source_code.service;

import garage.source_code.GenericDao.generic.dao.ConnectDb;
import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.GenericDao.generic.note.Utilitaire;
import garage.source_code.model.Employe;
import garage.source_code.model.Genre;
import garage.source_code.model.NiveauEtude;

import java.sql.Date;
import java.util.List;

public class EmployeService {
    public void createEmploye(String nom, String prenom, String idgenre, String idniveauEtude, String date_naissance) throws Exception {
        Employe e=new Employe(nom,prenom,idgenre,idniveauEtude,date_naissance);


        GenericDao dao=new GenericDao();

        try {
            dao.save(e);
        } catch (Throwable ex) {
            throw ex;
        }

    }

    public Object[] getData() throws Exception {
        Genre g=new Genre();
        NiveauEtude nv=new NiveauEtude();

        GenericDao dao=new GenericDao();
        ConnectDb con=null;

        try {
            con= Utilitaire.getConnection(g);
            List<Genre> genres=(List)dao.getAll(g,con);
            List<NiveauEtude> niveauEtudes =(List)dao.getAll(nv,con);

            return new Object[]{genres,niveauEtudes};

        } catch (Throwable e) {
            throw e;
        }finally {
            if(con!=null)
                con.close();
        }

    }

    public List<Employe> search(String pattern) throws Exception {
        Employe emp=new Employe();
        emp.setNom(pattern);
        emp.setPrenom(pattern);
        emp.setMatricule(pattern);

        GenericDao dao=new GenericDao();
        try {
            return (List)dao.get(emp,"or");
        } catch (Throwable e) {
            throw e;
        }

    }
}
