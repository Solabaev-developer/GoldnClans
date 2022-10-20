package config;

public class Constants {
    public static final String SQL_INPUT_GOLD = "UPDATE main.clans SET gold = gold + ? WHERE id = ?";
    public static final String SQL_DEC_USER_GOLD = "UPDATE main.users SET gold = gold - ? WHERE id = ?";
    public static final String SQL_INC_USER_GOLD = "UPDATE main.users SET gold = gold + ? WHERE id = ?";
    public static final String SQL_GET_CLAN = "SELECT * FROM main.clans WHERE id = ?";
    public static final String SQL_SELECT_USERS = "Select * from main.v_users";
    public static final String SQL_SUPPORT_ADD = "INSERT INTO main.supports" +
            " (clanname, gold, reason, userId, goldBefore, goldAfter)" +
            " VALUES (?, ?, ?, ?, ?, ?) ";
}
