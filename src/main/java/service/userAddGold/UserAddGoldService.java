package service.userAddGold;

import entity.User;

import java.math.BigDecimal;
import java.sql.Connection;

public interface UserAddGoldService {

    public void addGoldToClan(User user, BigDecimal gold);
}
