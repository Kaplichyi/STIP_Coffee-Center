package servlets;

import classes.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;

import static servlets.DBConnectionServlet.getStatement;

public class SendOrderServlet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        try {
            con = DBConnectionServlet.DBConnection();
            stmt = getStatement(con);
            String Id = req.getParameter("id");
            String Amount = req.getParameter("amount");
            HttpSession session = req.getSession();
            User curruser = (User)session.getAttribute("user");
            Date date = new Date();
            stmt.executeUpdate("INSERT INTO orders (Product_Id, Amount, Customer_ID, Customer_Name, Order_Date) values ('" + Id + "', '" + Amount + "', '" + curruser.getId() + "', '" + curruser.getName() + "', '" + date.toString() + "')");
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/menu");
        requestDispatcher.forward(req, resp);
    }
}
