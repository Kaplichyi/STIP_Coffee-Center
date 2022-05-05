package servlets;

import classes.Product;
import classes.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

public class DeleteProductServlet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Product curritem = (Product) session.getAttribute("item");
        User curruser = (User) session.getAttribute("user");
        if (curruser.getRole().equals("Employee")) {
            if (curritem != null) {
                session.removeAttribute("item");
            }
            try {
                con = DBConnectionServlet.DBConnection();
                stmt = DBConnectionServlet.getStatement(con);
                String reqid = req.getParameter("id");
                stmt.executeUpdate("DELETE FROM products WHERE Id = " + reqid);
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
