package garage.source_code.controller;

import garage.source_code.model.Employe;
import garage.source_code.model.PrixService;
import garage.source_code.service.EmployeService;
import garage.source_code.service.ServiceService;
import garage.source_code.service.SpecialiteEmployeService;

import java.util.List;

public class Main {
    public static void main(String[] args) throws Exception {
//        GenericDao dao=new GenericDao();

//        SpecialiteEmployeService service=new SpecialiteEmployeService();
//        Object[] data=service.getData("1");
//        System.out.println(((Employe)data[0]).formatSpecialites());


        ServiceService service=new ServiceService();


//        EmployeService service = new EmployeService();
//        service.createEmploye("Rakoto","Modeste","1","1","2003-01-01");

        List<PrixService> services = service.getAllPrixService(PrixService.ctg_charge_materiel);
        for (PrixService e :
                services) {
            System.out.println(e.getService().getNom());
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
