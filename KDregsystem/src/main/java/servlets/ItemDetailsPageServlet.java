package servlets;

import classes.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

import static servlets.DBConnectionServlet.getStatement;

public class ItemDetailsPageServlet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Product curritem = (Product) session.getAttribute("item");
        if(curritem != null) {
            session.removeAttribute("item");
        }
        try {
            con = DBConnectionServlet.DBConnection();
            stmt = getStatement(con);
            ResultSet res;
            String reqid = req.getParameter("id");
            res = stmt.executeQuery("SELECT * FROM products WHERE Id = "+ reqid);
            if (res != null) {
                Product item = new Product(res.getInt("Id"), res.getString("Name"), res.getInt("Price"), res.getString("Description"));
                session.setAttribute("item", item);
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product.jsp");
        requestDispatcher.forward(req, resp);
    }
}
