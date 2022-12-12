import java.sql.Connection;

public class Runner {

    public static void main(String[] args) {
        //1.Step Registration to the driver.
        //2.Step Create connection with database
        JdbcUtils.connectToDatabase("localhost", "postgres", "postgres", "1234");

        //3.Step Create Statement
        JdbcUtils.createStatement();

        //4.Step Execute the query
        //JdbcUtils.createTable("Students", "name varchar(50)", "id int", "address varchar", "tel bigint");

        JdbcUtils.insertDataIntoTable("Students","name 'John'");
        JdbcUtils.insertDataIntoTable("Students","name 'Mark'","id 123","tel 1234567890","address 'Ankara'");

        //JdbcUtils.dropTable("Students");

        //5.Step Close the connection and statement
        JdbcUtils.closeConnectionAndStatement();






    }
}
