package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

public class SignUpServlet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        try {
            con = DBConnectionServlet.DBConnection();
            stmt = DBConnectionServlet.getStatement(con);
            String Login, Password, Name, EMail, Gender, BDay, Mailing;
            Login = req.getParameter("login");
            Password = req.getParameter("password");
            Name = req.getParameter("name");
            EMail = req.getParameter("email");
            Gender = req.getParameter("gender");
            BDay = req.getParameter("bday");
            Mailing = req.getParameter("mailing");
            if(Login.length() > 3 || Password.length() > 3 || Name.length() > 3 || EMail.length() > 3)
            {
                stmt.executeUpdate("INSERT INTO users (Login, Password, Name, EMail, Gender, BDay, Mailing) values ('" + Login + "', '" + Password + "', '" + Name + "', '" + EMail + "', '" + Gender + "', '" + BDay + "', '" + Mailing + "')");
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("signin.jsp");
        requestDispatcher.forward(req, resp);
    }
}
