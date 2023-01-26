package garage.source_code.model;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

import java.util.List;

@Table
public class Materiel {
    @Attr(pk = true, sequence = "materiel_id_seq")
    Integer id;

    @Attr
    String nom;

    @Attr
    Double prixunitaire;

    @Attr(fk = true, column = "idunite")
    Unite unite;

    MargeProduit margeProduit;

    Double prixconseille;


    public Double getBenefice() throws Exception {
        try {
            return getPrixunitaire()*getMargeProduit().getMarge()/100;
        } catch (Throwable e) {
            throw e;
        }
    }
    public Double getPrixconseille() throws Exception {
        if(prixconseille==null) {
            try {
                return getPrixunitaire()+getBenefice();
            } catch (Throwable e) {
                throw e;
            }
        }
        return prixconseille;
    }

    public void setPrixconseille(Double prixconseille) {
        this.prixconseille = prixconseille;
    }

    public MargeProduit getMargeProduit() throws Exception {
        if(margeProduit==null){
            GenericDao dao=new GenericDao();
            MargeProduit m=new MargeProduit();
            try {
                List<MargeProduit> margeProduits=(List)dao.getByQuery(m, "SELECT * FROM margeproduit WHERE ("+getPrixunitaire()+"<prix_max and prix_min is null) OR ("+getPrixunitaire()+" BETWEEN prix_min AND COALESCE(prix_max, 99999999999)) OR (prix_max IS NULL AND "+getPrixunitaire()+" > prix_min)");
                if(margeProduits.size()!=0)
                    return margeProduits.get(0);
            } catch (Throwable e) {
                throw e;
            }
        }
        return margeProduit;
    }

    public Materiel(String nom, String prixunitaire, String idunite) {
        setNom(nom);
        setPrixunitaire(Double.valueOf(prixunitaire));

        Unite u=new Unite();
        u.setId(Integer.valueOf(idunite));

        setUnite(u);

    }

    public void setMargeProduit(MargeProduit margeProduit) {
        this.margeProduit = margeProduit;
    }


    public Materiel() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Double getPrixunitaire() {
        return prixunitaire;
    }

    public void setPrixunitaire(Double prixunitaire) {
        this.prixunitaire = prixunitaire;
    }

    public Unite getUnite() {
        return unite;
    }

    public void setUnite(Unite unite) {
        this.unite = unite;
    }

//
//    public Object getMargeProduits(){
//        if(margeProduit==null){
//            GenericDao dao=new GenericDao();
//            MargeProduit marge=new MargeProduit();
//            marge.setMateriel(this);
//            try{
//                return dao.get(marge,"and").get(0);
//            }catch (Throwable e){
//                throw e;
//            }
//        }
//        return margeProduit;
//    }
}
