package service.support;

import config.Constants;
import entity.Clan;
import entity.User;
import service.clan.ClanService;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SupportImpl implements Support{
    private final ClanService clans;
    private final Connection connection;

    public SupportImpl(ClanService clans, Connection connection) {
        this.clans = clans;
        this.connection = connection;
    }

    @Override
    public void addGoldFromBattle(User user, BigDecimal gold) {
        Clan clan = clans.getClan(user.getClan());
        try {
            PreparedStatement statement = connection.prepareStatement(Constants.SQL_SUPPORT_ADD);
            statement.setString(1, clan.getName());
            statement.setBigDecimal(2, gold);
            statement.setString(3, "Пользователь победил в битве");
            statement.setInt(4, user.getId());
            statement.setBigDecimal(5, clan.getGold().subtract(gold));
            statement.setBigDecimal(6, clan.getGold());
            statement.execute();
        } catch (SQLException e) {
            System.out.println("Connection Failed");
            e.printStackTrace();
        }
    }

    @Override
    public void addGoldFromUser(User user, BigDecimal gold) {
        Clan clan = clans.getClan(user.getClan());
        try {
            PreparedStatement statement = connection.prepareStatement(Constants.SQL_SUPPORT_ADD);
            statement.setString(1, clan.getName());
            statement.setBigDecimal(2, gold);
            statement.setString(3, "Пользователь добавил в золото в казну");
            statement.setInt(4, user.getId());
            statement.setBigDecimal(5, clan.getGold().subtract(gold));
            statement.setBigDecimal(6, clan.getGold());
            statement.execute();
        } catch (SQLException e) {
            System.out.println("Connection Failed");
            e.printStackTrace();
        }
    }
}
