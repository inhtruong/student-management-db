package DAO;

import model.Student;

import java.sql.SQLException;
import java.util.List;

public interface IStudentDAO {
    public void insertStudent(Student student) throws SQLException;



    public Student selectStudent(String id);

    public List<Student> selectAllStudents();


//    public List<Student> selectAllStudentsExceptId (int id);

    public boolean deleteStudent(String id) throws SQLException;

    public boolean updateStudent(Student student) throws SQLException;

    public List<Student> searchStudent(String searchName) throws SQLException;

//    public int paginationPage() throws SQLException;
}
