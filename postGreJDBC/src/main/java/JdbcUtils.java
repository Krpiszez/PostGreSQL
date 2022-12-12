import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JdbcUtils {

    private static Connection connection;
    private static Statement statement;
    //1.Step Registration to the driver.
    //2.Step Create connection with database
    public static Connection connectToDatabase(String hostName, String databaseName, String username, String password){

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try {
            connection = DriverManager.getConnection("jdbc:postgresql://"+hostName+":5432/"+databaseName, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Connection is success");
        return connection;
    }

    //3.Step Create Statement
    public static Statement createStatement(){

        try {
            statement = connection.createStatement();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Statement created");
        return statement;
    }

    //4.Step Execute the query
    public static boolean execute(String query){
        boolean isExecute;

        try {
            isExecute = statement.execute(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Query Executed");
        return isExecute;
    }

    //5.Step Close the connection and statement
    public static void closeConnectionAndStatement() {

        try {
            connection.close();
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            if (connection .isClosed() && statement .isClosed()) {
                System.out.println("Connection and statement are closed");
            }else {
                System.out.println("\"Connection and statement are not closed");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void dropTable(String tableName){

        try {
            statement.execute("drop table "+tableName);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Table " + tableName + " dropped!");
    }

    //The method to create table
    public static void createTable(String tableName, String... columnName_DataType){
        StringBuilder columnName_DataTypeString = new StringBuilder();
        for (String w: columnName_DataType){
            columnName_DataTypeString.append(w).append(",");
        }
        columnName_DataTypeString.deleteCharAt(columnName_DataTypeString.lastIndexOf(","));
        try {
            statement.executeUpdate("create table "+tableName+" ("+columnName_DataTypeString+");");
            System.out.println("Table "+tableName+" created!");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //The method to insert data into table
    public static void insertDataIntoTable(String tableName, String... columnName_Value){
        StringBuilder columnNames = new StringBuilder();
        StringBuilder values = new StringBuilder();
        for (String w: columnName_Value){
            columnNames.append(w.split(" ")[0]).append(",");
            values.append(w.split(" ")[1]).append(",");
        }
        //"INSERT INTO "+tableName+"(id, name, address) VALUES(123, 'john', 'new york')"
        columnNames.deleteCharAt(columnNames.lastIndexOf(","));
        values.deleteCharAt(values.lastIndexOf(","));

        String query = "insert into "+tableName+"("+columnNames+") values("+values+")";

        try {
            statement.execute(query);
            System.out.println("Data inserted into "+tableName+" table!");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Object> getColumnList(String columnName, String tableName){
        ResultSet resultSet = null;
        List<Object> columnData = new ArrayList<>();
        String query = "select "+columnName+" from "+tableName;

        try {
            resultSet = statement.executeQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        while(true){
            try {
                if (!resultSet.next()) break;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                columnData.add(resultSet.getObject(1));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return columnData;
    }
}
