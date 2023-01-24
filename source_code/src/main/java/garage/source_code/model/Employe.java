package garage.source_code.model;

import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.GenericDao.generic.note.Attr;
import garage.source_code.GenericDao.generic.note.Table;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Table
public class Employe {

    @Attr(pk = true, sequence = "employe_id_seq")
    Integer id;

    @Attr(sequence = "seq_matricule")
    String matricule;

    @Attr
    String nom;

    @Attr
    String prenom;

    @Attr
    Date datenaissance;


    @Attr(fk = true, column = "idniveauetude")
    NiveauEtude niveauEtude;
    @Attr(fk = true, column = "idgenre")
    Genre genre;

    List<Specialite> specialites;

    public String formatSpecialites() throws Exception {
        String spec="";
        int i=0;
        try {
            for (Specialite s:getSpecialites()) {
                spec+=s.getNom();
                if(i!=getSpecialites().size()-1)
                    spec+=", ";
                i++;
            }

            return spec;
        } catch (Throwable e) {
            throw e;
        }
    }

    public List<Specialite> getSpecialites() throws Exception {

        if(specialites==null){
            SpecialiteEmploye sp=new SpecialiteEmploye();
            sp.setEmploye(this);

            GenericDao dao=new GenericDao();
            try {
                specialites=new ArrayList<>();
                for (SpecialiteEmploye se :
                        (List<SpecialiteEmploye>)(List) dao.get(sp, "and")) {
                    specialites.add(se.getSpecialite());
                }
            } catch (Throwable e) {
                throw e;
            }
        }
        return specialites;
    }

    public void setSpecialites(List<Specialite> specialites) {
        this.specialites = specialites;
    }

    public Employe() {
    }

    public Employe(String nom, String prenom, String idgenre, String idniveauEtude, String date_naissance) {
        setNom(nom);
        setPrenom(prenom);

        Genre g = new Genre();
        g.setId(Integer.valueOf(idgenre));

        setGenre(g);

        NiveauEtude nv = new NiveauEtude();
        nv.setId(Integer.valueOf(idniveauEtude));

        setNiveauEtude(nv);

        try {
            setDatenaissance(Date.valueOf(date_naissance));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static int calculateAge(Date date) {
        Calendar birthdate = Calendar.getInstance();
        birthdate.setTime(date);
        Calendar today = Calendar.getInstance();
        int age = today.get(Calendar.YEAR) - birthdate.get(Calendar.YEAR);
        if (today.get(Calendar.MONTH) < birthdate.get(Calendar.MONTH)) {
            age--;
        } else if (today.get(Calendar.MONTH) == birthdate.get(Calendar.MONTH)
                && today.get(Calendar.DAY_OF_MONTH) < birthdate.get(Calendar.DAY_OF_MONTH)) {
            age--;
        }
        return age;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Date getDatenaissance() {
        return datenaissance;
    }

    public void setDatenaissance(Date datenaissance) throws Exception {
        if (calculateAge(datenaissance) < 18)
            throw new Exception("Employé mineur");
        this.datenaissance = datenaissance;
    }

    public NiveauEtude getNiveauEtude() {
        return niveauEtude;
    }

    public void setNiveauEtude(NiveauEtude niveauEtude) {
        this.niveauEtude = niveauEtude;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public int getAge() {
        return calculateAge(getDatenaissance());
    }

    @Override
    public String toString() {
        return "Employe{" +
                "id=" + id +
                ", matricule='" + matricule + '\'' +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", datenaissance=" + datenaissance +
                ", niveauEtude=" + niveauEtude +
                ", genre=" + genre +
                ", specialites=" + specialites +
                '}';
    }
}
