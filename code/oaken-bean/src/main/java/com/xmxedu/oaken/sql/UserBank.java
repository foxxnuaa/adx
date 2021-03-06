package com.xmxedu.oaken.sql;

/**
 * 用户银行
 * @version 1.0.0
 */
public class UserBank {

    public final static String TABLE_NAME = " `adx`.`tb_user_bank` ";
    public final static String ALL_COLUMN_NAME = " `id`,`name`,`address`,`account` ";

    public final static String COLUMN_ID = "id";
    public final static String COLUMN_NAME = "name";
    public final static String COLUMN_ADDRESS = "address";
    public final static String COLUMN_ACCOUNT = "account";

    // 数据库自增id
    private int id;
    // 银行名称
    private String name;
    // 银行开户地址
    private String address;
    // 银行账户
    private String account;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }
}
