package com.administrator.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "administrator")
public class AdministratorVO {
    
    @Id
    private String account;
    private String name;
    private String passcode;
    private int number;

    // getters and setters
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
