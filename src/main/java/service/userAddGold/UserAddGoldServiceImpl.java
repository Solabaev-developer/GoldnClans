package service.userAddGold;

import config.Constants;
import entity.Clan;
import entity.User;
import service.clan.ClanService;
import service.support.Support;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class UserAddGoldServiceImpl implements UserAddGoldService{
    private final ClanService clans;
    private final Connection connection;
    private final Support support;

    public UserAddGoldServiceImpl(ClanService clans, Connection connection, Support support) {
        this.clans = clans;
        this.connection = connection;
        this.support = support;
    }

    @Override
    public void addGoldToClan(User user, BigDecimal gold) {
        Clan clan = clans.getClan(user.getClan());
        Thread thread = new Thread(() -> {
            try {
                PreparedStatement statement = connection.prepareStatement(Constants.SQL_INPUT_GOLD);
                statement.setBigDecimal(1, gold);
                statement.setInt(2, user.getClan());
                statement.executeUpdate();
                statement = connection.prepareStatement(Constants.SQL_DEC_USER_GOLD);
                statement.setBigDecimal(1, gold);
                statement.setInt(2, user.getId());
                statement.executeUpdate();
                support.addGoldFromUser(user, gold);
                System.out.println("Пользователь " + user.getNickName() + "" +
                        " добавил золото: " + gold + "" +
                        " в клан " + clan.getName());
            } catch (SQLException e) {
                System.out.println("Connection Failed");
                e.printStackTrace();
            }
        });
        thread.start();
    }
}
