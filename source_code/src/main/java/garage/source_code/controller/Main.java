package garage.source_code.controller;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.model.*;

import java.sql.Date;

public class Main {
    public static void main(String[] args) throws Exception {
        GenericDao dao=new GenericDao();

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

//        Employe e=new Employe();
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
