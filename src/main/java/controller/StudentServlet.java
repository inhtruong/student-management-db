package controller;

import DAO.AccountDAO;
import DAO.StudentDAO;
import model.Account;
import model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet (name = "StudentServlet", urlPatterns = "/student")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();
    private AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("acc");
        String password = (String) session.getAttribute("pass");

        Account account = accountDAO.selectAccount(username, password);
        if (account == null) {
            response.sendRedirect("/login");
        } else {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            try {
                switch (action) {
                    case "create":
                        showCreateStudent(request, response);
                        break;
                    case "edit":
                        showEditStudent(request, response);
                        break;
//                case "delete":
//                    deleteStudent(request, response);
//                    break;
                    case "info":
                        showInfoStudent(request, response);
                        break;
                    default:
                        listStudent(request, response);
                        break;
                }
            } catch (SQLException ex) {
                throw new ServletException(ex);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createStudent(request, response);
                    break;
                case "edit":
                    updateStudent(request, response);
                    break;
                case "search":
                    searchStudent(request, response);
                    break;
                case "delete":
                    deleteStudent(request, response);
                    break;
                default:
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }



    private void listStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Student> studentList = studentDAO.selectAllStudents();
        System.out.println(studentList.size());
        request.setAttribute("listStudent", studentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/student.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        Student existStudent = studentDAO.selectStudent(id);

        if (existStudent == null) {
            response.sendRedirect("/error-404.jsp");
        } else {
            request.setAttribute("student", existStudent);
            RequestDispatcher dispatcher = request.getRequestDispatcher("student/edit.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showInfoStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        Student existStudent = studentDAO.selectStudent(id);

        if (existStudent == null) {
            response.sendRedirect("/error-404.jsp");
        } else {
            request.setAttribute("student", existStudent);
            RequestDispatcher dispatcher = request.getRequestDispatcher("student/information.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showError404(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("error-404.jsp");
        dispatcher.forward(request, response);
    }


    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");

        if (studentDAO.selectStudent(id) == null) {
            request.setAttribute("success", null);
            request.setAttribute("error", "This student does not exist in the system");
            request.setAttribute("warning", null);

            listStudent(request, response);
        } else {
            studentDAO.deleteStudent(id);
            request.setAttribute("success", "Student has been deleted");
            request.setAttribute("error", null);
            request.setAttribute("warning", null);

            listStudent(request, response);
        }
    }

    private void createStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String nameStu = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String mail = request.getParameter("mail");
        String address = request.getParameter("address");
        String phoneNum = request.getParameter("phoneNum");

        if (nameStu.equals("") || gender.equals("") || dob.equals("") || mail.equals("") || address.equals("") || phoneNum.equals("")) {
            request.setAttribute("success", null);
            request.setAttribute("error", "Bad or missing input information!");
            request.setAttribute("warning", null);
            showCreateStudent(request, response);
        } else if (!checkInput.validateName(nameStu)) {
            request.setAttribute("success", null);
            request.setAttribute("error", null);
            request.setAttribute("warning", "Invalid name value");
            showCreateStudent(request, response);
        } else if (checkInput.validateDob(dob)) {
            request.setAttribute("success", null);
            request.setAttribute("error", null);
            request.setAttribute("warning", "Invalid date of birth value");
            showCreateStudent(request, response);
        } else if (!checkInput.validateMail(mail)) {
            request.setAttribute("success", null);
            request.setAttribute("error", null);
            request.setAttribute("warning", "Invalid email value");
            showCreateStudent(request, response);
        } else if (!checkInput.validatePhone(phoneNum)) {
            request.setAttribute("success", null);
            request.setAttribute("error", null);
            request.setAttribute("warning", "Invalid phone number value");
            showCreateStudent(request, response);
        } else {
            Student newStudent = new Student(nameStu, Integer.parseInt(gender), dob, mail, address, phoneNum, 1);
            studentDAO.insertStudent(newStudent);

            request.setAttribute("success", "New student was created");
            request.setAttribute("error", null);
            request.setAttribute("warning", null);
            showCreateStudent(request, response);
        }
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        String id = request.getParameter("id");
        String nameStu = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String mail = request.getParameter("mail");
        String address = request.getParameter("address");
        String phoneNum = request.getParameter("phoneNum");
        String status = request.getParameter("status");
        String image = request.getParameter("image");

        if (nameStu.equals("") || gender.equals("") || dob.equals("") || mail.equals("") || address.equals("") || phoneNum.equals("")) {
            request.setAttribute("success", null);
            request.setAttribute("error", "Bad or missing input information!");
            request.setAttribute("warning", null);
            showEditStudent(request, response);
        } else if (!checkInput.validateName(nameStu)) {
            request.setAttribute("success", null);
            request.setAttribute("error", null);
            request.setAttribute("warning", "Invalid name value");
            showEditStudent(request, response);
        } else if (checkInput.validateDob(dob)) {
            request.setAttribute("success", null);
            request.setAttribute("error", null);
            request.setAttribute("warning", "Invalid date of birth value");
            showEditStudent(request, response);
        } else if (!checkInput.validateMail(mail)) {
            request.setAttribute("success", null);
            request.setAttribute("error", null);
            request.setAttribute("warning", "Invalid email value");
            showEditStudent(request, response);
        } else if (!checkInput.validatePhone(phoneNum)) {
            request.setAttribute("success", null);
            request.setAttribute("error", null);
            request.setAttribute("warning", "Invalid phone number value");
            showEditStudent(request, response);
        } else {
            Student newStudent = new Student(Integer.parseInt(id), nameStu,
                    Integer.parseInt(gender), dob, mail, address, phoneNum, Integer.parseInt(status), image);
            studentDAO.updateStudent(newStudent);

            request.setAttribute("success", "New student was created");
            request.setAttribute("error", null);
            request.setAttribute("warning", null);
            showEditStudent(request, response);
        }
    }

    private void searchStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        String str = request.getParameter("string-search");
        List<Student> studentList = studentDAO.searchStudent(str);
        if (studentList == null) {
            request.setAttribute("success", null);
            request.setAttribute("error", "This student is not on the list");
            request.setAttribute("warning", null);

            request.setAttribute("listStudent", studentList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("student/student.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("listStudent", studentList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("student/student.jsp");
            dispatcher.forward(request, response);
        }
    }


}
