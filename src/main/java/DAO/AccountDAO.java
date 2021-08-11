package DAO;

import model.Account;

import java.sql.*;

public class AccountDAO implements IAccountDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_management?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Inhtruong@123";

    public AccountDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public Account selectAccount(String username, String password) {
        String SELECT_ACCOUNT_SQL = "SELECT * FROM accounts\n" +
                "WHERE username = ? \n" +
                "AND `password` = ?;";
        Account account = null;

        Connection connection = getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ACCOUNT_SQL);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String user = rs.getString(2);
                String pass = rs.getString(3);
                int idRole = rs.getInt(4);

                account = new Account(id, user, pass, idRole);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return account;
    }
}
