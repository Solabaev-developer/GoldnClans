package service.clan;

import config.Constants;
import entity.Clan;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClanServiceImpl implements ClanService {
    private final Connection connection;

    public ClanServiceImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public Clan getClan(Integer clanId) {
        Clan clan = new Clan();
        try {
            PreparedStatement statement = connection.prepareStatement(Constants.SQL_GET_CLAN);
            statement.setInt(1, clanId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Integer id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                BigDecimal gold = resultSet.getBigDecimal("gold");

                clan.setId(id);
                clan.setName(name);
                clan.setGold(gold);
            }
        } catch (SQLException e) {
            System.out.println("Connection Failed");
            e.printStackTrace();
            return null;
        }
        return clan;
    }
}
