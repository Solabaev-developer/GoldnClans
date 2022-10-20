import config.DatabaseConfig;
import entity.User;
import service.battle.BattleService;
import service.battle.BattleServiceImpl;
import service.clan.ClanService;
import service.clan.ClanServiceImpl;
import service.support.Support;
import service.support.SupportImpl;
import service.user.UserService;
import service.user.UserServiceImpl;
import service.userAddGold.UserAddGoldService;
import service.userAddGold.UserAddGoldServiceImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;

public class MainApplication {

    public static void main(String[] args) {
        DatabaseConfig dbConfig = new DatabaseConfig();
        Connection connection = dbConfig.connectToDb();
        UserService userService = new UserServiceImpl(connection);
        ArrayList<User> list = userService.getAllUsers();
        ClanService clanService = new ClanServiceImpl(connection);
        Support support = new SupportImpl(clanService, connection);
        UserAddGoldService addGoldService = new UserAddGoldServiceImpl(clanService, connection, support);
        list.forEach(x -> addGoldService.addGoldToClan(x, new BigDecimal(500)));
        for (User user1 : list) {
            for (User user2 : list) {
                BattleService battleService = new BattleServiceImpl(clanService, connection, support);
                if (user1.equals(user2)) {
                    continue;
                }
                battleService.completeBattle(user1, user2);
            }
        }
    }
}
