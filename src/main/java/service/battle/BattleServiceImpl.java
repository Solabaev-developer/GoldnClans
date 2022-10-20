package service.battle;

import config.Constants;
import entity.Clan;
import entity.User;
import service.clan.ClanService;
import service.support.Support;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BattleServiceImpl implements BattleService {
    private final ClanService clans;
    private final Connection connection;
    private final Support support;

    public BattleServiceImpl(ClanService clans, Connection connection, Support support) {
        this.clans = clans;
        this.connection = connection;
        this.support = support;
    }

    @Override
    public void completeBattle(User user1, User user2) {
        Clan clan1 = clans.getClan(user1.getClan());
        if (user1.getPower().equals(user2.getPower())) {
            System.out.println(user1.getNickName() + " и " + user2.getNickName() + " не выявили победителя");
            return;
        }
        Thread thread = new Thread(() -> {
            if (user1.getPower() > user2.getPower()) {
                try {
                    PreparedStatement statement = connection.prepareStatement(Constants.SQL_INPUT_GOLD);
                    statement.setBigDecimal(1, new BigDecimal(500));
                    statement.setInt(2, user1.getClan());
                    statement.executeUpdate();
                    statement = connection.prepareStatement(Constants.SQL_DEC_USER_GOLD);
                    statement.setBigDecimal(1, new BigDecimal(500));
                    statement.setInt(2, user2.getId());
                    statement.executeUpdate();
                    statement = connection.prepareStatement(Constants.SQL_INC_USER_GOLD);
                    statement.setBigDecimal(1, new BigDecimal(500));
                    statement.setInt(2, user1.getId());
                    statement.executeUpdate();
                    support.addGoldFromBattle(user1, new BigDecimal(500));
                    System.out.println(user1.getNickName()
                            + " побеждает в схватке с "
                            + user2.getNickName() + " и получает 500 золота и 500 золота клан");
                } catch (SQLException e) {
                    System.out.println("Connection Failed");
                    e.printStackTrace();
                }
            }
            else {
                try {
                    PreparedStatement statement = connection.prepareStatement(Constants.SQL_INPUT_GOLD);
                    statement.setBigDecimal(1, new BigDecimal(500));
                    statement.setInt(2, user2.getClan());
                    statement.executeUpdate();
                    statement = connection.prepareStatement(Constants.SQL_DEC_USER_GOLD);
                    statement.setBigDecimal(1, new BigDecimal(500));
                    statement.setInt(2, user1.getId());
                    statement.executeUpdate();
                    statement = connection.prepareStatement(Constants.SQL_INC_USER_GOLD);
                    statement.setBigDecimal(1, new BigDecimal(500));
                    statement.setInt(2, user2.getId());
                    statement.executeUpdate();
                    support.addGoldFromBattle(user2, new BigDecimal(500));
                    System.out.println(user2.getNickName()
                            + " побеждает в схватке с "
                            + user1.getNickName() + " и получает 500 золота и 500 золота клан");
                } catch (SQLException e) {
                    System.out.println("Connection Failed");
                    e.printStackTrace();
                }
            }
        });
       thread.start();
    }
}
