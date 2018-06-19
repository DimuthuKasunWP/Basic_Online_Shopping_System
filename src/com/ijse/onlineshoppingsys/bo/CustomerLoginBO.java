package com.ijse.onlineshoppingsys.bo;

public class CustomerLoginBO {
    private String username;
    private String password;
    private int cust_id;

    public CustomerLoginBO(String username, String password, int cust_id) {
        this.username = username;
        this.password = password;
        this.cust_id = cust_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getCust_id() {
        return cust_id;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }
}
