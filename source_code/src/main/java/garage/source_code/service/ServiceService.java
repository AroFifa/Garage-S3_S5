package garage.source_code.service;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.model.MargeBeneficiaire;
import garage.source_code.model.PrixService;
import garage.source_code.model.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

public class ServiceService {
    public List<PrixService> getAllPrixService(String ctg) throws Exception {
        PrixService ps=new PrixService();
        ps.setCategorie(ctg);
        try {
            return ps.findAll();
        } catch (Throwable e) {
            throw e;
        }
    }

    public String getCtgTitle(String ctg) throws Exception {
        PrixService ps=new PrixService();
        try {
            return ps.getDescCtg(ctg);
        } catch (Throwable e) {
            throw e;
        }
    }

    public void updateMarge(String idservice,String marge) throws Exception {
        MargeBeneficiaire margeB=new MargeBeneficiaire();
        margeB.setDatemodification(Date.valueOf(LocalDate.now()));
        Service s=new Service();
        s.setId(Integer.valueOf(idservice));

        margeB.setService(s);
        margeB.setMarge(Integer.valueOf(marge));

        GenericDao dao=new GenericDao();
        try {
            dao.save(margeB);
        } catch (Throwable e) {
            throw e;
        }
    }

    public List<Service> findAllService() throws Exception {
        Service s=new Service();
        GenericDao dao=new GenericDao();

        try {
            return (List)dao.getAll(s);
        } catch (Throwable e) {
            throw e;
        }
    }
}
