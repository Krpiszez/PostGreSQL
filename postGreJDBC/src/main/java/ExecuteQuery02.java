import java.sql.*;

public class ExecuteQuery02 {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {


        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","1234");
        Statement st = con.createStatement();

        //1.Example: Find the company and number_of_employees whose number_of_employees is the second highest from the companies table
        //1.Way by using offset and fetch next
        String sql1 = "select company, number_of_employees from companies order by number_of_employees desc offset 1 row fetch next 1 row only";
        ResultSet rs1 = st.executeQuery(sql1);
        while (rs1.next()){

            System.out.println(rs1.getString("company")+" - - "+rs1.getInt("number_of_employees"));

        }
        //2.Way by using sub-query
        String sql2 = "SELECT company, number_of_employees\n" +
                "FROM companies\n" +
                "WHERE number_of_employees = (SELECT MAX(number_of_employees)\n" +
                "                                FROM companies\n" +
                "                                WHERE number_of_employees < (SELECT MAX(number_of_employees)\n" +
                "                                                             FROM companies))";

        ResultSet resultSet2 = st.executeQuery(sql2);

        while (resultSet2.next()){

            System.out.println(resultSet2.getString("company")+"--"+resultSet2.getInt("number_of_employees"));

        }
        //2.Example: Find the company names and number of employees whose number of employees is less than the average number of employees
        String sql3 = "select company, number_of_employees from companies where number_of_employees < (select avg(number_of_employees) from companies)";
        ResultSet rs3 = st.executeQuery(sql3);
        while (rs3.next()){

            System.out.println(rs3.getString("company")+"--"+rs3.getString("number_of_employees"));

        }

        con.close();
        st.close();

    }


}
