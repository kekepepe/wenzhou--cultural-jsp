package com.wenzhou.model;

import java.io.Serializable;

public class User implements Serializable {
    private Integer id;
    private String username;
    private String password;
    private String realname;
    private String phone;
    private String email;
    private String address;
    private Integer isAdmin; // 0=User, 1=Admin

    public User() {
    }

    public User(Integer id, String username, String password, String realname, String phone, String email,
            String address, Integer isAdmin) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.realname = realname;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.isAdmin = isAdmin;
    }

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Integer isAdmin) {
        this.isAdmin = isAdmin;
    }
}
