package fonction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class NiveauEtude {
    int id;
    String nom;

    Connex con = new Connex();

    public NiveauEtude(int id,String nom){
        this.id = id;
        this.nom = nom;
    }
    public NiveauEtude(){}

    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public int countdata()throws Exception{
        int count = 0;
        Connection co = con.postGres();
        Statement stat = co.createStatement();
        ResultSet res = stat.executeQuery("Select * from Niveauetude");

        while(res.next()){
            count++;
        }
        return count;
}

    public NiveauEtude findAll()throws Exception{
        Connection co = con.postGres();
        Statement stat = co.createStatement();
        ResultSet res = stat.executeQuery("Select * from Niveauetude");

    while(res.next()){
        id = res.getInt(1);
        nom = res.getString(2);
        System.out.println(id + ',' + nom);
    }
    return null;
}
    
}
