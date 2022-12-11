import java.sql.*;

public class CallableStatement01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1234");
        Statement st = con.createStatement();

        //1.Example: Create a function which uses 2 parameters and return the sum of the parameters
        //1st Step: Type code to create function
        String sql1 = "CREATE OR REPLACE FUNCTION additionF(x NUMERIC, y NUMERIC) RETURNS NUMERIC LANGUAGE plpgsql AS $$ BEGIN RETURN x + y; END $$";

        //2nd Step: Execute the function
        st.execute(sql1);

        //3rd Step: Prepare CallableStatement
        CallableStatement cst1 = con.prepareCall("{? = call additionF(?, ?) }");

        //4th Step: Use registerOutParameter() method for result container, use set() method for parameters
        cst1.registerOutParameter(1,Types.NUMERIC);
        cst1.setInt(2,6);
        cst1.setInt(3,-4);

        //5th Step: Use execute() method to get result for the specific values.
        cst1.execute();

        //6th Step: To see the results on console use "sout"
        System.out.println(cst1.getObject(1));


        //2.Example: Create a function which calculates the volume of cone
        //1st Step: Type code to create function
        String sql2 = "CREATE OR REPLACE FUNCTION volumeOfConeF(r NUMERIC, h NUMERIC) RETURNS NUMERIC LANGUAGE plpgsql AS $$ BEGIN RETURN 3.14*r*r*h/3; END $$";

        //2nd Step: Execute the function
        st.execute(sql2);

        //3rd Step: Prepare CallableStatement
        CallableStatement cst2 = con.prepareCall("{? = call volumeOfConeF(?, ?) }");

        //4th Step: Use registerOutParameter() method for result container, use set() method for parameters
        cst2.registerOutParameter(1,Types.NUMERIC);
        cst2.setInt(2,2);
        cst2.setInt(3,5);

        //5th Step: Use execute() method to get result for the specific values.
        cst2.execute();

        //6th Step: To see the results on console use "sout"
        System.out.printf("%.2f",cst2.getObject(1));

        con.close();
        st.close();
        cst1.close();
        cst2.close();

    }

}