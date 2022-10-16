package service.user;

import entity.User;

import java.sql.Connection;
import java.util.ArrayList;

public interface UserService {

    public ArrayList<User> getAllUsers(Connection connection);
}
