package servlets;

import classes.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class ProductsMenuPageServlet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        ArrayList<Product> products = new ArrayList<Product>();
        try {
            con = DBConnectionServlet.DBConnection();
            stmt = DBConnectionServlet.getStatement(con);
            ResultSet res;
            String searchreq = req.getParameter("searchreq");
            if (searchreq != null)
                res = stmt.executeQuery("SELECT * FROM products WHERE Name LIKE '%" + searchreq + "%'");
            else
                res = stmt.executeQuery("SELECT * FROM products");
            while(res.next()){
                Integer id = res.getInt(1);
                String name = res.getString(2);
                Integer price = res.getInt(3);
                String description = res.getString(4);
                Product product = new Product(id, name, price, description);
                products.add(product);
            }
            req.setAttribute("products", products);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("menu.jsp");
        requestDispatcher.forward(req, resp);
    }
}
