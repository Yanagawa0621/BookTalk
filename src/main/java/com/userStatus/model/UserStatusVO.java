package com.userStatus.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_status")
public class UserStatusVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userStatus")
    private Integer userStatus;

    @Column(name = "statusName", length = 20)
    private String statusName;

    @Column(name = "statusDescribe", length = 50)
    private String statusDescribe;

    @Column(name = "statusDays")
    private Integer statusDays;

    public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getStatusDescribe() {
        return statusDescribe;
    }

    public void setStatusDescribe(String statusDescribe) {
        this.statusDescribe = statusDescribe;
    }

    public Integer getStatusDays() {
        return statusDays;
    }

    public void setStatusDays(Integer statusDays) {
        this.statusDays = statusDays;
    }
}
