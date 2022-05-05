package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class SendChatMessageServlet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        try {
            con = DBConnectionServlet.DBConnection();
            stmt = DBConnectionServlet.getStatement(con);
            String username = req.getParameter("username");
            String message = req.getParameter("message");
            stmt.executeUpdate("INSERT INTO messages (Username, Message) values ('" + username + "', '" + message + "')");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/chat");
        requestDispatcher.forward(req, resp);
    }
}
