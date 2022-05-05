package servlets;

import classes.Message;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ChatPageServlet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        ArrayList<Message> messages = new ArrayList<Message>();
        try {
            con = DBConnectionServlet.DBConnection();
            stmt = DBConnectionServlet.getStatement(con);
            ResultSet res;
            res = stmt.executeQuery("SELECT * FROM messages");
            while(res.next()){
                Integer id = res.getInt(1);
                String username = res.getString(2);
                String message = res.getString(3);
                Message product = new Message(id, username, message);
                messages.add(product);
            }
            req.setAttribute("messages", messages);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("chat.jsp");
        requestDispatcher.forward(req, resp);
    }
}
