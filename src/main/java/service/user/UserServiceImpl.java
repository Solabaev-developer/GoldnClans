package service.user;

import config.DatabaseConfig;
import entity.User;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {
    private static final String SQL_SELECT = "Select * from main.v_users";
    private static List userList = new ArrayList<User>();

    @Override
    public ArrayList<User> getAllUsers(Connection connection) {
        DatabaseConfig dbConfig = new DatabaseConfig();
        Connection conn = dbConfig.connectToDb();
        try {
            PreparedStatement statement = conn.prepareStatement(SQL_SELECT);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Integer id = resultSet.getInt("id");
                String nickName = resultSet.getString("nickname");
                BigDecimal gold = resultSet.getBigDecimal("gold");
                Integer clan = resultSet.getInt("clan");
                String clanName = resultSet.getString("clanname");
                Integer power = resultSet.getInt("power");

                User user = new User();
                user.setId(id);
                user.setNickName(nickName);
                user.setGold(gold);
                user.setClan(clan);
                user.setClanName(clanName);
                user.setPower(power);

                userList.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Connection Failed");
            e.printStackTrace();
            return null;
        }
        return (ArrayList<User>) userList;
    }
}
