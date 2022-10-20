package service.support;

import entity.User;

import java.math.BigDecimal;

public interface Support {

    public void addGoldFromBattle(User user, BigDecimal gold);

    public void addGoldFromUser(User user, BigDecimal gold);
}
