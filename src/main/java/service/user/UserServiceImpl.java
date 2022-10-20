package service.user;

import config.Constants;
import entity.User;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserServiceImpl implements UserService {
    private final ArrayList<User> userList = new ArrayList<User>();
    private final Connection connection;

    public UserServiceImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public ArrayList<User> getAllUsers() {
        try {
            PreparedStatement statement = connection.prepareStatement(Constants.SQL_SELECT_USERS);
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
        return userList;
    }
}
