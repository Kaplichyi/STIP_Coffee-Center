package servlets;

import classes.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class AuthPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");
        User curruser = (User)session.getAttribute("user");

        if(curruser == null) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("signin.jsp");
            requestDispatcher.forward(req, resp);
        }
        else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("personal_account.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
}
