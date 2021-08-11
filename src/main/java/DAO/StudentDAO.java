package DAO;

import model.Student;
import utils.MySQLConnUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO implements IStudentDAO{

    public StudentDAO() {

    }

    @Override
    public void insertStudent(Student student) throws SQLException {
        String INSERT_STUDENT_SQL = "INSERT INTO students (name_stu, gender, dob, email, address, phoneNum, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?);";

        Connection connection = MySQLConnUtils.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_STUDENT_SQL);

            ps.setString(1, student.getName());
            ps.setInt(2, student.getGender());
            ps.setString(3, student.getDob());
            ps.setString(4, student.getMail());
            ps.setString(5, student.getAddress());
            ps.setString(6, student.getPhoneNum());
            ps.setInt(7, student.getStatus());

            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException ex){
            printSQLException(ex);
        }
    }


    @Override
    public Student selectStudent(String id) {
        String SELECT_STUDENT_SQL_BY_ID = "SELECT id, name_stu, gender, dob, email, address, phoneNum, status, image " +
                "FROM students WHERE id = ?;";
        Student student = null;

        Connection connection = MySQLConnUtils.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_STUDENT_SQL_BY_ID);
            ps.setString(1, id);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int idDB = rs.getInt("id");
                String name_stu = rs.getString("name_stu");
                int gender = rs.getInt("gender");
                String dob = rs.getString("dob");
                String mail = rs.getString("email");
                String address = rs.getString("address");
                String phoneNum = rs.getString("phoneNum");
                int status = rs.getInt("status");
                String image = rs.getString("image");
                student = new Student(idDB, name_stu, gender, dob, mail, address, phoneNum, status, image);
            }
        } catch (SQLException ex){
            printSQLException(ex);
        }

        return student;
    }

    @Override
    public List<Student> selectAllStudents() {
        String SELECT_ALL_STUDENT_SQL = "SELECT id, name_stu, gender, dob, email, address, phoneNum, status FROM students ORDER BY id desc;";
        List<Student> students = new ArrayList<>();

        Connection connection = MySQLConnUtils.getConnection();
        System.out.println(connection);
        try {
            PreparedStatement ps =connection.prepareStatement(SELECT_ALL_STUDENT_SQL);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name_stu = rs.getString("name_stu");
                int gender = rs.getInt("gender");
                String dob = rs.getString("dob");
                String mail = rs.getString("email");
                String address = rs.getString("address");
                String phoneNum = rs.getString("phoneNum");
                int status = rs.getInt("status");

                students.add(new Student(id, name_stu, gender, dob, mail, address, phoneNum, status));
            }
        } catch (SQLException ex){
            printSQLException(ex);
        }

        return students;
    }

//    @Override
//    public List<Student> selectAllStudentsExceptId(int id) {
//        return null;
//    }

    @Override
    public boolean deleteStudent(String id) throws SQLException {
        boolean check = false;
        String DELETE_STUDENT_SQL = "DELETE FROM students WHERE id = ?";
        Connection connection = MySQLConnUtils.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_STUDENT_SQL);
            ps.setString(1, id);
            check = ps.executeUpdate() > 0;
        }catch (SQLException ex){
            printSQLException(ex);
        }
        return check;
    }

    @Override
    public boolean updateStudent(Student student) throws SQLException {
        boolean update = false;
        String UPDATE_STUDENT_SQL = "UPDATE students SET name_stu = ?, gender = ?, dob = ?, email = ?, " +
                "address = ?, phoneNum = ?, status = ?, image = ? WHERE id = ?";
        Connection connection = MySQLConnUtils.getConnection();

        try {
            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(UPDATE_STUDENT_SQL);

            ps.setString(1, student.getName());
            ps.setInt(2, student.getGender());
            ps.setString(3, student.getDob());
            ps.setString(4, student.getMail());
            ps.setString(5, student.getAddress());
            ps.setString(6,student.getPhoneNum());
            ps.setInt(7, student.getStatus());
            ps.setString(8, student.getImage());
            ps.setInt(9, student.getId());
            ps.executeUpdate();

            connection.commit();
            connection.setAutoCommit(true);
            update = true;
        } catch (SQLException ex){
            connection.rollback();
            printSQLException(ex);
        }

        return update;
    }

    @Override
    public List<Student> searchStudent(String searchName) throws SQLException {
        String SEARCH_STUDENT_SQL = "SELECT id, name_stu, gender, dob, email, address, phoneNum, status FROM students WHERE name_stu LIKE ?;";
        List<Student> students = new ArrayList<>();
        Connection connection = MySQLConnUtils.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_STUDENT_SQL);
            ps.setString(1,"%" + searchName + "%");
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name_stu = rs.getString("name_stu");
                int gender = rs.getInt("gender");
                String dob = rs.getString("dob");
                String mail = rs.getString("email");
                String address = rs.getString("address");
                String phoneNum = rs.getString("phoneNum");
                int status = rs.getInt("status");

                students.add(new Student(id, name_stu, gender, dob, mail, address, phoneNum, status));
            }

        } catch (SQLException ex){
            printSQLException(ex);
        }
        return students;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
