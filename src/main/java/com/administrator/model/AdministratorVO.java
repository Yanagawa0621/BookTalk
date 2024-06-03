package com.administrator.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
public class AdministratorVO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "account", nullable = false, unique = true)
    private String account;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "passcode", nullable = false)
    private String passcode;

    // Getters and Setters
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPasscode() {
        return passcode;
    }

    public void setPasscode(String passcode) {
        this.passcode = passcode;
    }
}
