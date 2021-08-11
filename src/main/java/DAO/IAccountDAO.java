package DAO;

import model.Account;
import model.Student;

public interface IAccountDAO {
    public Account selectAccount(String username, String password);

}
