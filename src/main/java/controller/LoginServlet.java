package controller;


import DAO.AccountDAO;
import model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet (name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    AccountDAO accountDAO = new AccountDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Account account = accountDAO.selectAccount(username, password);
        if (username.equals("") || password.equals("")) {
            req.setAttribute("success", null);
            req.setAttribute("error", "This account is Invalid");
            req.setAttribute("warning", null);

            RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
            dispatcher.forward(req, resp);
        } else if (account == null) {
            req.setAttribute("success", null);
            req.setAttribute("error", "Wrong username or password");
            req.setAttribute("warning", null);

            RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
            dispatcher.forward(req, resp);
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("acc", username);
            session.setAttribute("pass", password);

            resp.sendRedirect("/student");
        }
    }
}
