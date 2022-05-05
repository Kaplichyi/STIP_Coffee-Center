package servlets;

import classes.Order;
import classes.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class OrdersPageServlet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User curruser = (User) session.getAttribute("user");
        if (curruser.getRole().equals("Employee")) {
            ArrayList<Order> orders = new ArrayList<Order>();
            try {
                con = DBConnectionServlet.DBConnection();
                stmt = DBConnectionServlet.getStatement(con);
                ResultSet res;
                res = stmt.executeQuery("SELECT * FROM orders");
                while (res.next()) {
                    String id = Integer.toString(res.getInt(1));
                    String product_Id = res.getString(2);
                    String amount = res.getString(3);
                    String customer_ID = res.getString(4);
                    String customer_Name = res.getString(5);
                    String order_Date = res.getString(6);
                    Order order = new Order(id, product_Id, amount, customer_ID, customer_Name, order_Date);
                    orders.add(order);
                }
                req.setAttribute("orders", orders);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("orders.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
}