package garage.source_code.GenericDao.generic.dao;

import garage.source_code.GenericDao.generic.note.Utilitaire;

import java.util.ArrayList;

public class ScriptDao {

    private static String generate_script(ArrayList<Column> fieldsDB, String split) {
        String result = "";
        for (int i = 0; i < fieldsDB.size(); i++) {
            if (i == fieldsDB.size() - 1)
                split = "";

            String col = fieldsDB.get(i).getColumn();
//            if(fieldsDB.get(i).fk)
//                col=fieldsDB.get(i).getFk_column();
            result += col + split;
        }
        return result;
    }

    private static String condition_values(ArrayList<Column> fieldsDB, String split) throws Exception {
        String result = "";
        int size = fieldsDB.size();
        for (int i = 0; i < size; i++) {

//            System.out.println("column details: ");
//            System.out.println(fieldsDB.get(i));
            if (fieldsDB.get(i).getValue() == null  ) {
                continue;
            }else if(fieldsDB.get(i).fk){
                try {
                    if(Utilitaire.getPk(fieldsDB.get(i).getValue()).getValue()==null)
                        continue;
                } catch (Throwable e) {
                    throw e;
                }
            }



//            System.out.println(fieldsDB.get(i).getValue());
            result += fieldsDB.get(i).getColumn() + "=?";

            for (int j = i + 1; j < size; j++) {

                if (fieldsDB.get(j).getValue() != null) {
                    result += " " + split + " ";
                }
            }
        }
        return result;
    }

    protected static String id_selection(String pk, String tablename, ArrayList<Column> fieldsDB) {
        String query = basic_selection(tablename, fieldsDB) + " where " + pk + " = ?";
        return query;
    }

    private static String basic_selection(String tablename, ArrayList<Column> fieldsDB) {
        return "SELECT " + generate_script(fieldsDB, ",") + " from " + tablename;
    }

    private static String selection_condition(String init, String liaison, ArrayList<Column> fieldsDB) throws Exception {

        String cond = null;
        try {
            cond = condition_values(fieldsDB, liaison);
        } catch (Throwable e) {
            throw e;
        }
        if (cond.equals(""))
            return "";

        return " " + init + " " + cond;

    }

    protected static String update(String pk, String tablename, ArrayList<Column> fieldsDB) throws Exception {
        try {
            return "UPDATE " + tablename + selection_condition("set", ",", fieldsDB) + " where " + pk + " = ?";
        } catch (Throwable e) {
            throw e;
        }
    }

    private static String generate_scriptValues(ArrayList<Column> fieldsDB, String split) {
        String result = "";
        for (int i = 0; i < fieldsDB.size(); i++) {
            if (i == fieldsDB.size() - 1)
                split = "";

            String value = "?";

            String seq = fieldsDB.get(i).getSequence();
            if (!seq.equals("")) {

//				si la base de donn�e est POSTGRESQL
                if (fieldsDB.get(i).getValue() == null)
                    value = "nextval(?)";

            }
            result += value + split;
        }
        return result;
    }

    protected static String generate_pk(Object o) throws Exception {

        try {
            Column pk = Utilitaire.getPk(o);

            if (!pk.getSequence().equals(""))
                return "SELECT nextval('" + pk.getSequence() + "')";
        } catch (Exception e) {
            throw e;
        }
        return null;
    }

    public static String insert(String tablename, ArrayList<Column> fieldsDB) {
        String req = "INSERT INTO " + tablename + " ";

        String col = "(" + generate_script(fieldsDB, ",") + ")";
        String val = "(" + generate_scriptValues(fieldsDB, ",") + ")";

        req = req + col + " VALUES " + val;


        return req;
    }

    protected static String delete(String pk, String tableName) {
        return "DELETE FROM " + tableName + " where " + pk + " = ?";
    }

    protected static String select(String tablename, ArrayList<Column> fieldsDB, String liaison) throws Exception {
        try {
            return basic_selection(tablename, fieldsDB) + selection_condition("where", liaison, fieldsDB);
        } catch (Throwable e) {
            throw e;
        }
    }

    protected static String selectAll(String tablename, ArrayList<Column> fieldsDB) {
        return basic_selection(tablename, fieldsDB);
    }


}
