import java.sql.*;

public class ExecuteUpdate01 {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","1234");
        Statement st = con.createStatement();

        //1.Example: Update the number of employees to 16000 if the number of employees is less than the average number of employees
        String sql1 = "update companies set number_of_employees = 16000 where number_of_employees < (select avg (number_of_employees) from companies)";
        int numOfRecordsUpdated = st.executeUpdate(sql1);
        System.out.println("numOfRecordsUpdated = " + numOfRecordsUpdated);

        String sql2 = "select * from companies";
        ResultSet rs1 = st.executeQuery(sql2);
        while (rs1.next()){

            System.out.println(rs1.getInt(1)+" "+rs1.getString(2)+" "+rs1.getInt(3));

        }

        con.close();
        st.close();
    }

}
