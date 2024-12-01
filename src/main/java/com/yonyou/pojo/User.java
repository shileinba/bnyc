package com.yonyou.pojo;

public class User {
    private int id;
    private String account;
    private int password;

    public User() {
    }

    public User(int id, String account, int password) {
        this.id = id;
        this.account = account;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }


    public String toString() {
        return "User{id = " + id + ", account = " + account + ", password = " + password + "}";
    }

}
