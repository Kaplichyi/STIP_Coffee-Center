package servlets;

import classes.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class AddNewProductServlet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User curruser = (User) session.getAttribute("user");
        if (curruser.getRole().equals("Employee")) {
            try {
                con = DBConnectionServlet.DBConnection();
                stmt = DBConnectionServlet.getStatement(con);
                String Name, Price, Description;
                Name = req.getParameter("name");
                Price = req.getParameter("price");
                Description = req.getParameter("description");
                stmt.executeUpdate("INSERT INTO products (Name, Price, Description) VALUES ('" + Name + "', '" + Price + "', '" + Description + "');");
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/menu");
        requestDispatcher.forward(req, resp);
    }
}