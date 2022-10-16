package service.userAddGold;

import entity.User;
import service.clan.ClanService;

public class UserAddGoldServiceImpl implements UserAddGoldService{
    private static final String SQL_INPUT_GOLD = "UPDATE TABLE main.clans WHERE id :id SET gold = gold + :usergold";
    private final ClanService clans;

    public UserAddGoldServiceImpl(ClanService clans) {
        this.clans = clans;
    }

    @Override
    public void addGoldToClan(User user, int gold) {
        //Clan clan = clans.get(clanId);
        // clan.[gold] += gold;
        // как-то сохранить изменения
    }
}
