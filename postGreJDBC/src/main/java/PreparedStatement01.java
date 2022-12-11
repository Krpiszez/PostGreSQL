import java.sql.*;

public class PreparedStatement01 {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","1234");
        Statement st = con.createStatement();

        //1.Example: Update the number of employees to 9999 if the company name is IBM by using prepared statement
        //1.Step Create Prepared Statement Query
        String sql1 = "update companies set number_of_employees = ? where company = ?";

        //2.Step Create Prepared Statement Object
        PreparedStatement pst1 = con.prepareStatement(sql1);

        //3.Step Assign the values by using 'set....()'-.setInt(), .setString() etc.- methods
        pst1.setInt(1,9999);
        pst1.setString(2,"IBM");

        //4.Step Execute the Query
        int numOfRecordsUpdated = pst1.executeUpdate();
        System.out.println("numOfRecordsUpdated = " + numOfRecordsUpdated);

        String sql2 = "select * from companies";
        ResultSet rs1 = st.executeQuery(sql2);
        while (rs1.next()){

            System.out.println(rs1.getInt(1) +"|"+ rs1.getString(2) +"|"+ rs1.getInt(3));

        }

        ////2.Example: Update the number of employees to 5555 if the company name is GOOGLE by using prepared statement

        pst1.setInt(1, 5555);
        pst1.setString(2, "GOOGLE");

        int numOfRecordsUpdated2 = pst1.executeUpdate();
        System.out.println("numOfRecordsUpdated2 = " + numOfRecordsUpdated2);
        ResultSet rs2 = st.executeQuery(sql2);
        while (rs2.next()){

            System.out.println(rs2.getInt(1) +"|"+ rs2.getString(2) +"|"+ rs2.getInt(3));

        }

        st.close();
        con.close();
        pst1.close();

    }
}
