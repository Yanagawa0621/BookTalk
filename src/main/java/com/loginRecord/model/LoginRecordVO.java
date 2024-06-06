package com.loginRecord.model;

import java.util.Date;
import javax.persistence.*;
import com.user.model.UserVO;
import com.administrator.model.AdministratorVO;

@Entity
@Table(name = "login_record")
public class LoginRecordVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "number")
    private Integer number;

    @ManyToOne
    @JoinColumn(name = "userNumber", referencedColumnName = "number", insertable = false, updatable = false)
    private UserVO user;

    @ManyToOne
    @JoinColumn(name = "adminNumber", referencedColumnName = "number", insertable = false, updatable = false)
    private AdministratorVO admin;

    @Column(name = "userNumber")
    private Integer userNumber;

    @Column(name = "adminNumber")
    private Integer adminNumber;

    @Column(name = "loginTime")
    private Date loginTime;

    @Column(name = "ip")
    private String ip;

    @Column(name = "area")
    private String area;

    @Column(name = "userType")
    private String userType;

    // Getters and Setters

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public UserVO getUser() {
        return user;
    }

    public void setUser(UserVO user) {
        this.user = user;
        if (user != null) {
            this.userNumber = user.getNumber();
        }
    }

    public AdministratorVO getAdmin() {
        return admin;
    }

    public void setAdmin(AdministratorVO admin) {
        this.admin = admin;
        if (admin != null) {
            this.adminNumber = admin.getNumber();
        }
    }

    public Integer getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(Integer userNumber) {
        this.userNumber = userNumber;
    }

    public Integer getAdminNumber() {
        return adminNumber;
    }

    public void setAdminNumber(Integer adminNumber) {
        this.adminNumber = adminNumber;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
}
