package service.battle;

import entity.User;
import service.clan.ClanService;

public class BattleServiceImpl implements BattleService {
    private final ClanService clans;

    public BattleServiceImpl(ClanService clans) {
        this.clans = clans;
    }

    @Override
    public void completeBattle(User user1, User user2) {
        // ...

        // if (success)
        {
            //Clan clan = clans.get(clanId);
            // clan.[gold] += gold;
            // как-то сохранить изменения
        }
    }
}
