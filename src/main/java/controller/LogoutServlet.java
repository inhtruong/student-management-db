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

@WebServlet (name = "LogoutServlet", urlPatterns = "/logout")
public class LogoutServlet extends HttpServlet {
    AccountDAO accountDAO = new AccountDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("acc");
        String password = (String) session.getAttribute("pass");

        Account account = accountDAO.selectAccount(username, password);
        if (account == null) {
            resp.sendRedirect("/index.jsp");
        } else {
            resp.sendRedirect("/student");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        RequestDispatcher dispatcher = req.getRequestDispatcher("/logout.jsp");
        dispatcher.forward(req, resp);
    }
}
