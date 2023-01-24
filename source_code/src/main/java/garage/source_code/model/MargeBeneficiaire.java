package garage.source_code.model;

import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

import java.sql.Date;

@Table
public class MargeBeneficiaire {
    @Attr(pk = true, sequence = "margebenficiaire_id_seq")
    Integer id;
    @Attr
    Integer marge;

    @Attr
    Date datemodification;

    @Attr(fk = true, column = "idservice")
    Service service;

    public MargeBeneficiaire() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMarge() {
        return marge;
    }

    public void setMarge(Integer marge) {
        this.marge = marge;
    }

    public Date getDatemodification() {
        return datemodification;
    }

    public void setDatemodification(Date datemodification) {
        this.datemodification = datemodification;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
}
