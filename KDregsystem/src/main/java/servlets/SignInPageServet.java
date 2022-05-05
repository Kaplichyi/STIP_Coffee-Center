package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import classes.User;

public class SignInPageServet extends HttpServlet {
    Connection con;
    Statement stmt;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        try {
            con = DBConnectionServlet.DBConnection();
            stmt = DBConnectionServlet.getStatement(con);
            String Login, Password;
            Login = req.getParameter("login");
            Password = req.getParameter("password");
            ResultSet res = stmt.executeQuery("SELECT * FROM users WHERE Login = '" + Login + "' AND Password = '" + Password + "'");
            if (res.getString("ID") != null) {
                HttpSession session = req.getSession();
                User curruser = new User(res.getString("ID"), res.getString("Login"), res.getString("Name"), res.getString("Password"), res.getString("EMail"), res.getString("Role"));

                Cookie name = new Cookie("name", res.getString("Name"));
                Cookie gender = new Cookie("gender", res.getString("Gender"));
                Cookie bday = new Cookie("bday", res.getString("BDay"));

                name.setMaxAge(60*60*1); // Cookie действуют час
                gender.setMaxAge(60*60*1);
                bday.setMaxAge(60*60*1);

                resp.addCookie(name);
                resp.addCookie(gender);
                resp.addCookie(bday);

                session.setAttribute("user", curruser);

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("personal_account.jsp");
                requestDispatcher.forward(req, resp);
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("signin.jsp");
        requestDispatcher.forward(req, resp);
        out.close();
    }
}
