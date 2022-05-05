package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionServlet{

    public static Connection DBConnection() throws SQLException, ClassNotFoundException {
        String url = "jdbc:sqlite:D:\\userdata.db";
        String user = "root";
        String password = "";
        Class.forName("org.sqlite.JDBC");
        return DriverManager.getConnection(url, user, password);
    }
    public static Statement getStatement(Connection con) throws SQLException {
        return con.createStatement();
    }
}
