import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Execute01 {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        //1.Step Registration to the driver.
        Class.forName("org.postgresql.Driver");

        //2.Step Create connection with database
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","1234");

        //3.Step Create Statement
        Statement st = con.createStatement();

        //4.Step Execute the query

        //1.Example: Create a workers table with the columns worker_id,worker_name, worker_salary
        String sql1 = "create table workers(worker_id varchar(50),\tworker_name varchar(20), worker_salary int)";
        st.execute(sql1);

        //2.Example: Alter table by adding worker_address column into the workers table
        String sql2 = "alter table workers add worker_address varchar(80)";
        st.execute(sql2);

        //3. Example Drop the workers table
        String sql3 = "drop table workers";
        st.execute(sql3);

        //5.Step Close the connection and statement
        con.close();
        st.close();

    }

}
