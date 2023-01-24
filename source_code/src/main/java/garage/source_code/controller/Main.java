package garage.source_code.controller;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.model.*;
import garage.source_code.service.EmployeService;

import java.sql.Date;
import java.util.List;

public class Main {
    public static void main(String[] args) throws Exception {
//        GenericDao dao=new GenericDao();

        EmployeService service=new EmployeService();
//        service.createEmploye("Rakoto","Modeste","1","1","2003-01-01");

        List<Employe> employes=service.search("oh");
        for (Employe e :
                employes) {
            System.out.println(e.getNom());
        }
//        Employe e=new Employe();
//        e.setDatenaissance(Date.valueOf("2005-01-01"));
//        System.out.println(e.getAge());
//        List<MaterielUtilise> materiels=(List)dao.get(new MaterielUtilise(),"and");
//
//        System.out.println("matériels used length: "+materiels.size());
//        for (MaterielUtilise s :
//                materiels) {
//
//            System.out.println(s.getId()+" , "+s.getQuantite()+ " /// "+s.getService().getCategorieService().getEmail()+" , "+s.getService().getEmail()+ " /// "+s.getMateriel().getEmail());
//        }

//        Service s=new Service();
//        s.setEmail("test service");
//
//        CategorieService c=new CategorieService();
//        c.setId(3);
//
//        s.setCategorieService(c);
//
//        dao.save(s);

//        EmployeService e=new EmployeService();
//
//        e.setEmail("Rakoto");
//        e.setPrenom("Modeste");
//
//        e.setDatenaissance(Date.valueOf("2001-01-01"));
//
//
//        NiveauEtude n=new NiveauEtude();
//        n.setId(2);
//
//        Genre g=new Genre();
//        g.setId(2);
//
//        e.setNiveauEtude(n);
//        e.setGenre(g);
//
//        dao.save(e);

    }
}
