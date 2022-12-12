import org.junit.jupiter.api.Test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class RoomTest {
    /*
   Given
     User connects to the database
     (Host name: medunna.com, Database name: medunna_db, Usename: medunna_user, Password: medunna_pass_987))

   When
     User sends the query to get the names of created_by column from "room" table

   Then
     Verify that there are some rooms created by "john doe".

   And
     User closes the connection
  */
    @Test
    public void roomTest() throws SQLException {

        JdbcUtils.connectToDatabase("medunna.com", "medunna_db", "medunna_user", "medunna_pass_987");
        ResultSet rs = JdbcUtils.createStatement().executeQuery("select created_by from room");
        List<String> created_by = new ArrayList<>();
        while (rs.next()){
            created_by.add(rs.getString(1));
        }
        System.out.println(created_by);
        List<String> actualData = created_by.stream().filter(t-> t.contains("john_doe")).collect(Collectors.toList());
        assertTrue(actualData.size()>0);



    }
}
